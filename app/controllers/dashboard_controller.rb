class DashboardController < ApplicationController
  def show
    service = TwitterService.new(current_user)
    @followers ||= service.followers.count
    @friends ||= service.friends.count
  end

  def feed
    @feed = TwitterService.new(current_user).user_feed
  end

  def mentions
    @feed = TwitterService.new(current_user).user_mentions
  end

  def retweeted
    @feed = TwitterService.new(current_user).retweeted
  end
end
