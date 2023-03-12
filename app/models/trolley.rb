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
class Trolley < ApplicationRecord

  #===== Fields
  monetize :total_cents

  #== Enum
  enum status: {
    created: 0,
    in_process: 1,
    paid: 2
  }, _default: :created
end
