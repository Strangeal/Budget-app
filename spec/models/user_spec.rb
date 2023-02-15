require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Tom', email: 'tom@apple.com', password: 'hello123')
  end

  context 'Test valdation' do
    it 'Name should return present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'Name should return Tom' do
      expect(@user).to be_valid
    end
  end
end
