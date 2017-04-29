module CommentsHelper
  def comment_belongs_to_user(comment)
    comment.user_id == current_user.id
  end
end
