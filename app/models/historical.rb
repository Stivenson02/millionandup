# == Schema Information
#
# Table name: historicals
#
#  id            :bigint           not null, primary key
#  change        :integer
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
class Historical < ApplicationRecord

  #== Enum
  enum change: { created: 0,
                 edit: 1,
                 canceled: 2,
                 rejected: 3 }, _default: :created

  #===== Associations
  belongs_to :admin
  belongs_to :movement, polymorphic: true
end
