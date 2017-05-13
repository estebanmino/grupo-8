module TeamsHelper

  def captain(team)
    team.users.each do |user|
      if user.is_captain?
        return user
      end
    end
    nil
  end
end
