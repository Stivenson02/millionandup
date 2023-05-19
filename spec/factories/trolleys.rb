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
FactoryBot.define do
  model = ::Trolley
  factory_key = model.model_name.singular.to_sym
  factory factory_key, class: model do
    total { "0" }
    user_ip { "192.0.0.1" }
    status { 0 }
  end
end
