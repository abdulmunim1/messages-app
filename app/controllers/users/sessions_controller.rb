
class Users::SessionsController < Devise::SessionsController

  # DELETE /resource/sign_out
  def destroy
    current_user.update token: nil
    super
  end

end
