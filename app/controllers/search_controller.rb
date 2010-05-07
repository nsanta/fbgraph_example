class SearchController < ApplicationController
  
  def show
    result = client(session[:access_token]).search.query(params[:q]).on(params[:on]).info
    render :json => result
  end
  
end
