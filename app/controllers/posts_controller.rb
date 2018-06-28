class PostsController < ApplicationController
  before_action :authenticate_user!,except: :show

  
  def index
    @post = Post.all.paginate(:page => params[:page], :per_page => 7)
    @ability = Ability.new(current_user) 

    respond_to do |format|
    format.html
    format.json
    end
  end  

  def new
    @post = Post.new
  end
  
  def create
           
   #@post = Post.new(user_id: current_user.id)

   #@user = User.find(current_user.id)
   @post = Post.new(post_params)
   # user_id= current_user.id
   #@post = current_user.posts.new(post_params)
   # @post = current_user.posts.build(params[:post])
   #@post.user = current_user

   if @post.save
    redirect_to @post
  else
    render 'new'
   end 
  end  

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
    format.html
    format.json
    end
  end  

  def edit
    @post = Post.find(params[:id])
  end 

   def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
     render 'edit' 
    end 
  end

   def destroy
     @post= Post.find(params[:id])

    if(@post[:user_id]==current_user.id)
      @post.destroy
      redirect_to posts_path
    end
  end



    def verified
    @post = Post.find(params[:id])
    @post.update_columns(published: true)
    @post = Post.all

    respond_to do |format|
     format.html
     format.js
    end
  end




  private 
  def post_params
    params.require(:post).permit(:title, :text, :image).merge({user_id: current_user.id})
  end
  
  
end
