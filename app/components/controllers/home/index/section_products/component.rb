class Controllers::Home::Index::SectionProducts::Component < ApplicationComponent
  def initialize(options: {})
    @products = (options[:products])
  end
end
