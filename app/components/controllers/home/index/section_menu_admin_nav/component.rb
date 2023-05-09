class Controllers::Home::Index::SectionMenuAdminNav::Component < ApplicationComponent
  def initialize(options: {})
    @user_login = (options[:user_login])
  end
end
