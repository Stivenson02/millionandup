# == Schema Information
#
# Table name: trolley_details
#
#  id             :bigint           not null, primary key
#  amount         :integer          not null
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :bigint           not null
#  trolley_id     :bigint           not null
#
# Indexes
#
#  index_trolley_details_on_product_id  (product_id)
#  index_trolley_details_on_trolley_id  (trolley_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (trolley_id => trolleys.id)
#
require 'rails_helper'

RSpec.describe TrolleyDetail, type: :model do
  describe "fields" do
    it { should have_db_column(:product_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:trolley_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:amount).of_type(:integer).with_options(null: false) }
  end

  it 'should verify if log_data field exist' do
    state = create(::TrolleyDetail.model_name.singular.to_sym)
    expect(state.attributes.include?('product_id')).to be_truthy
    expect(state.attributes.include?('trolley_id')).to be_truthy
  end

  describe "Associations" do
    it { should belong_to(:product) }
  end
end
