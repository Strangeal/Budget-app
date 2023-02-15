require 'rails_helper'

RSpec.describe 'Category index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @first_user = User.create(name: 'Tom', email: 'tom@apple.com', password: 'hello123')
      @first_category = Category.create(name: 'Food', icon: 'https://cdn-icons-png.flaticon.com/512/4835/4835459.png',
                                        author: @first_user)
      visit user_session_path
      fill_in 'Email', with: 'tom@apple.com'
      fill_in 'Password', with: 'hello123'
      click_button 'Log in'
      # save_and_open_page
      visit root_path
    end

    it 'Can see the header name "Categories" ' do
      expect(page).to have_content 'Categories'
    end

    it 'Can see a button with text "New Category"' do
      expect(page).to have_content 'New Category'
    end

    it 'Can see text "New Category" click to be redirected to form page' do
      click_link 'New Category'
      expect("#{page.current_url}categories/new").to match new_category_path
    end

    it 'Can see category name to be redirected to category deatils page' do
      click_link @first_category.name.to_s
      expect("#{page.current_url}categories/#{@first_category.id}").to match category_path(@first_category.id)
    end
  end
end
