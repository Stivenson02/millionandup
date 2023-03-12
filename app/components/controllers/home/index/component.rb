class Controllers::Home::Index::Component < ApplicationComponent
  def initialize(options: {})
    @products = (options[:products])
  end
end
