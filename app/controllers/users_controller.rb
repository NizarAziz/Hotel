class UsersController < ApplicationController
  before_action(:authenticate_user!, only: [:index, :show, :edit])

  def index
    @users = User.all
  end

  def show
    get_user
  end

  def edit
    get_user
    if current_user.admin? ||  current_user.id == @user.id
      get_user
    else
      redirect_to(action: :index )
    end
  end

  def update
    get_user
    @user.update(user_params)
    redirect_to_user_if_valid(:edit, 'User was sucessfully updated!', 'There was an error')
  end


  private

  def redirect_to_user_if_valid(action_to_render, success_copy, failure_copy)
    if @user.valid?
      flash.notice = success_copy
      redirect_to(@user)
    else
      flash.now.alert = failure_copy
      render(action_to_render)
    end
  end

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params[:user].permit(:email, :name, :headline, :profile, :admin)
  end
end
