class PostsController < ApplicationController

  def index
    @authors = Author.all
    if params[:author].present?
      @posts = Post.by_author(:author)
    elsif params[:date].present?
      if params[:date] == "Today"
        @posts = Post.from_today
      else
        @posts = Post.old_news
      end
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post))
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end
end
