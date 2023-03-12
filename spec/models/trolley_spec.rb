# == Schema Information
#
# Table name: trolleys
#
#  id             :bigint           not null, primary key
#  user_id        :integer
#  status         :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  total_cents    :integer          default(0), not null
#  total_currency :string           default("USD"), not null
#
require 'rails_helper'

RSpec.describe Trolley, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
