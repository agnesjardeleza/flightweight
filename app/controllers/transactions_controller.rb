class TransactionsController < ApplicationController
  
  def new
    @transaction = Transaction.new 
  end
  
  def index
    @transactions = Transaction.all
  end

  def edit
    @transaction= Transaction.find(params[:id])
  end
  
  def update
    @transaction = Transaction.find(paramas[:id])

    post = Person.find(@transaction.poster)
    if @transaction.save
      post.is_active = false
      post.save
      redirect_to post
    else
      redirect_to post
    end
  end
  


  def show
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new
    @transaction.poster = params[:poster]
    @transaction.bidder = params[:bidder]
    @transaction.post_id = params[:post_id]
    @transaction.bid_id = params[:bid_id]
    @transaction.date = params[:date]
    

    post = Post.find(@transaction.post_id)
    if @transaction.save
      post.is_active = false
      post.save
      redirect_to post
    else
      redirect_to post
    end
  end
  
  private
    def transaction_params
      params.require(:transaction).permit(:poster,:bidder, :post_id, :bid_id, :date )
    end




end
