class Controllers::Home::Index::SectionShoppingHistory::ModalHistory::Component < ApplicationComponent
  def initialize(options: {})
    @trolleys = (options[:trolleys])
  end
end
