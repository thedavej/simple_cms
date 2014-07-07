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

	

	


	def nav_link(text, link)
    recognized = Rails.application.routes.recognize_path(link)
    if recognized[:controller] == params[:controller] && recognized[:action] == params[:action]
        content_tag(:li, :class => "active") do
            link_to( text, link)
    		end
    else
        content_tag(:li) do
            link_to( text, link)
        end
    end
	end
	
end
