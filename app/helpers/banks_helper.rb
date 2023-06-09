module BanksHelper

  def submit_bank_form(bank, f)
    if bank.persisted?
      button_to(t(:'comun.actualizar'), banks_path(bank.id), class: special_green_btn)
    else
      f.submit t(:'comun.crear', nombre: 'Cuenta Bancaria'), class: green_big_btn
    end
  end

  def edit_redirection(bank, action_name)
    if action_name == 'show'
      link_to(t(:'comun.link_retroceder'), redirect_to(bank.provider))
    else
      link_to(t(:'comun.link_retroceder'), banks_path)
    end
  end

  def bank_account(bank_account)
    if bank_account.present?
      content_tag(:p, t(:'banco.numero_cuenta', numero: bank_account))

    else
      content_tag(:p, t(:'comun.sin_informacion'))
    end
  end

  def add_nested_bank(provider, f)
    return if provider.persisted?

    render 'providers/banks', f: f
  end
end
