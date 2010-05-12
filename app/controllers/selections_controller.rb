class SelectionsController < ApplicationController
  
  def index
  end
  
  def create
    selection = client.selection
    selection.send(params[:type], params[:object])
    selection.send(params[:connection_type]) unless params[:connection_type].blank?
    render :json => selection.info!
  end

end
