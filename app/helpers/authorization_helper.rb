module AuthorizationHelper
  private
  def confirm_login
    unless current_user
      redirect_to login_path, notice: "You must log in to do that."
    end
  end

  def confirm_owner(resource)
    unless resource.user == current_user
      redirect_to root_path, notice: "You dont have permission to do that Dave."
    end
  end
end
