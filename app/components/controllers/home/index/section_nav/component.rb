class Controllers::Home::Index::SectionNav::Component < ApplicationComponent
  def initialize(options: {})
    trolley = Trolley.find_by(user_id: 0)
    @trolley_detail_count = trolley.nil? ? 0 : trolley.trolley_details.count
  end
end
