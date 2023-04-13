module ProvidersHelper
  def provider_card(provider, show = false)
    content_tag :div, id: dom_id(provider), class: "flex-initial w-64 rounded overflow-hidden shadow-lg mb-2 p-4" do
      content_tag :div, class: "px-6 py-4" do
        concat link_to(provider.name, provider_path(provider))
        concat content_tag(:div, provider_information_list(provider, show), class: "flex items-center")
        end
      end
  end

  def provider_information_list(provider, show)
    content_tag(:div, class: "text-sm mr-2") do
      concat div_tag(:div, default_css_provider_card, 'Contact name', provider.contact_name)
      concat div_tag(:div, default_css_provider_card, 'Phone number', provider.phone )
      if show
        concat div_tag(:div, default_css_provider_card, 'NIT number', provider.nit )
        concat link_to('Edit', edit_provider_path(provider))
        concat button_to('Delete',provider_path(provider.id), method: :delete,)
      end
    end
  end

  def div_tag(tag, css, name, provider)
    content_tag(tag, '', class: css ) do
      "#{name}: #{default_message(provider)}"
    end
  end

  def default_message(provider)
    provider.present? ? provider : 'Sin información en la tabla'
  end

  def default_css_provider_card
    "text-gray-600"
  end

  def submit_provider_form(provider)
    if provider.persisted?
      button_to('Update Bank', '', class: blue_btn)
    else
      button_to('Create Bank', '', class: blue_btn)
    end
  end

end
