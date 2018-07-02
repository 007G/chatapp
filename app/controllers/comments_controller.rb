class CommentsController < ApplicationController

  def create
    
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)

    respond_to do |format|
      format.html
      format.js
    end
  end


   def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

  # if(@comment[:user_id]==current_user.id)

    @comment.destroy
    redirect_to post_path(@post)
    #end 

    respond_to do |format|
      format.html
      format.js
    end
   end 


   private 
    def comment_params
      params.require(:comment).permit(:commenter, :body).merge(user_id: current_user.id)
    end   

end
