class UsersController < ApplicationController

  before_filter :authenticate_user!, :except => [:new, :create]
  
  def new
    @user = User.new
  end

  def list
    @tasks = current_user.tasks
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to task_items_path, :notice => 'User successfully added.'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to task_items_path, :notice => 'Updated user information successfully.'
    else
      render :action => 'edit'
    end
  end
end