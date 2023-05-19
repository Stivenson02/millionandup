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
class Historical < ApplicationRecord

  #== Enum
  enum change: { created: 0,
                 edit: 1,
                 remove_category_of_product: 2,
                 added_category_of_product: 3,
                 added_images: 4,
                 remove_image: 5,
                 rejected: 6 }, _default: :created

  #===== Associations
  belongs_to :admin
  belongs_to :movement, polymorphic: true
end
