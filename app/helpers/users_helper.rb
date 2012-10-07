module UsersHelper
  def authorized_user?(user)
    user == current_user
  end
end
