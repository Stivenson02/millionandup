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
require 'rails_helper'

RSpec.describe Historical, type: :model do
  describe "fields" do
    it { should have_db_column(:change).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:movement_type).of_type(:string).with_options(null: false) }
  end
end
