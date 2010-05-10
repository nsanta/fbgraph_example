class OauthController < ApplicationController
  
  def start
    redirect_to client.authorization.authorize_url(:redirect_uri => callback_oauths_url , :scope => 'email,user_photos,friends_photos')
  end

  def callback
    access_token = client.authorization.process_callback(params[:code], :redirect_uri => callback_oauths_url)
    session[:access_token] = access_token
    user_json = client.selection.me.home.info
    # in reality you would at this point store the access_token.token value as well as 
    # any user info you wanted
    render :json => user_json
  end

  def oclient
    OAuth2::Client.new('114709451898747','7c87164749a02552e3d204142e3af16b', :site => 'https://graph.facebook.com')
  end
  
end
