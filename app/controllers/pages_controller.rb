class PagesController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in
  before_action :find_subject

  def index
    # @pages = Page.sorted
      @pages = @subject.pages.sorted
  end

  def all_index
    @pages = Page.sub_sorted
    @pages = @pages.sorted
    @subject = Subject.find(1)
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:subject_id => @subject.id,
                    :name => 'Default'})
    @subjects = Subject.order('position ASC')
    @page_count = @subject.pages.count + 1
  end

  def create
    @page = Page.new(pages_params)
    if @page.save
      @page.editors << AdminUser.find(session[:user_id])
      flash[:notice] = "Page created successfully"
      redirect_to(:action => 'index', :subject_id => @subject.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = @subject.pages.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.order('position ASC')
    @page_count = @subject.pages.count
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(pages_params)
      @page.editors << AdminUser.find(session[:user_id])
      flash[:notice] = "Page updated successfully"
      redirect_to(:action => 'show', :id => @page.id,
                  :subject_id => @subject.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page 'page.name' was destroyed successfully"
    redirect_to(:action => 'index', :subject_id => @subject.id)
  end


  private
  
  def pages_params
    params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id,)
  end

  def find_subject
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
  end

end
