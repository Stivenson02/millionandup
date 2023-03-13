class Controllers::Home::Index::SectionTrolley::ModalTrolley::Component < ApplicationComponent
  def initialize(options: {})
    @trolley = (options[:trolley])
  end
end
