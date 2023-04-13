module BanksHelper

  def submit_bank_form(bank)
    if bank.persisted?
      button_to('Update Bank', '', class: blue_btn)
    else
      button_to('Create Bank', '', class: blue_btn)
    end
  end

  def edit_redirection(bank, action_name)
    if action_name == 'show'
      link_to('Back', redirect_to(bank.provider))
    else
      link_to('Back', banks_path)
    end
  end

end
