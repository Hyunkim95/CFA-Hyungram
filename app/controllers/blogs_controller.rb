class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    redirect_to blogs_path #redirects to index
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def update

  end

  private
  def blog_params
    params.require(:blog).permit(:image, :description) #only permits images and description
  end
end
