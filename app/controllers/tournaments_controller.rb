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
    teams = @tournament.teams.pluck(:id)
    if teams.length > 0
      redirect_to([@tournament.division, @tournament], :notice => 'No se pudo crear el fixture inicial, ya existen partidos creados!')


    end


  end

  def new_fixture




    division = Division.find(params[:division_id])
    @tournament = division.tournaments.find(params[:id])
    teams = @tournament.teams.pluck(:id)

    date1 = params[:date1]["Fecha1(1i)"]+"-"+params[:date1]["Fecha1(2i)"].rjust(2, '0')+
    "-"+params[:date1]["Fecha1(3i)"].rjust(2, '0')

    date2 = params[:date2]["Fecha2(1i)"]+"-"+params[:date2]["Fecha2(2i)"].rjust(2, '0')+
    "-"+params[:date2]["Fecha2(3i)"].rjust(2, '0')

    date3 = params[:date3]["Fecha3(1i)"]+"-"+params[:date3]["Fecha3(2i)"].rjust(2, '0')+
    "-"+params[:date3]["Fecha3(3i)"].rjust(2, '0')

    date4 = params[:date4]["Fecha4(1i)"]+"-"+params[:date4]["Fecha4(2i)"].rjust(2, '0')+
    "-"+params[:date4]["Fecha4(3i)"].rjust(2, '0')

    date5 = params[:date5]["Fecha5(1i)"]+"-"+params[:date5]["Fecha5(2i)"].rjust(2, '0')+
    "-"+params[:date5]["Fecha5(3i)"].rjust(2, '0')
    date6 = params[:date6]["Fecha6(1i)"]+"-"+params[:date6]["Fecha6(2i)"].rjust(2, '0')+
    "-"+params[:date6]["Fecha6(3i)"].rjust(2, '0')
    date7 = params[:date7]["Fecha7(1i)"]+"-"+params[:date7]["Fecha7(2i)"].rjust(2, '0')+
    "-"+params[:date7]["Fecha7(3i)"].rjust(2, '0')

    time1 = params[:time1]["Hora1(1i)"] + "-" + params[:time1]["Hora1(2i)"].rjust(2, '0') +
    "-" + params[:time1]["Hora1(3i)"].rjust(2, '0') + " " + params[:time1]["Hora1(4i)"].rjust(2, '0') +
    ":" + params[:time1]["Hora1(5i)"].rjust(2, '0') + ":00"

    time2 = params[:time2]["Hora2(1i)"] + "-" + params[:time2]["Hora2(2i)"].rjust(2, '0') +
    "-" + params[:time2]["Hora2(3i)"].rjust(2, '0') + " " + params[:time2]["Hora2(4i)"].rjust(2, '0') +
    ":" + params[:time2]["Hora2(5i)"].rjust(2, '0') + ":00"

    time3 = params[:time3]["Hora3(1i)"] + "-" + params[:time3]["Hora3(2i)"].rjust(2, '0') +
    "-" + params[:time3]["Hora3(3i)"].rjust(2, '0') + " " + params[:time3]["Hora3(4i)"].rjust(2, '0') +
    ":" + params[:time3]["Hora3(5i)"].rjust(2, '0') + ":00"

    time4 = params[:time4]["Hora4(1i)"] + "-" + params[:time4]["Hora4(2i)"].rjust(2, '0') +
    "-" + params[:time4]["Hora4(3i)"].rjust(2, '0') + " " + params[:time4]["Hora4(4i)"].rjust(2, '0') +
    ":" + params[:time4]["Hora4(5i)"].rjust(2, '0') + ":00"

    times = [time1,time2,time3,time4]
    dates = [date1,date2,date3,date4,date5,date6,date7]

    create_fix(teams, division, @tournament, dates, times)

    redirect_to home_path


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
