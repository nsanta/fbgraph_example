class OauthController < ApplicationController
  
  def start
    redirect_to client.authorization.authorize_url(:redirect_uri => callback_oauths_url)
  end

  def callback
    access_token = client.authorization.process_callback(params[:code], :redirect_uri => callback_oauths_url)
    session[:access_token] = access_token
    user_json = client.selection.me.with('home').info
    # in reality you would at this point store the access_token.token value as well as 
    # any user info you wanted
    render :json => user_json
  end

  
  
end
