class SubjectsController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in

  def index
  	@subjects = Subject.sorted.paginate(page: params[:page], per_page: 10)
  end

  def show
    @subject = Subject.find(params[:id])
    render action: "show_modal", layout: "crud_modal"
  end

  def new
    @subject = Subject.new({})
    @subject_count = Subject.count + 1
    render action: "new_modal", layout: "crud_modal"
  end

  def create
    #instatiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
    #If success, redirect to the index action
      flash[:success] = "Subject saved successfully"
      redirect_to(:action => 'index')
    # If fails, redisplay the form to user can fix mistakes
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
    render action: "edit_modal", layout: "crud_modal"
  end

  def update
     # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
    #If success, redirect to the show action
      flash[:success] = "Subject updated successfully"
      redirect_to(:action => 'index')
    # If fails, redisplay the form to user can fix mistakes
    else
      @subject_count = Subject.count
      render('edit')
    end
  end

  def quick_update
    @subject = Subject.find(params[:subject_id])
    @subject.update_attributes(subject_params)
    redirect_to(:controller => 'pages', :action => 'index', :subject_id => @subject.id)
  end

  def delete
    @subject = Subject.find(params[:id])
    render action: "delete_modal", layout: "crud_modal"
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:danger] = "Subject '#{subject.name}' destroyed successfully"
    redirect_to(:action => 'index')
  end

  private

    def subject_params
      # Same as using "params[:subject]" except that it:
      # raises and error if subject is not present and
      # allows listed params to be mass assigned.
     params.require(:subject).permit(:name, :position, :visible)
   end
   # This is a test
end
