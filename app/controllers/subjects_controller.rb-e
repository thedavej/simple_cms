class SubjectsController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in

  def index
  	@subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
    @subject_count = Subject.count + 1
  end

  def create
    #instatiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
    #If success, redirect to the index action
      flash[:notice] = "Subject saved successfully"
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
  end

  def update
     # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
    #If success, redirect to the show action
      flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'show', :id => @subject.id)
    # If fails, redisplay the form to user can fix mistakes
    else
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully"
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
