class PagesController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in
  before_action :find_subject

  def index
    if @subject
      @all_pages = false
      @pages = @subject.pages.sorted.paginate(page: params[:page], per_page: 10)
    else
      @all_pages = true
      @pages = Page.all.sub_sorted
      @pages = @pages.sorted.paginate(page: params[:page], per_page: 10)
      @subject = Subject.first  
    end
  end

  def all_index
    @pages = Page.all.sub_sorted
    @pages = @pages.sorted
    @subject = Subject.first
  end

  def show
    @page = Page.find(params[:page_id])
    render action: "show_modal", layout: "crud_modal"
  end

  def new
    @page = Page.new({:subject_id => @subject.id})
    @subjects = Subject.order('position ASC')
    @page_count = @subject.pages.count + 1
    render action: "new_modal", layout: "crud_modal"
  end

  def create
    @page = Page.new(pages_params)
    if @page.save
      @page.editors << AdminUser.find(session[:user_id])
      flash[:success] = "Page created successfully"
      redirect_to(:action => 'index', :subject_id => @subject.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = @subject.pages.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:page_id])
    @subjects = Subject.order('position ASC')
    @page_count = @subject.pages.count
    render action: "edit_modal", layout: "crud_modal"
  end

  def update
    @page = Page.find(params[:page_id])
    if @page.update_attributes(pages_params)
      @page.editors << AdminUser.find(session[:user_id])
      flash[:success] = "Page updated successfully"
      redirect_to(:action => 'index', :id => @page.id, :subject_id => @subject.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:page_id])
    render action: "delete_modal", layout: "crud_modal"
  end

  def destroy
    page = Page.find(params[:page_id]).destroy
    flash[:danger] = "Page 'page.name' was destroyed successfully"
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
