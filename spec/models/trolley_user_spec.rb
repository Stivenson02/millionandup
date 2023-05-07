# == Schema Information
#
# Table name: trolley_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trolley_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_trolley_users_on_trolley_id  (trolley_id)
#  index_trolley_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (trolley_id => trolleys.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe TrolleyUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
