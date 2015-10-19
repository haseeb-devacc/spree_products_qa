
module FrontendApi
  class Spree::QuestionsController < Spree::StoreController
    before_filter :load_data

    private
    def load_data
      @product = Spree::Product.find(allowed_params[:product_id])
    end

    def allowed_params
      params.require(:question).permit(:content, :product_id)
    end
  end
end