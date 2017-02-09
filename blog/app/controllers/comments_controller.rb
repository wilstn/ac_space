class CommentsController < ApplicationController

  def index
    @comments = Blog.find(params[:id]).Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new(blog_id: params[:blog_id])
  end

  def edit
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    redirect_to blog_path(@blog)
  end

  private
    def comment_params
      params.require(:comment).permit(:remark, :email, :user, :blog_id)
    end
end
