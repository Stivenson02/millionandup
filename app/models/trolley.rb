# == Schema Information
#
# Table name: trolleys
#
#  id             :bigint           not null, primary key
#  user_id        :integer
#  status         :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  total

class Trolley < ApplicationRecord

  #== Enum
  enum status: { created: 0,
                in_process: 1,
                paid: 2,
                canceled: 3,
                rejected: 4 }, _default: :created

  #===== Associations
  has_many :trolley_details
end
