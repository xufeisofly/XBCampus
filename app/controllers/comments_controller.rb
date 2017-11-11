class CommentsController < ApplicationController

  def create 
    @post = Post.find(params[:post_id])  
    @comment = @post.comments.create(params[:comment].permit(:content))   
    @comment.user_id = current_student.id if current_student

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post}
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render :new, notice: '请先登录账号' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html 
      format.json {render :show, location: @post}
    end
  end


end
