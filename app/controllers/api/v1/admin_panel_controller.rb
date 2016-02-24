class Api::V1::AdminPanelController < ApplicationController

  def show
    @partners = User.where(super_admin: false)
    @admins = User.where(super_admin: true)
  end

end