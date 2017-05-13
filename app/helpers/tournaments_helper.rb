module TournamentsHelper



  def create_fix(teams, division, tmt, dates, times)
      m = 0
      first_group = (0...teams.length).select {|x| x % 2 == 0}
      sec_group = (0...teams.length).select {|x| x % 2 != 0}
      p first_group
      p sec_group
      ind1 = 0
      for j in 0...4 # hago 4 fechas
        n = 0
        date = dates[j]


        for i in 0...4 # 4 partidos por fecha
          home = teams[first_group[i]]

          away = teams[sec_group[(i + ind1) % 4]]
          time = times[i]
          p i
          p time
          p (i + ind1) % 4


          a = Match.new(:date => date, :time => time, :visitor_goals => 0,
          :local_goals => 0, :played => false, :visit_team_id => away, :home_team_id => home,
          :tournament_id => tmt.id)
          a.save
        end
        ind1 +=1


      end

    homes = [0,1,5,7]
    visits = [2,3,4,6]
    date = dates[4]
    for i in 0...4
      time = times[i]

      home = teams[homes[i]]
      away = teams[visits[i]]

      a = Match.new(:date => date, :time => time, :visitor_goals => 0,
      :local_goals => 0, :played => false, :visit_team_id => away, :home_team_id => home,
      :tournament_id => tmt.id)
      a.save
    end

    homes = [0,2,4,6]
    visits = [4,5,6,7]
    date = dates[5]


    for i in 0...4
      time = times[i]
      home = teams[homes[i]]
      away = teams[visits[i]]

      a = Match.new(:date => date, :time => time, :visitor_goals => 0,
      :local_goals => 0, :played => false, :visit_team_id => away, :home_team_id => home,
      :tournament_id => tmt.id)
      a.save
    end

    homes = [0,4,5,7]
    visits = [6,2,1,3]
    date = dates[6]

    for i in 0...4
      time = times[i]
      home = teams[homes[i]]
      away = teams[visits[i]]

      a = Match.new(:date => date, :time => time, :visitor_goals => 0,
      :local_goals => 0, :played => false, :visit_team_id => away, :home_team_id => home,
      :tournament_id => tmt.id)
      a.save
    end




  end
end
