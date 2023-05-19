# == Schema Information
#
# Table name: products
#
#  id                 :bigint           not null, primary key
#  description        :string           not null
#  discountPercentage :string           not null
#  price_cents        :integer          default(0), not null
#  price_currency     :string           default("USD"), not null
#  stock              :integer          not null
#  thumbnail          :string           not null
#  title              :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "fields" do
    it { should have_db_column(:title).of_type(:string).with_options(null: false) }
    it { should have_db_column(:description).of_type(:string).with_options(null: false) }
    it { should have_db_column(:discountPercentage).of_type(:string).with_options(null: false) }
    it { should have_db_column(:thumbnail).of_type(:string).with_options(null: false) }
    it { should have_db_column(:stock).of_type(:integer).with_options(null: false) }
  end

  it 'should verify if log_data field exist' do
    state = create(::Product.model_name.singular.to_sym)
    expect(state.attributes.include?('title')).to be_truthy
  end

end
