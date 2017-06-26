# frozen_string_literal: true

 json.users do
    json.array! @users do |user|
      json.href api_v1_user_url(user)
      json.name user.name
      json.last_name user.last_name
      json.position user.position
      json.email user.email
      json.goals user.goals
      json.is_captain user.is_captain


    end
 end
