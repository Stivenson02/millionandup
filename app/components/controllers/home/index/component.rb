class Controllers::Home::Index::Component < ApplicationComponent
  def initialize(options: {})
    @products = (options[:products].sort_by { |val| [val[:title], val[:price]] })
  end
end
