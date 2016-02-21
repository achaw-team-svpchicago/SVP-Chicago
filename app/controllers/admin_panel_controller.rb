class AdminPanelController < ApplicationController
  before_action :authenticate_super_admin!

  def show

  end

  def invite_user

  end
end
