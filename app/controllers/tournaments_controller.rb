class TournamentsController < ApplicationController

  include Secured
  include TournamentsHelper

  before_action :is_admin_logged_in?, only: %i[edit destroy new create update]
  # GET /divisions/:division_id/tournaments
  # GET /divisions/:division_id/tournaments.xml
  def index
    #1st you retrieve the division thanks to params[:division_id]
    @division = Division.find(params[:division_id])
    #2nd you get all the tournaments of this division
    @tournaments = @division.tournaments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tournaments }
    end
  end

  # GET /divisions/:division_id/tournaments/:id
  # GET /tournaments/:id.xml
  def show
    #1st you retrieve the division thanks to params[:division_id]
    division = Division.find(params[:division_id])
    #2nd you retrieve the tournament thanks to params[:id]
    @tournament = division.tournaments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tournament }
    end
  end

  # GET /divisions/:division_id/tournaments/new
  # GET /divisions/:division_id/tournaments/new.xml
  def new
    #1st you retrieve the division thanks to params[:division_id]
    division = Division.find(params[:division_id])
    #2nd you build a new one
    @tournament = division.tournaments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tournament }
    end
  end

  def fixture
    division = Division.find(params[:division_id])
    @tournament = division.tournaments.find(params[:id])
    matches = @tournament.matches
    if matches.length > 0
      redirect_to([@tournament.division, @tournament], :notice => 'No se pudo crear el fixture inicial, ya existen partidos creados!')
    end
  end

  def new_fixture
    division = Division.find(params[:division_id])
    @tournament = division.tournaments.find(params[:id])
    teams = @tournament.teams.pluck(:id)

    addresses = (1..7).each.map{|i| params[:"address#{i}"]}
    communes = (1..7).each.map{|i| params[:"commune#{i}"]}
    places = (1..7).each.map{|i| params[:"place#{i}"]}
    dates = (1..7).each.map{|i| params[:"date#{i}"]}
    times = (1..7).each.map{|i| (1..4).map{|j| params[:"time#{(i-1)*4+j}"]}}

    failed = false
    hours = [0,0,0,0,0,0,0]
    for i in 0...teams.length
      for j in i+1...teams.length

        datenum = (i ^ j).to_i - 1

        date = date_format(dates[datenum],datenum+1)
        if params[:check_times] == "true"
          time = time_format(times[0][hours[datenum]], hours[datenum]+1, 1)
        else
          time = time_format(times[datenum][hours[datenum]], hours[datenum]+1, datenum+1)
        end

        hours[datenum] += 1

        if params[:check_locations] == "true"
          address = addresses[datenum]
          commune = communes[datenum]
          place = places[datenum]
        else
          address = addresses[0]
          commune = communes[0]
          place = places[0]
        end

        if j%2 != 0
          home_team = teams[i]
          away_team = teams[j]
        else
          home_team = teams[j]
          away_team = teams[i]
        end

        match = Match.new(date: date, time: time, visitor_goals: 0, local_goals: 0,
          played: false, visit_team_id: away_team, home_team_id: home_team, tournament_id: @tournament.id,
          datenum: datenum+1, address: address, commune: commune,place: place)

        p time
        p 'timetimetime'
        if !match.save
          failed = true
          break
        end
      end
    end
    respond_to do |format|
      if !failed
        format.html { redirect_to division_tournament_path, notice: 'Torneo creado correctamente' }
      else
        format.html { render :fixture }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }

      end
    end
  end

  # GET /divisions/:division_id/tournaments/:id/edit
  def edit
    division = Division.find(params[:division_id])
    @tournament = division.tournaments.find(params[:id])
  end

  def create
    division = Division.find(params[:division_id])
    @tournament = division.tournaments.create(tournament_params)
    respond_to do |format|
      if @tournament.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource tournament
        format.html { redirect_to([@tournament.division, @tournament], :notice => 'Tournament was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource tournament
        format.xml  { render :xml => @tournament, :status => :created, :location => [@tournament.division, @tournament] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tournament.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    #1st you retrieve the division thanks to params[:division_id]
    division = Division.find(params[:division_id])
    #2nd you retrieve the tournament thanks to params[:id]
    @tournament = division.tournaments.find(params[:id])

    respond_to do |format|
      if @tournament.update_attributes(params[:tournament])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource tournament
        format.html { redirect_to([@tournament.division, @tournament], :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tournament.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /divisions/:division_id/tournaments/1
    # DELETE /divisions/:division_id/tournaments/1.xml
    def destroy
      #1st you retrieve the division thanks to params[:division_id]
      division = Division.find(params[:division_id])
      #2nd you retrieve the tournament thanks to params[:id]
      @tournament = division.tournaments.find(params[:id])
      @tournament.destroy

      respond_to do |format|
        #1st argument reference the path /divisions/:division_id/tournaments/
        format.html { redirect_to(division_tournaments_url) }
        format.xml  { head :ok }
      end
    end

  private
    def tournament_params
      params.require(:tournament).permit(:name, :description, :season)
    end

end
