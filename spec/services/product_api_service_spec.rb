require 'rails_helper'

RSpec.describe ProductsApiService, type: :service do

  describe '#initialize' do
    context 'success' do
      it do
        service = described_class.new
        expect(service.instance_of?(described_class)).to be true
      end
    end
  end

  describe '#call cases' do
    context 'success' do
      it do
        service = described_class.new.call
        expect(service[:status]).to eq(:success)
        expect(service[:response][:data].count.integer?).to eq(true)
      end
    end
  end

end