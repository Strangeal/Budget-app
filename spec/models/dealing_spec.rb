require 'rails_helper'

RSpec.describe Dealing, type: :model do
  before :each do
    @user = User.create(name: 'Tom', email: 'tom@apple.com', password: 'hello123')
    @first_deal = Dealing.create(name: 'Tom', author: @user, amount: 15.99)
  end

  context 'Test validations' do
    it 'name should be present' do
      @first_deal.name = nil
      expect(@first_deal).to_not be_valid
    end

    it 'name should be present' do
      expect(@first_deal.author).to eq @user
    end

    it 'amount should be numeric' do
      expect(@first_deal).to be_valid
    end

    it 'amount should be numeric' do
      @first_deal.amount = 'hello'
      expect(@first_deal).to_not be_valid
    end
  end
end
