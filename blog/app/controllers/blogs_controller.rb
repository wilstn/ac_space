class BlogsController < ApplicationController
  def index
    @blogs = Blog.page(params[:page]).per(2).order('created_at DESC')
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :category, :author, :post)
  end
end
