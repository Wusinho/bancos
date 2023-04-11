class BanksController < ApplicationController
  def index
    @bank = Bank.new
    @banks = current_user.banks
  end

  def create
    @bank = current_user.banks.build(bank_params)

    if @bank.save
      streams = []
      streams << turbo_stream.prepend('banks', partial: 'banks/bank', locals: { bank: @bank })
      streams << turbo_stream.replace('bank_form', partial: 'banks/form', locals: { bank: Bank.new})

      render turbo_stream: streams
    else
    end

  end

  private

  def bank_params
    params.require(:bank).permit(:name)
  end

end
