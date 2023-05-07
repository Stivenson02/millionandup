class Controllers::Home::Index::SectionTrolley::ModalTrolley::Component < ApplicationComponent
  def initialize(options: {})
    @trolley = (options[:trolley])
    @user_ip = (options[:user_ip])
    @user_login = (options[:user_login])
  end
end
