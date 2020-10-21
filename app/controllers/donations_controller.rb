class DonationsController < ApplicationController
  def create
    
    donation = Donation.create(donation_params)
    if donation.valid?
      pay_matter
      donation.save
    redirect_to "/matters/#{donation.matter.id}"
    end
  end

  private
  def donation_params
    params.require(:donation).permit(:price).merge(user_id: current_user.id, matter_id: params[:matter_id], token: params[:token])
  end

  def pay_matter
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: donation_params[:price],
        card: donation_params[:token],
        currency: 'jpy'
      )
  end
end
