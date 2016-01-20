module ApplicationHelper
  def menu_active(path)
    "active" if current_page?(path)
  end
end
