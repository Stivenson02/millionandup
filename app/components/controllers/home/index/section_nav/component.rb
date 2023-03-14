class Controllers::Home::Index::SectionNav::Component < ApplicationComponent
  def initialize(options: {})
    t_count = 0
    trolley = Trolley.find_by(user_id: 0, status: :created)
    trolley.nil? unless trolley.trolley_details.each { |a| t_count = t_count + a.amount }
    @trolley_detail_count = t_count
  end
end
