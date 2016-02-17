class DashboardController < ApplicationController
  def show
    @feed = user_feed
  end
end
