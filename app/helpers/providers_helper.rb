module ProvidersHelper
  def provider_card(provider)
    content_tag :div, class: "max-w-sm rounded overflow-hidden shadow-lg mb-2" do
      content_tag :div, class: "px-6 py-4" do
        concat div_tag(:div,"font-bold text-xl mb-2", provider.name)
        concat content_tag(:div, provider_information_list(provider), class: "flex items-center")
        end
      end
  end

  def provider_information_list(provider)
    content_tag(:div, class: "text-sm mr-2") do
      concat div_tag(:div,"text-gray-900 leading-none", provider.contact_name)
      concat div_tag(:p, "text-gray-600", provider.phone )
    end
  end

  def div_tag(tag, css, provider = 'Sin información en la tabla')
    content_tag(tag, '', class: css ) do
      provider
    end

  end

end
