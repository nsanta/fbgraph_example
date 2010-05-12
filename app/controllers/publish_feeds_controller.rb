class PublishFeedsController < ApplicationController

  def index
    user = client.selection.me.info!
    client.selection.user(user[:id]).feed.publish!(:message => 'test message []FBGraph[]' , :name => 'test name')
  end
end
