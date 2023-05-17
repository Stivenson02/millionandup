# == Schema Information
#
# Table name: trolleys
#
#  id         :bigint           not null, primary key
#  status     :integer          not null
#  total      :string           default("0")
#  user_ip    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trolley < ApplicationRecord

  #== Enum
  enum status: { created: 0,
                in_process: 1,
                paid: 2,
                canceled: 3,
                rejected: 4 }, _default: :created

  #===== Associations
  has_many :trolley_details
  has_one :trolley_user, dependent: :destroy, inverse_of: :trolley
  has_one :user, through: :trolley_user


end
