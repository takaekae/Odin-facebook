class ProfilesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
  end

  def create
    @user = User.find(params[:user_id])
    @profile = @user.build_profile(profile_params)
    if @profile.save
      redirect_to @user
    else
      render :new, status: :unproccessable_entity
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile 
  end

  def update
    @user = User.find(params[:user_id])
    @profile = @user.profile
    if @profile.update(profile_params)
      redirect_to @user
    else
      render :edit, status: :see_other
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :age, :location, :picture, :avatar)
  end
end
