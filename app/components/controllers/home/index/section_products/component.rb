class Controllers::Home::Index::SectionProducts::Component < ApplicationComponent
  def initialize(options: {})
    @products = (options[:products])
    @user_ip = (options[:user_ip])
    @user_login = (options[:user_login])
  end
end
