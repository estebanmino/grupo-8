module Api::V1
  class CommentsController < ApiController
    before_action :authenticate


    def index
      @comments = Comment.all

    end

    def create
       @comment = @current_user.comments.build(comment_params)
       return if @comment.save
       render json: { errors: @comment.errors }, status: :unprocessable_entity
    end

    def show
       @comment = Comment.find(params[:id])
    end

    private

    def comment_params

       params.require(:comment).permit(:content, :post_id)
    end



  end
end
