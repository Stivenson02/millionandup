class Controllers::Home::Index::SectionShoppingHistory::ModalHistory::DetailHistory::Component < ApplicationComponent
  def initialize(options: {})
    @trolley = (options[:trolley])
  end
end
