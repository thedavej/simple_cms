class PublicController < ApplicationController


  layout 'public'

  before_action :setup_navigation
  before_action :find_pages

  def index
  	# introductory text
    @subjects = Subject.sorted
    @current_user = AdminUser.where(:username => session[:username]).first
    
    if @current_user
      @human_name = @current_user.first_name + ' ' + @current_user.last_name
    end

  end

  def show
  	@page = Page.where(:permalink => params[:permalink], 
  		:visible => true).first
  	if @page.nil?
  		redirect_to(:action => 'index')
  	else
  		# display the page contents using show.html.erb
  	end

   # recognized = Rails.application.routes.recognize_path(link)
   


  end

  def show_pages
    @pages = @subject.pages.sorted
  end

  private

  def setup_navigation
    @subjects = Subject.visible.sorted
  end

  private

   def find_pages
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
  end

end
