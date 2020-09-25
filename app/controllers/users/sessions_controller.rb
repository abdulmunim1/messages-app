
class Users::SessionsController < Devise::SessionsController

  # DELETE /resource/sign_out
  def destroy
    current_user.save_token nil
    super
  end

end
