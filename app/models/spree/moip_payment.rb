class Spree::MoipPayment < ActiveRecord::Base
  has_many :payments, :as => :source

  def create
    Spree::MoipPayment.create(spree_params)
  end

  private

  def spree_params
    params.permit(:source, :source_type, :response_code, :avs_response, :details)
  end
 
end
