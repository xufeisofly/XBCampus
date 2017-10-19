class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_student.id if current_student

    if @comment.save
      redirect_to @post
    else
      render 'new'
    end
  end
end
