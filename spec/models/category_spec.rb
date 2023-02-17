require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.create(name: 'Tom', email: 'tom@apple.com', password: 'hello123')
    @first_cat = Category.create(author: @user, name: 'Courses', icon: 'https://icon-library.com/images/courses-icon/courses-icon-20.jpg')
  end

  context 'Test Validation' do
    it 'name should be present' do
      @first_cat.name = nil
      expect(@first_cat).to_not be_valid
    end

    it 'name should not be nil' do
      @first_cat.icon = nil
      expect(@first_cat).to_not be_valid
    end

    it 'user should be the arthor of first_cat' do
      expect(@first_cat.author).to eq @user
    end
  end
end
