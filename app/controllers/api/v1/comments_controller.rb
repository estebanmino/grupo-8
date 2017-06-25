module Api::V1
  class CommentsController < ApiController
    before_action :authenticate, only: [:create, :destroy]
    before_action :set_comment, only: [:show, :destroy]



    def index
      @comments = Comment.all

    end

    def create

       user = User.find_by_token(params[:token])

       @post = Post.find(params[:post_id])
       @comment = @post.comments.build(comment_params)
       @comment.user_id = user.id
       return if @comment.save
       render json: { errors: @comment.errors }, status: :unprocessable_entity
    end

    def show

    end

    def destroy

      if @current_user == @comment.user || @current_user.is_admin
        @comment.destroy
      end
        return
      render json: { errors: @comment.errors }, status: :unprocessable_entity

    end

    private

    def comment_params

       params.require(:comment).permit(:content, :post_id)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end


  end
end
