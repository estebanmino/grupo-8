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

    if @division.tournaments.length == 2

      times = (0..7).map{|i| params[:"time#{i}"]}
      dates = (0..7).map{|i| params[:"date#{i}"]}

      tournament_1 = @division.tournaments.first() 
      p  times
      p dates
      p division
      redirect_to playoffs_path, flash: {notice: "Playoff creado exitosamente!"}

    else
      redirect_to playoffs_path, flash: {notice: "No se pudo crear playoff, no existe numero de torneos adecuado!"}

    end
  end
end
