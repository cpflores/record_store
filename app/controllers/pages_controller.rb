class PagesController < ApplicationController
  def home
    if current_user
      redirect_to records_path
    end
  end
end
