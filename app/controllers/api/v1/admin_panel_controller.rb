class Api::V1::AdminPanelController < ApplicationController

  def show
    @users = User.all
  end

end