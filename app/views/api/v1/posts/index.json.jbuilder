# frozen_string_literal: true

json.posts do
   json.array! @posts do |post|
     json.href api_v1_post_url(post)
     json.name post.name
     json.description post.description

     json.user do
       json.href api_v1_user_url(post.user)
       json.email post.user.email
       json.name post.user.name
       json.last_name post.user.last_name
     end

   end
end
