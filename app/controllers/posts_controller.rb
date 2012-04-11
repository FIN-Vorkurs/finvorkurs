# encoding: utf-8
class PostsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]

  def index
    @posts = Post.order :created_at
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      User.all.each do |u|
        u.send_newsletter @post
      end
      redirect_to posts_path, :notice => 'Nachricht erstellt'
    else
      render :action => "new"
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to @post, :notice => 'Nachricht geändert'
    else
      render :action => "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, :notice => 'Nachricht gelöscht'
  end
end
