Spree::PaymentMethod.class_eval do 

  def create
    Spree::PaymentMethod.create(spree_params)
  end

  private

  def spree_params
    params.permit(:source, :source_type, :response_code, :avs_response, :details)
  end
end
