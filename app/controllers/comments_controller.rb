class CommentsController < ApplicationController
  def create
    @diary = Diary.find(params[:diary_id])
    #@comment = @diary.comments.create(params[:comment])
    @comment = @diary.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comment.save
    redirect_to diary_path(@diary)
  end
end
