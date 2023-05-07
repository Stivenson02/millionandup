class ApplicationController < ActionController::Base
  rescue_from ApiClient::Exceptions::NotFound, :with => :not_found
  include Users::DashboardHelper

  before_action :set_action_cable_identifier

  def not_found
    render :file => '/public/404.html', :status => 404
  end

  def set_action_cable_identifier
    cookies.encrypted[:session_id] = session.id.to_s
  end

end
