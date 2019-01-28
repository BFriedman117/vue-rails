class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :show, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @comments = Comment.all
    json_response(@comments)
  end

  def create
   @comment = Comment.create!(comment_params)
   json_response(@comment, :created)
  end

  def update
    @comment.update(comment_params)
    head :no_content
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  def show
    json_response(@comment)
  end

  private

  def comment_params
    params.permit(:string, :user_id, :omdbid, :comment)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
