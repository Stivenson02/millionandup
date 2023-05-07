class Controllers::Home::Index::SectionTrolley::ModalTrolley::DetailTrolley::Component < ApplicationComponent
  def initialize(options: {})
    @trolley_details = (options[:trolley_datil])
    @user_ip = (options[:user_ip])
    @user_login = (options[:user_login])
  end
end
