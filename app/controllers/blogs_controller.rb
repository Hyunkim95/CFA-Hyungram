class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    if @blog = Blog.create(blog_params)
      flash[:success] = "Your post has been created!"
      redirect_to blogs_path
    else
      flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  def show
    set_post
  end

  def edit
    set_post
  end

  def update
    set_post
    if @blog.update(blog_params)
      flash[:success] = "Post updated."
      redirect_to blogs_path
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

  def destroy
    set_post
    if @blog.destroy
      flash[:success] = 'Post deleted'
      redirect_to blogs_path
    else
      flash.now[:alert] = "Post not deleted"
      render :destroy
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:image, :description) #only permits images and description
  end

  def set_post
    @blog = Blog.find(params[:id])
  end

end
