require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "fields" do
    it { should have_db_column(:title).of_type(:string).with_options(null: false) }
    it { should have_db_column(:description).of_type(:string).with_options(null: false) }
    it { should have_db_column(:discountPercentage).of_type(:string).with_options(null: false) }
    it { should have_db_column(:category).of_type(:string).with_options(null: false) }
    it { should have_db_column(:thumbnail).of_type(:string).with_options(null: false) }
    it { should have_db_column(:stock).of_type(:integer).with_options(null: false) }
  end

  it 'should verify if log_data field exist' do
    state = create(::Product.model_name.singular.to_sym)
    expect(state.attributes.include?('title')).to be_truthy
  end

end
