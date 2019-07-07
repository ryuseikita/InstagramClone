class InstagramsController < ApplicationController
  def index
    if logged_in?
      redirect_to pictures_path
    else
      redirect_to new_session_path
    end
  end
end
