module ProvidersHelper
  def provider_index_card(provider)
    content_tag :div, class: "max-w-sm rounded overflow-hidden shadow-lg mb-2 p-4" do
      content_tag :div, class: "px-6 py-4" do
        concat link_to(provider.name, provider_path(provider))
        concat content_tag(:div, provider_information_list(provider), class: "flex items-center")
        end
      end
  end

  def provider_information_list(provider)
    content_tag(:div, class: "text-sm mr-2") do
      concat div_tag(:div,"text-gray-600", 'Contact name', provider.contact_name)
      concat div_tag(:div, "text-gray-600", 'Phone number', provider.phone )
    end
  end

  def div_tag(tag, css, name, provider )
    content_tag(tag, '', class: css ) do
      "#{name}: #{default_message(provider)}"
    end
  end

  def default_message(provider)
    provider.blank? ? 'Sin información en la tabla' : provider
  end

end
