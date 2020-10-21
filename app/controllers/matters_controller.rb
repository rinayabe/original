class MattersController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  def index
    @matters = Matter.includes(:user).order('created_at DESC')
  end

  def new
    @matter = Matter.new
  end

  def create
    Matter.create(matter_params)
  end

  def destroy
    matter = Matter.find(params[:id])
    matter.destroy
  end

  def edit
  end

  def update
    matter = Matter.find(params[:id])
    matter.update(matter_params)
  end

  def show
    @donation = Donation.new
    @donations = @matter.donations.includes(:user)
  end

  private

  def matter_params
    params.require(:matter).permit(:name, :explain, :price, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @matter = Matter.find(params[:id])
  end
end
