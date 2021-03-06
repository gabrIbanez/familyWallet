class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_user
  before_action :set_askm

  def home
    if user_signed_in?
    redirect_to page_path(current_user)
    end
  end

  def show
    @membres = current_user.membres

  end


  def edit
  end

  def update
    @user.update(user_params)
    redirect_to page_membres_path(@user)
  end

  private

  def set_askm
    @ask = AskForDollar.last
  end

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:phone_numbre, :last_name, :first_name, :birthday, :mail, :email, :photo)
  end
end
