# == Schema Information
#
# Table name: trolleys
#
#  id             :bigint           not null, primary key
#  user_id        :integer          not null
#  status         :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  total :string           default("USD"), not null
#
require 'rails_helper'

RSpec.describe Trolley, type: :model do

  describe "fields" do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:total).of_type(:string) }
    it { should have_db_column(:status).of_type(:integer).with_options(null: false) }
  end

  describe "trolley models_shared_example" do
    describe "enums" do
      it { should define_enum_for(:status).
        with_values(created: 0,
                    in_process: 1,
                    paid: 2,
                    canceled: 3,
                    rejected: 4
        ) }
    end
  end

  it 'should verify if log_data field exist' do
    state = create(::Trolley.model_name.singular.to_sym)
    expect(state.attributes.include?('status')).to be_truthy
  end

  describe "Associations" do
    it { should have_many(:trolley_details) }
  end
end
