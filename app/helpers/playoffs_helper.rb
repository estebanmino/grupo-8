module PlayoffsHelper

  def playoff_date_format(date)
    date["(1i)"]+"-"+date["(2i)"].rjust(2, '0')+"-"+date["(3i)"].rjust(2, '0')
  end

  def playoff_time_format(time)
    time["(1i)"] +
    "-" + time["(2i)"].rjust(2, '0') +
    "-" + time["(3i)"].rjust(2, '0') +
    " " + time["(4i)"].rjust(2, '0') +
    ":" + time["(5i)"].rjust(2, '0') + ":00"
  end

  def match_update_local_team(match, team)
    match.update_attribute(:home_team_id, team.id)
  end

  def match_update_visitor_team(match, team)
    match.update_attribute(:visit_team_id, team.id)
  end

  def match_update_datenum(match,n)
    match.update_attribute(:datenum, n+1)
  end

end
