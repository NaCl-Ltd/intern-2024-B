class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @pinned = @feed_items.where(pinned: true)
      @not_pinned = @feed_items.where(pinned: false)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
