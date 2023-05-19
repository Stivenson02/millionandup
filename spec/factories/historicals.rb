# == Schema Information
#
# Table name: historicals
#
#  id            :bigint           not null, primary key
#  change        :integer          not null
#  movement_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_id      :bigint           not null
#  movement_id   :bigint           not null
#
# Indexes
#
#  index_historicals_on_admin_id  (admin_id)
#  index_historicals_on_movement  (movement_type,movement_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_id => admins.id)
#
FactoryBot.define do
  factory :historical do
    admin { nil }
    movement { nil }
    change { 1 }
  end
end
