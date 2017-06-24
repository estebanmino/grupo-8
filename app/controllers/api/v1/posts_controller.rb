module Api::V1
  class PostsController < ApiController
    before_action :authenticate, only: [:create, :destroy]
    before_action :set_post, only: [:show, :destroy]

    def index
      @posts = Post.all

    end

    def create
       @post = @current_user.posts.build(post_params)
       return if @post.save
       render json: { errors: @post.errors }, status: :unprocessable_entity
    end

    def show

    end

    def destroy
      if @current_user == @post.user || @current_user.is_admin
        @post.destroy
      end
        return
      render json: { errors: @post.errors }, status: :unprocessable_entity

    end

    private

    def post_params
       params.require(:post).permit(:name, :description, :user_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end



  end
end
