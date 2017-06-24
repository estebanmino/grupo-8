module TournamentsHelper

  def date_format(date, j)
    date["Fecha#{j}(1i)"]+"-"+date["Fecha#{j}(2i)"].rjust(2, '0')+"-"+date["Fecha#{j}(3i)"].rjust(2, '0')
  end

  def time_format(time, timenum, datenum)
    p time
    p timenum
    p datenum
    p "#{(datenum-1)*4+timenum}"
    time["Hora #{(datenum-1)*4+timenum}(1i)"] +
    "-" + time["Hora #{(datenum-1)*4+timenum}(2i)"].rjust(2, '0') +
    "-" + time["Hora #{(datenum-1)*4+timenum}(3i)"].rjust(2, '0') +
    " " + time["Hora #{(datenum-1)*4+timenum}(4i)"].rjust(2, '0') +
    ":" + time["Hora #{(datenum-1)*4+timenum}(5i)"].rjust(2, '0') + ":00"
  end
end
