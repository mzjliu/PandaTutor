module Api
  module V1
    
class UsersController < ApplicationController
 
   before_filter :fetch_user, :except => [:index, :create]
  respond_to :json, :xml
  def show
    respond_to do |format|
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

 def fetch_user
    @user = User.find_by_id(params[:id])
  end

  def index
    #@users = User.all
    #@users = User.find_by_name_and_email_and_id(params[:name], params[:email], params[:id])
    #@users = User.find_by_name(params[:name])
    @users = User.where("name = ? or email = ?", params[:name], params[:email])
    respond_to do |format|
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  def new
  end
  

end
  end
end
