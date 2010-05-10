class PicturesController < ApplicationController
  def index
  end
  
  def create
    selection = client(session[:access_token]).selection
    selection.send(params[:type], params[:object])
    redirect_to selection.picture
  end
end
