class CommentsController < ApplicationController
  before_action :find_post
  def create
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
  private
  def comment_params
  comment_params = params.require(:comment).permit(:centent)
  end
  def find_post
    @post= Post.find(params[:post_id])
  end
  end
