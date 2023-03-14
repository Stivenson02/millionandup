require 'rails_helper'

RSpec.describe TrolleyService, type: :service do

  before do
    @product = create(::Product.model_name.singular.to_sym)
    @trolley_detail = create(::TrolleyDetail.model_name.singular.to_sym)
  end

  describe '#initialize' do
    context 'success' do
      it do
        service = described_class.new
        expect(service.instance_of?(described_class)).to be true
      end
    end
  end

  describe '#call cases' do
    context 'success delete_product' do
      it do
        service = described_class.new(product: @product).call
        expect(Trolley.all.count).to eq(1)
        expect(service[:status]).to eq(:success)
      end
    end

    context 'success add_product' do
      it do
        service = described_class.new(product: @trolley_detail.product, type: :delete_product, trolley_detail: @trolley_detail).call
        expect(Trolley.last.nil?).to eq(true)
        expect(service[:status]).to eq(:success)
      end
    end
  end

end