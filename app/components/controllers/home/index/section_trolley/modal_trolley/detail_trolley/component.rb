class Controllers::Home::Index::SectionTrolley::ModalTrolley::DetailTrolley::Component < ApplicationComponent
  def initialize(options: {})
    @trolley_details = (options[:trolley_datil])
  end
end
