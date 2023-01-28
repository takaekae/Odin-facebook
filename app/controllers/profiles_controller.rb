class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
        redirect_to user_path(current_user), notice: "Profile created!"
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit #add restriction -> only current user
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to user_path(current_user), notice: "Profile update!"
    else
      render :edit, status: :unprocessable_entity
    end

  end




  def profile_params
    params.require(:profile).permit(:intro, :location, :avatar)
  end
end
