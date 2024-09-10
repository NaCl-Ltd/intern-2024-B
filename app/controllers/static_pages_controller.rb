class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost  = current_user.microposts.build

      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10).where(deleted_at: nil)
      @pinned = @feed_items.where(pinned: true)
      @not_pinned = @feed_items.where(pinned: false)
    end
  end

  def lately
    if logged_in?
      @feed_items = current_user.feed.limit(10).where(deleted_at: nil)
    end
  end

  def delete
    if logged_in?
      @microposts = current_user.microposts.paginate(page: params[:page]).where.not(deleted_at: nil)
    end
  end


  def help
  end

  def about
  end

  def contact
  end
end
