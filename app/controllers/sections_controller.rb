class SectionsController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in
  before_action :find_page

  def index
    # @sections = Section.sorted
    @sections = @page.sections.sorted
  end

  def all_index
    @sections = Section.newest_first
   
    @page = Page.find(1)
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:page_id => @page.id, :content_type => 'HTML'})
    @pages = @page.subject.pages.sorted
    @section_count = @page.sections.count + 1
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
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      @pages = Page.order('position ASC')
      @section_count = @page.sections.count + 1
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.order('position ASC')
    @section_count = @page.sections.count
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
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
    else
      @pages = Page.order('position ASC')
      @section_count = Section.count
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id]).destroy
      @editor = AdminUser.find(session[:user_id])
      @time = @section.updated_at.to_s
      SectionEdit.create(:admin_user_id => @editor.id,
       :section_id => @section.id, :summary => 
       @editor.name + " deleted '#{@section.name}' with id: '#{@section.id}' at " + @time)
    flash[:danger] = "Section '#{@section.name}' deleted successfully."
    redirect_to(:action => 'index', :page_id => @page.id)
  end

  private

  def sections_params
    params.require(:section).permit(:name, :position, :visible, :page_id, :content, :content_type)
  end

  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
    end
  end
    
  
end
