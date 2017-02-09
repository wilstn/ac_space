class CommentsController < ApplicationController

  def index
    @comments = Blog.find(params[:id]).Comment.all
  end

  def show
  end

  def new
    @blog = Blog.find(params[:blog_id])
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to blog_path(@blog)
    else
      render 'edit'
    end
  end

  def create
    blog = Blog.find(params[:blog_id])
    @comment = blog.comments.create(comment_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:blog_id])
    @comment = blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_path(blog)
  end

  private
    def comment_params
      params.require(:comment).permit(:remark, :email, :user)
    end
end
