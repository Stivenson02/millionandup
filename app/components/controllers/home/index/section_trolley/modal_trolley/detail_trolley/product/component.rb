class Controllers::Home::Index::SectionTrolley::ModalTrolley::DetailTrolley::Product::Component < ApplicationComponent
  def initialize(options: {})
    @trolley_detail = (options[:trolley_detail])
    @user_ip = (options[:user_ip])
    @user_login = (options[:user_login])
  end
end
