class DemoController < ApplicationController
  
  layout 'application'

  def index
  	
  end

  def hello
  	# render ('index') 
    @array  = [1,2,3,4,5]
    @id     = params[:id].to_i
    @page   = params[:page].to_i

  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end

  def lynda
  	redirect_to("http://lynda.com")
  end

  def text_helpers
  end

  def escape_output
  end

  def make_error
    # My guesses for the 3 most common errors:
    # render(:text => "test" #syntax error
    # render(:text => @something.upcase) #undefined method
    # render(:text => "1" + 1) # can't convert type
  end
  

  # def Subjects
  #   redirect_to(:conroller => 'Subjects', :action => 'index')
  # end


end
