class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  
  protected

  def client
    @client ||= FBGraph::Client.new(:client_id => '114709451898747',
                                   :secret_id => '7c87164749a02552e3d204142e3af16b' , 
                                   :token => session[:access_token])
  end
end
