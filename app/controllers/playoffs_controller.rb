class PlayoffsController < ApplicationController

  include PlayoffsHelper

  def new
  end

  def index
  end
  def create
  end
  def new_match
  end

  def new_create

    division = params[:division]
    @division = Division.find(division)

    if @division.tournaments.length != 2
      flash[:notice] = 'No se pudo crear el fixture no existe el numero adecuado de torneos'
      redirect_to playoffs_path and return
    end

    if @division.tournaments.length == 2

      times = (1..7).map{|i| params[:"time#{i}"]}
      dates = (1..7).map{|i| params[:"date#{i}"]}
      places = (1..7).map{|i| params[:"place#{i}"]}
      addresses = (1..7).map{|i| params[:"address#{i}"]}
      communes = (1..7).map{|i| params[:"commune#{i}"]}

      teams_tournament_1 = @division.tournaments.first.teams.sort_by{|x| [-x.points, -(x.gf - x.ga)]}[0...4]
      teams_tournament_2 = @division.tournaments.second.teams.sort_by{|x| [-x.points, -(x.gf - x.ga)]}[0...4]

      playoff = Tournament.create(name: "Playoff de #{@division.name}", description:
                "Playoffs finales, que decidirán al campeón", season: "#{ @division.tournaments.first.season}",
                division_id: @division.id, playoff: true)

      failed = false
      for i in [0,1,2,3,4,5,6]
        time = playoff_time_format(times[i])
        date = playoff_date_format(dates[i])
        location = i
        if params[:check_locations] == "true"
          location = 0
        end
        address = addresses[location]
        commune = communes[location]
        place = places[location]

        datenum = i+1
        if i > 3
          datenum = -1
          i = 0
        end

        match = Match.new(date: date, time: time, visitor_goals: 0, local_goals: 0,
          played: false, visit_team_id: teams_tournament_2[i].id, home_team_id: teams_tournament_1[3-i].id,
          tournament_id: playoff.id, datenum: datenum, address: address, commune: commune,place: place)

        if !match.save
          failed = true
          break
        end
      end

      respond_to do |format|
        if !failed
          format.html { redirect_to playoffs_path, notice: 'Playoff creado exitosamente' }
        else
          format.html { redirect_to home_path }
        end
      end
    end


  end
end
