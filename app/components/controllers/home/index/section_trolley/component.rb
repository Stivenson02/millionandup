class Controllers::Home::Index::SectionTrolley::Component < ApplicationComponent
  def initialize(options: {})
    @trolley_count = (options[:trolley_count])
    @user_ip = (options[:user_ip])
    @user_login = (options[:user_login])
  end
end
