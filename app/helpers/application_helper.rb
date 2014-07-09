module ApplicationHelper
	
	def error_messages_for(object)
		render(:partial => 'application/error_messages',
			:locals => {:object => object})
	end
	
	def status_tag(boolean, options={})
	  options[:true_text] ||= 'active'
	  options[:false_text] ||='inactive'

	  if boolean
	  	content_tag(:span, options[:true_text], :class => 'status true')
	  else
	  	content_tag(:span, options[:false_text], :class => 'status false')
	  end		
	end
	
	def flash_class(level)
    case level
        when 'notice' then "alert-info"
        when 'success' then "alert-success"
        when 'warning' then "alert-warning"
        when 'danger' then "alert-danger"
    end
	end	

	def human_name
		@current_user = AdminUser.where(:username => session[:username]).first
    
    if @current_user
      @human_name = @current_user.first_name + ' ' + @current_user.last_name
    end
	end

	
	def check_home
		current_url = request.env['PATH_INFO']
		path = Rails.application.routes.recognize_path(current_url)
		if path[:action] == 'index'
			return 'active'
		end
	end

	def check_subject(subject)
		# current_url = request.env['PATH_INFO']
		# path = Rails.application.routes.recognize_path(current_url)
		if params[:permalink].try(:starts_with?, subject.name)
	  		return " active"
  	end
	end

	def check_page(page)
		if params[:permalink] == page.permalink
			return "active"
		end
	end
	

end
