class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :img_url

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def img_url(tweet)
    data = JSON.parse(tweet.to_json).to_h
    data["quoted_status"]["user"]["profile_image_url"]
  end

end
