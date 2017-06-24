module TournamentsHelper

  def date_format(date, j)
    date["Fecha#{j}(1i)"]+"-"+date["Fecha#{j}(2i)"].rjust(2, '0')+"-"+date["Fecha#{j}(3i)"].rjust(2, '0')
  end

  def time_format(time, timenum, datenum)
    number = (datenum-1)*4+timenum
    time["Hora #{number}(1i)"] +
    "-" + time["Hora #{number}(2i)"].rjust(2, '0') +
    "-" + time["Hora #{number}(3i)"].rjust(2, '0') +
    " " + time["Hora #{number}(4i)"].rjust(2, '0') +
    ":" + time["Hora #{number}(5i)"].rjust(2, '0') + ":00"
  end
end
