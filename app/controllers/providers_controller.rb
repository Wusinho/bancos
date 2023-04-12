class ProvidersController < ApplicationController
  def index
    @provider = Provider.new
    @providers = current_user.providers
  end

  def create
    @provider = current_user.providers.build(provider_params)

    if @provider.save
      streams = []
      streams << turbo_stream.prepend('providers', partial: 'providers/provider', locals: { provider: @provider })
      streams << turbo_stream.replace('provider_form', partial: 'providers/form', locals: { provider: Provider.new})
      streams << turbo_stream.replace('message', partial: 'shared/message', locals: { message: "#{@provider.name} created"})
      render turbo_stream: streams
    else
      # turbo_error_message(@provider)
      render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                                locals: { message: @provider.errors.full_messages.to_sentence })
    end


  end

  private

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :phone)
  end
end
