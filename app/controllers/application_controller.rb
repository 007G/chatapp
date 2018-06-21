class ApplicationController < ActionController::Base

def index
   before_action :authenticate_user!
end  
end
