# frozen_string_literal: true

 json.comment do
   json.href api_v1_comment_url(@comment)
   json.content @comment.content
   json.user do
     json.href api_v1_user_url(@comment.user)
     json.email @comment.user.email
     json.name @comment.user.name
     json.last_name @comment.user.last_name
   end
   json.post do
     json.name @comment.post.name
     json.description @comment.post.description
   end
 end
