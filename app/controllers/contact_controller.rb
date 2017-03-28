class ContactController < ApplicationController
  def index
  end
  def create
    @name = params[:name] # you can access this inside the view file
    # render plain: "Thank you #{params[:name]} for contacting us"
    redirect_to contact_path({name: @name})
  end
end
