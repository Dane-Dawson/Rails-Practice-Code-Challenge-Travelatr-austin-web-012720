class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      @post.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def like
    @post = Post.find(params[:id])
    @post.like
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :destination_id, :blogger_id)
  end
end
