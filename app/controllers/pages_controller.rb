class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
    if current_user
      redirect_to records_path
    end
    @records = Record.last(8)
  end

  def dashboard
    @records = current_user.records
  end
end
