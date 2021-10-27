require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant) }
    it { should belong_to(:customer) }
  end

  describe 'validations' do
    it { should validate_presence_of(:status) }
  end

  # before(:each) do
  # end
  #
  # describe 'class methods' do
  #   describe '#name' do
  #     it 'returns ' do
  #       expect(Class.name).to eq()
  #     end
  #   end
  # end
  #
  # describe 'instance methods' do
  #   describe '._name' do
  #     it 'returns ' do
  #       expect(@var._name).to eq()
  #     end
  #   end
  # end
end
