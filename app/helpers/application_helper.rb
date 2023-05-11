module ApplicationHelper
  include SharedHelper
  def current_page?(path)
    request.path == path
  end

end
