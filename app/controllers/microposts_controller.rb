class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:destroy, :pin , :pin_out]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    @micropost.pinned = false
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  def pin
    current_user.microposts.where(pinned: true).update_all(pinned: false)
    @micropost.update(pinned: true)
    redirect_to request.referrer, status: :see_other
  end

  def pin_out
    @micropost.update(pinned: false)
    redirect_to request.referrer, status: :see_other
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :image, :pinned)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @micropost.nil?
    end
end
