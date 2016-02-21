class User::PasswordsController < Devise::PasswordsController
  # GET /user/password/new
  def new
    super
  end

  # POST /user/password
  def create
    super
  end

  # GET /user/password/edit?reset_password_token=abcdef
  def edit
    super
  end

  # PUT /user/password
  def update
    super
  end

  protected

  def after_resetting_password_path_for(user)
    super(user)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(user_name)
    super(user_name)
  end
end
