class ApplicationController < ActionController::Base
def after_sign_in_path_for(resource)
 	if User.count == 1
 		#Make Admin
 		current_user.admin = true
 		current_user.save
 	end
    if current_user.fullname == "" 
    	edit_user_registration_url
    else
    	root_path
    end
 end
end
