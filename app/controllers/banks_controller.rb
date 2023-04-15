class BanksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bank, only: %i[show update edit destroy]

  def index
    @bank = Bank.new
    @banks = current_user.own_banks.paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def create
    @bank = Bank.new(bank_params)
    if @bank.save
      streams = []
      # streams << turbo_stream.prepend('banks', partial: 'banks/bank', locals: { bank: @bank })
      streams << turbo_stream.replace('bank_form', partial: 'banks/form', locals: { bank: Bank.new})
      streams << turbo_stream.replace('message', partial: 'shared/message', locals: { message: "#{@bank.name} created"})

      render turbo_stream: streams
    else
      render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                                locals: { message: @bank.errors.full_messages.to_sentence })
    end

  end

  def update
    if @bank.update(bank_params)
      streams = []
      streams << turbo_stream.replace('message', partial: 'shared/message', locals: { message: "#{@bank.name} Updated"})
      render turbo_stream: streams
    else
      render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                                locals: { message: @bank.errors.full_messages.to_sentence })
    end

  end

  def destroy
    render turbo_stream: turbo_stream.remove(@bank)
    @bank.destroy
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name, :account, :provider_id)
  end

end
