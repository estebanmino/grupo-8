module PlayoffsHelper

  def create_playoff(division, fecha1, time1, time2, fecha2, time3, fecha_final, time4)
    tournament1 = division.tournaments[0]
    tournament2 = division.tournaments[1]
    teams1 = tournament1.teams.sort_by{|x| [-x.points, -(x.gf - x.ga)]}.take(4)
    teams2 = tournament2.teams.sort_by{|x| [-x.points, -(x.gf - x.ga)]}.take(4)

    playoff = Tournament.new(:name => "Playoff de #{division.name}", :description =>
    "Playoffs finales, que decidirán al campeón", :season => "#{tournament1.season}",
    :division_id => division.id, :playoff => true)



    for i in teams1
      i.tournaments << playoff
    end

    for j in teams2
      j.tournaments << playoff
    end

    p teams1.pluck(:name)
    p teams2.pluck(:name)


    p1 = Match.new(:date => fecha1, :time => time1, :visitor_goals => 0,
    :local_goals => 0, :played => false, :visit_team_id => teams1[0].id, :home_team_id =>
    teams2[3].id, :tournament_id => playoff.id, :Datenum => 1, :playoff => true)

    p2 = Match.new(:date => fecha1, :time => time1, :visitor_goals => 0,
    :local_goals => 0, :played => false, :visit_team_id => teams1[1].id, :home_team_id =>
    teams2[2].id, :tournament_id => playoff.id, :Datenum => 1, :playoff => true)

    p3 = Match.new(:date => fecha1, :time => time1, :visitor_goals => 0,
    :local_goals => 0, :played => false, :visit_team_id => teams2[0].id, :home_team_id =>
    teams1[3].id, :tournament_id => playoff.id, :Datenum => 1, :playoff => true)

    p4 = Match.new(:date => fecha1, :time => time1, :visitor_goals => 0,
    :local_goals => 0, :played => false, :visit_team_id => teams2[1].id, :home_team_id =>
    teams1[2].id, :tournament_id => playoff.id, :Datenum => 1, :playoff => true)

    p1.save
    p2.save
    p3.save
    p4.save
    playoff.save

  end
end
