module InstsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_insts_path
    elsif action_name == 'edit'
      inst_path
    end
  end
end
