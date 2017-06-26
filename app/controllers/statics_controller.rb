class StaticsController < ApplicationController

  def scorers
    @divisions = Division.all
    @top_scorers = Array.new(@divisions.count)
    for division in @divisions
      @top_scorers[division.id]  = Array.new(10){{user:nil, goals:0}}
      min_goals = 0
      for team in division.teams
        for user in team.users
          goals = 0
          for performance in user.performances
            goals += performance.goals
          end
          if goals > min_goals
            min_goals = array_insert(@top_scorers[division.id], user, goals)
          end
        end
      end
    end
  end

  private

  def array_insert(top_division, user, goals)
    min_goals = top_division[9][:goals]
    top_division.delete_at(9)
    top_division.insert(0, {user: user, goals: goals})
    min_goals
  end
end
