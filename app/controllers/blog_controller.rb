class BlogController < ApplicationController
  # => first part
  def index
    @test = params[:test]
  end

  # => second part
  def show() end

  # => third part
  def show
    # searching model:
    # it would load the find method argument with the id number 
    # and that would look up at the database records for that reference based upon that number in the URL
    # BlogPost.find params[:id]
    @id = params[:id]
  end

  def create
    redirect_to action: :index
  end
end
