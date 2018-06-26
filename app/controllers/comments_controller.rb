class CommentsController < ApplicationController

  def create
    
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)

   end  

   def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if(@comment[:user_id]==current_user.id)

    @comment.destroy
    redirect_to post_path(@post)
  end
   end 


   private 
    def comment_params
      params.require(:comment).permit(:commenter, :body).merge(user_id: current_user.id)
    end   

end
