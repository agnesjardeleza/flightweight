class BidsController < ApplicationController
   
  def new
    @bid = Bid.new 
  end
  
  def index
    @bids = Bid.all
  end

  def edit
    @bid= Bid.find(params[:id])
  end

  def update
    @bid =  Bid.find(params[:id])

    if @bid.update(bid_update_params)
      redirect_to @bid
    else
      render 'edit'
    end
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def create
    @post_id
    @bid = Bid.new(bid_params)
    @bid.bidder_id = current_user.id
    @bid.post_id = params[:post_id]

    if @bid.save 
      redirect_to Post.find(params[:post_id]) 
    else
      flash[:error] = @bid.errors.full_messages.first
      redirect_to post_path(id: params[:post_id])
    end
  end
  
  private
    def bid_params
      params.require(:bid).permit(:post_id,:bidder_id, :weight, :details, :flight_number)
    end

    def bid_update_params
      params.require(:bid).permit(:weight, :details, :flight_number)
    end


 
end
