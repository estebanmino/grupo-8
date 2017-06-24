module Api::V1
  class PostsController < ApiController
    before_action :authenticate

    def index
      @posts = Post.all

    end

    def create
       @post = @current_user.posts.build(post_params)
       return if @post.save
       render json: { errors: @post.errors }, status: :unprocessable_entity
    end

    def show
       @post = Post.find(params[:id])
    end

    private

    def post_params
       params.require(:post).permit(:name, :description, :user_id)
    end



  end
end
