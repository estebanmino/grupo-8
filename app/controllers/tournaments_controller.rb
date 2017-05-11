class TournamentsController < ApplicationController


  # GET /divisions/:division_id/tournaments
  # GET /divisions/:division_id/tournaments.xml
  def index
    #1st you retrieve the division thanks to params[:division_id]
    division = Division.find(params[:division_id])
    #2nd you get all the tournaments of this division
    @tournaments = division.tournaments

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
    

  end

  def new_fixture

    p "HOLA MUNDO"
    p division = Division.find(params[:division_id])
    p @tournament = division.tournaments.find(params[:id])
    p "HOLA MUNDO"

    p params[:q]
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
