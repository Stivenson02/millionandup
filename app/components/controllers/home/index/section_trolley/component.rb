class Controllers::Home::Index::SectionTrolley::Component < ApplicationComponent
  def initialize(options: {})
    @trolley_count = (options[:trolley_count])
  end
end
