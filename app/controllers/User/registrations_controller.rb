class User::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    redirect_to '/'
    # super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    if params[:event] == "welcome"
      flash[:warning] = "Welcome to SVP Chicago! Please update you password here in order to begin reviewing non-profits. Thank you!."
    end
    super
  end

  # PUT /resource
  def update
    super
    unless current_user.confirmed
      current_user.update(confirmed: true)
      flash[:success] = "Your account has been confirmed! You can now browse nonprofit submissions."
    end
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :attribute
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :attribute
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
