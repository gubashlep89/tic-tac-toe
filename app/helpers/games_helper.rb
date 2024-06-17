module GamesHelper
  def icon_name(name)
    name == 'x' ? 'close' : 'radio_button_unchecked'
  end

  def winning_class(win_condition, index)
    win_condition.include?(index) ? 'icon-green' : ''
  end
end
