module Authorization
  extend ActiveSupport::Concern

  included do
    helper_method :current_user_can_manage?
  end

  private

  def current_user_can_manage?
    Current.user&.can_manage?
  end

  def require_management_permission
    unless current_user_can_manage?
      redirect_to classrooms_path, alert: "You don't have permission to perform this action."
    end
  end
end
