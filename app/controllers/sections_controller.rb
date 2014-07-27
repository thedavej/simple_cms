class SectionsController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in
  before_action :find_page

  def index
    # @sections = Section.sorted
    if @page
      @all_sect = false
      @sections = @page.sections.sorted.paginate(page: params[:page], per_page: 10).search(params[:search])
    else
      @all_sect = true
      @sections = Section.all.sorted_by_subject.namesorted.paginate(page: params[:page], per_page: 10).search(params[:search])
      @page = Page.first
    end
    # For search
    # @sections = @page.sections.search(params[:search])
  end

  def all_index
    @sections = Section.newest_first
   
    @page = Page.find(1)
  end

  def show
    @section = Section.find(params[:section_id])
    render action: "show_modal", layout: "crud_modal"
  end

  def new
    @section = Section.new({:page_id => @page.id, :content_type => 'Article'})
    @pages = @page.subject.pages.sorted
    @section_count = @page.sections.count + 1
    render action: "new_modal", layout: "crud_modal"
  end

  def create
    @section = Section.new(sections_params)
    @editor = AdminUser.find(session[:user_id])
    if @section.save
      @time = @section.updated_at.to_s
      SectionEdit.create(:admin_user_id => @editor.id,
       :section_id => @section.id, :summary => 
       @editor.name + " created '#{@section.name}' with id: '#{@section.id}' at " + @time)
      flash[:success] = "Section created successfully"
      redirect_to(:action => 'index', :subject_id => @page.subject.id, :page_id => @page.id)
    else
      @pages = Page.order('position ASC')
      @section_count = @page.sections.count + 1
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    @pages = Page.order('position ASC')
    @section_count = @page.sections.count
    render action: "edit_modal", layout: "crud_modal"
  end

  def edit_specifications
    @section = Section.find(params[:section_id])
    @pages = Page.order('position ASC')
    @section_count = @page.sections.count
    render action: "edit2"
  end

  def update
    @section = Section.find(params[:id])
    @editor = AdminUser.find(session[:user_id])
    if @section.update_attributes(sections_params)
      @time = @section.updated_at.to_s
      SectionEdit.create(:admin_user_id => @editor.id,
       :section_id => @section.id, :summary => 
       @editor.name + " updated '#{@section.name}' with id: '#{@section.id}' at " + @time)
      flash[:success] = "Section updated successfully"
      redirect_to(:action => 'index', :subject_id => @page.subject.id, :page_id => @page.id)
    else
      @pages = Page.order('position ASC')
      @section_count = Section.count
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:section_id])
    render action: "delete_modal", layout: "crud_modal"
  end

  def destroy
    @section = Section.find(params[:section_id]).destroy
      @editor = AdminUser.find(session[:user_id])
      @time = @section.updated_at.to_s
      SectionEdit.create(:admin_user_id => @editor.id,
       :section_id => @section.id, :summary => 
       @editor.name + " deleted '#{@section.name}' with id: '#{@section.id}' at " + @time)
    flash[:danger] = "Section '#{@section.name}' deleted successfully."
    redirect_to(:action => 'index', :subject_id => @page.subject.id, :page_id => @page.id)
  end

  private

  def sections_params
    params.require(:section).permit(:name, :position, :visible, :page_id, :content, :content_type, :image)
  end

  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
    end
  end
    
  
end
