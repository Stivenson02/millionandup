class ApplicationController < ActionController::Base
  rescue_from ApiClient::Exceptions::NotFound, :with => :not_found

  def not_found
    render :file => '/public/404.html', :status => 404
  end
end
