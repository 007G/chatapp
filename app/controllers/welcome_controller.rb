class WelcomeController < ApplicationController
     before_action :authenticate_user!,except: :index

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
    format.html
    format.json
    end
  end  
end
