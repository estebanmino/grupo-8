# frozen_string_literal: true

 json.user do
   json.href api_v1_user_url(@user)
   json.email @user.email
   json.name @user.name
   json.last_name @user.last_name
   json.comment do
     json.array! @user.comments do |comment|
       json.href api_v1_comment_url(comment)
       json.content comment.content
       
     end
   end
 end
