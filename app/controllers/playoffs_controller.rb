class PlayoffsController < ApplicationController

  include PlayoffsHelper

  def new



  end
  def index

  end

  def create

  end

  def new_create


    division = params[:division]
    @division = Division.find(division)

    if @division.tournaments.length == 2



    fecha1 = params[:date1]["Ronda1(1i)"]+"-"+params[:date1]["Ronda1(2i)"].rjust(2, '0')+
    "-"+params[:date1]["Ronda1(3i)"].rjust(2, '0')

    time1 = params[:time1]["Hora1(1i)"] + "-" + params[:time1]["Hora1(2i)"].rjust(2, '0') +
    "-" + params[:time1]["Hora1(3i)"].rjust(2, '0') + " " + params[:time1]["Hora1(4i)"].rjust(2, '0') +
    ":" + params[:time1]["Hora1(5i)"].rjust(2, '0') + ":00"

    time2 = params[:time2]["Hora2(1i)"] + "-" + params[:time2]["Hora2(2i)"].rjust(2, '0') +
    "-" + params[:time2]["Hora2(3i)"].rjust(2, '0') + " " + params[:time2]["Hora2(4i)"].rjust(2, '0') +
    ":" + params[:time2]["Hora2(5i)"].rjust(2, '0') + ":00"

    fecha2 = params[:date2]["Ronda2(1i)"]+"-"+params[:date2]["Ronda2(2i)"].rjust(2, '0')+
    "-"+params[:date2]["Ronda2(3i)"].rjust(2, '0')

    time3 = params[:time3]["Hora3(1i)"] + "-" + params[:time3]["Hora3(2i)"].rjust(2, '0') +
    "-" + params[:time3]["Hora3(3i)"].rjust(2, '0') + " " + params[:time3]["Hora3(4i)"].rjust(2, '0') +
    ":" + params[:time3]["Hora3(5i)"].rjust(2, '0') + ":00"

    fecha_final = params[:date3]["Final(1i)"]+"-"+params[:date3]["Final(2i)"].rjust(2, '0')+
    "-"+params[:date3]["Final(3i)"].rjust(2, '0')


    time4 = params[:time4]["Hora4(1i)"] + "-" + params[:time4]["Hora4(2i)"].rjust(2, '0') +
    "-" + params[:time4]["Hora4(3i)"].rjust(2, '0') + " " + params[:time4]["Hora4(4i)"].rjust(2, '0') +
    ":" + params[:time4]["Hora4(5i)"].rjust(2, '0') + ":00"

    create_playoff(@division, fecha1, time1, time2, fecha2, time3, fecha_final, time4)
    redirect_to playoffs_path, flash: {notice: "Playoff creado exitosamente!"}
    else
      redirect_to playoffs_path, flash: {notice: "No se pudo crear playoff, no existe numero de torneos adecuado!"}

    end
  end
end
