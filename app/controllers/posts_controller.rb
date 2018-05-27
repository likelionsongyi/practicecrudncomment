class PostsController < ApplicationController
  before_action :find_post ,except: [:index, :new, :create]
  # before_action :post_params ,only:[:]
  def index
    @posts=Post.all
  end

  def show
    @comments = Comment.where(post_id: @post)
    # @post=>find한 아이디값
    # @post=Post.find(params[:id])
    
  end

  def new
    @post=Post.new
  end

  def edit
    # @post=Post.find(params[:id])
  end
  
  def create
    # @post= Post.new
    # @post.title=params[:title]
    # @post.content=params[:content]
    # @post.save
    Post.create(post_params)
    redirect_to Post.last
  end
  def update
    # @post=Post.find(params[:id])
    # @post.title=params[:title]
    # @post.content=params[:content]
    # @post.save
    @post.update(post_params)
    redirect_to post_path(@post)
  end
  def destroy
    # @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    # redirect_to "/"
  end
  def comment_create
    # @post=Post.find(params[:id])
    @post.comments.create(centent: params[:comment_content])
    # create는 save안 해도 됨
    redirect_to "/posts/show/#{@post.id}"
  end
  
  private
  def find_post
  @post=Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
