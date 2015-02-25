class BidsController < ApplicationController

  def create
    @bid = Bid.new(bid_params)

    if @bid.save
      redirect_to @bid.item, notice: 'Your bid has been recorded!'
    else
      @item = @bid.item
      render "items/show"
    end
  end


  private
    # Only allow a trusted parameter "white list" through.
    def bid_params
      params.require(:bid).permit(:amount, :item_id)
    end
end
