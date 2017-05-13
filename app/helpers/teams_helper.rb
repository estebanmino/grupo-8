module TeamsHelper

  def captain(team)
    team.users.each do |user|
      if user.is_captain?
        return user
      end
    end
    nil
  end

  def current_user_is_captain_of(team)
    if current_user
      current_user.is_captain? && (current_user.team.id == team.id)
    end
  end
end
