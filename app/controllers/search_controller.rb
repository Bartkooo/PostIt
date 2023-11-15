class SearchController < ApplicationController
  def index
    key = "%#{params[:search]}%"
    @users = ''

    if params[:search] != ''
      @users = User.where("first_name LIKE ? OR last_name LIKE ?", key, key)
    end
  end
end
