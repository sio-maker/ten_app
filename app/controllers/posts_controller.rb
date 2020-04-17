class PostsController < ApplicationController
  before_action :authenticate_user!
  
  require "date"


  def index
    @posts=Post.all.order(id: "DESC")
  end

  def new
    @post=Post.new
    @user = current_user
    @followings=@user.followings
    @followers=@user.followers
  end

  def create
    @user = current_user
    @followings=@user.followings
    @followers=@user.followers
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice]="新しいチャレンジが登録されました！"
      redirect_to :action => "index"
    else
      render("posts/new")
    end
  end

  def show
    @post=Post.find(params[:id])
    @comments = @post.comments.order(id: "DESC")
    @comment = @post.comments.build
  end 

  def edit
    @user = current_user
    @followings=@user.followings
    @followers=@user.followers
    @post = Post.find(params[:id])
  end

  def update
    @user = current_user
    @post = Post.find(params[:id])
    @followings=@user.followings
    @followers=@user.followers
    if @post.update(post_params)
      flash[:notice]="編集されました"
      redirect_to :action => "show", :id => @post.id
    else
      render("posts/edit")
    end
  end

  def destroy
    flash[:notice]="削除されました"
    Post.find(params[:id]).destroy
    redirect_to action: :index
  end

  def done
    post=Post.find(params[:id])
    if post.date==Date.today
      redirect_to :action =>"show", :id => post.id
      flash[:notice]="更新は１日一回です"
    else
      post.date=Date.today
      post.increment(:day,1)
      post.save
      flash[:notice]="更新しました"
      redirect_back(fallback_location: root_path)
    end
  end


  private
  def post_params
    params.require(:post).permit(:body,:day,:date)
  end



end
