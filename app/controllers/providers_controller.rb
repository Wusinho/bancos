class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show]
  def index
    @provider = Provider.new
    @provider.banks.build
    @providers = current_user.providers.paginate(page: params[:page], per_page: 10)
  end

  def show

  end

  def create
    @provider = current_user.providers.build(provider_params)

    if @provider.save
      provider = Provider.new
      provider.banks.build
      streams = []
      streams << turbo_stream.prepend('providers', partial: 'providers/provider', locals: { provider: @provider })
      streams << turbo_stream.replace('provider_form', partial: 'providers/form', locals: { provider: provider } )
      streams << turbo_stream.replace('message', partial: 'shared/message', locals: { message: "#{@provider.name} created"})
      render turbo_stream: streams
    else
      render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                                locals: { message: @provider.errors.full_messages.to_sentence })
    end


  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :phone, banks_attributes: [:account, :name, :_destroy])
  end
end
