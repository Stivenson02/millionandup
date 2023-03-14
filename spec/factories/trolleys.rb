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
FactoryBot.define do
  model = ::Trolley
  factory_key = model.model_name.singular.to_sym
  factory factory_key, class: model do
    total { "0" }
    user_id { 0 }
    status { 0 }
  end
end
