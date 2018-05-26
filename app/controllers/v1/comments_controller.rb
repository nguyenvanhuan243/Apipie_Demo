module V1
  class CommentsController < ApplicationController
    before_action :find_user

    api!
    def index
      @comments = @user.comments.all.limit(5)
      render json: @comments
    end 

    def create
      @comment = @user.comments.new(comment_params)
      if @comment.save
        render json: @comment, status: :created, location: [@user, @comment]
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    private

    def find_user
      @user = User.find_by_id(params[:user_id])
    end

    def comment_params
      params.require(:comment).permit(:text, :title, :type)
    end
  end
end
