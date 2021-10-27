require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many(:invoices) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:last_name) }
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
