class DashboardController < ApplicationController
  def show
    # @feed = user_feed
    @feed = TwitterService.new(current_user).user_feed
  end
end
