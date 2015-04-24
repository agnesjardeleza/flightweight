class TransactionsController < ApplicationController
  
  def new
    @transation = Transaction.new 
  end
  
  def index
    @transations = Transaction.all
  end

  def edit
    @transation= Transaction.find(params[:id])
  end

  def update
    @transation =  Transaction.find(params[:id])

    if @transation.update(transaction_params)
      redirect_to @transation
    else
      render 'edit'
    end
  end

  def show
    @transation = Transaction.find(params[:id])
  end

  def create
    @transation = Transaction.new(transaction_params)

    if @transation.save 
      redirec_to @transation
    else
      render 'new'
    end
  end
  
  private
    def transaction_params
      params.require(:transaction).permit(:poster,:bidder, :post_id, :bid_id, :date )
    end




end
