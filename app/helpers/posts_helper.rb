module PostsHelper

  def post_belongs_to_user(post)
    post.user_id == current_user.id
  end
end
