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
    @transaction = Transaction.new(transaction_params)

    person = Person.find(@transaction.poster)
    if @transaction.save
      person.is_active = false
      person.save
      redirect_to person
    else
      redirect_to person
    end
  end
  


  def show
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(transaction_params)

    person = Person.find(@transaction.poster)
    if @transaction.save
      person.is_active = false
      person.save
      redirect_to person
    else
      redirect_to person
    end
  end
  
  private
    def transaction_params
      params.require(:transaction).permit(:poster,:bidder, :post_id, :bid_id, :date )
    end




end
