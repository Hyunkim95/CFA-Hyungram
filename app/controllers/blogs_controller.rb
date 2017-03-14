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
    set_post
  end

  def edit
    set_post
  end

  def update
    set_post
    @blog.update(blog_params)
    redirect_to blogs_path(@blog)
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:image, :description) #only permits images and description
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
