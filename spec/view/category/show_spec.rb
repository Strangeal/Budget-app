require 'rails_helper'

RSpec.describe 'Category show view', type: :system do
  describe 'Show page' do
    before(:each) do
      @first_user = User.create(name: 'Tom', email: 'tom@apple.com', password: 'hello123')
      @category = Category.create(name: 'Food', icon: 'https://cdn-icons-png.flaticon.com/512/4835/4835459.png',
                                  author: @first_user)
      @dealing = Dealing.create(name: 'Bills', author: @first_user, amount: 23.09)
      @category_dealings = CategoryDealing.create(category_id: @category.id, dealing_id: @dealing.id)
      visit user_session_path
      fill_in 'Email', with: 'tom@apple.com'
      fill_in 'Password', with: 'hello123'
      click_button 'Log in'
      # save_and_open_page

      visit category_path(@category.id)
    end

    it 'Should return category name' do
      expect(page).to have_content(@category.name)
    end

    it 'Should return dealing name' do
      expect(page).to have_content(@dealing.name)
    end

    it "Should return dealing amount '23.09' " do
      expect(page).to have_content(@dealing.amount)
    end

    it "Should return Total Payment: '23.09' " do
      expect(page).to have_content 'Total Payment: $23.09'
    end

    it 'Can see a button with text "New Transaction"' do
      expect(page).to have_content 'New Transaction'
    end

    it 'Can see "New Transaction" to be redirected to form to add new transaction' do
      click_link 'New Transaction'
      expect("#{page.current_url}/dealings/new").to match new_category_dealing_path(@category.id)
    end
  end
end
