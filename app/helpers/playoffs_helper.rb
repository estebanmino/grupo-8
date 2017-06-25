module PlayoffsHelper

  def playoff_date_format(date)
    date["(1i)"]+"-"+date["(2i)"].rjust(2, '0')+"-"+date["(3i)"].rjust(2, '0')
  end

  def playoff_time_format(time, timenum, datenum)
    time["(1i)"] +
    "-" + time["(2i)"].rjust(2, '0') +
    "-" + time["(3i)"].rjust(2, '0') +
    " " + time["(4i)"].rjust(2, '0') +
    ":" + time["(5i)"].rjust(2, '0') + ":00"
  end

end
