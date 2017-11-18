module ApplicationHelper
  def display_char(char)
    char.nil? ? '' : char.to_s
  end
end
