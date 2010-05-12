class PicturesController < ApplicationController
  def index
  end
  
  def create
    selection = client.selection
    selection.send(params[:type], params[:object])
    redirect_to selection.picture
  end
end
