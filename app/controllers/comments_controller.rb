class CommentsController < ApplicationController

  def create
    byebug
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)

   end  


   private 
    def comment_params
      params.require(:comment).permit(:commenter, :body).merge(user_id: current_user.id)
    end   

end
