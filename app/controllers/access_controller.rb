class AccessController < ApplicationController
  
  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, 
      :attempt_login, :logout]


  def index
  	# display text and links
    
  end

  def login
  	#login form
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = AdminUser.where(:username => params[:username]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end
  	if authorized_user
  		# Mark user as logged in
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
  		if params[:page_id]
        redirect_to(:controller => 'sections', :action => 'index', :page_id => params[:page_id])
        else
        redirect_to(:action => 'index')
      end
  	else
  		flash[:danger] = "Invalid username/password combination."
  		redirect_to(:action => 'login')
  	end
  end

  def logout
  	# Mark user as logged out
    session[:user_id] = nil
    session[:username] = nil

  	flash[:success] = "You are now logged out."
  	redirect_to(:controller => 'public', :action => 'index')
  end

  
  


end
