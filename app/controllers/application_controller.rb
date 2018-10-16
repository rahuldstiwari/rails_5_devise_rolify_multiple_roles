class ApplicationController < ActionController::Base




  # layout :determine_layout
  # def determine_layout
  #   current_user ? "admin" : "application"
  # end


  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  def authenticate_user!
     if current_user.present?
      return true
     else
      flash[:notice] = "You are not authorized to view this page"
      redirect_to root_path
     end    
  end


 def authenticate_admin!
	if current_user.has_role? :admin
	  return true
     else
      flash[:notice] = "You are not authorized to view this page"
      redirect_to root_path
     end    
 end

end
