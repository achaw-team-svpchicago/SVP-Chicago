class AdminPanelController < ApplicationController
  before_action :authenticate_super_admin!

  def show

  end
end
