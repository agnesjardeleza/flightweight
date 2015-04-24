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
    @transaction =  Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to @transaction
    else
      render 'edit'
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      person = Person.find(@transaction.poster)
      person.is_active = false
      person.save
      redirect_to person
    else
      render 'new'
    end
  end
  
  private
    def transaction_params
      params.require(:transaction).permit(:poster,:bidder, :post_id, :bid_id, :date )
    end




end
