require 'rails_helper'

describe "the add a product process" do
  it "should not add product" do
    visit products_path
    expect(page).not_to have_content 'Add new product'
  end

  it "signs up a new user" do
    visit signup_path
    fill_in 'user[email]', :with => 'a@a.com'
    fill_in 'user[password]', :with => 'a'
    fill_in 'Password confirmation', :with => 'a'
    click_on 'Sign Up'
    expect(page).to have_content "You've successfully signed up!"
  end

  it "will not add a new user without password confirmation" do
    visit signup_path
    fill_in 'user[email]', :with => 'jazz@jazz.com'
    fill_in 'user[password]', :with => 'jazz'
    click_on 'Sign Up'
    expect(page).to have_content 'There was a problem signing up'
  end

  it "signs in correctly" do
    User.create(:email => "a@a.com", :password => "a", admin: false)
    visit signin_path
    fill_in 'Email', :with => 'a@a.com'
    fill_in 'Password', :with => 'a'
    click_on 'Sign in!'
    expect(page).to have_content 'a@a.com'
  end

  # it "edit a new product" do
  #   visit products_path
  #   click_link 'Add new product'
  #   fill_in 'Name', :with => 'Blue Label'
  #   fill_in 'Cost', :with => '7.95'
  #   fill_in 'Country of origin', :with => 'Mexican'
  #   click_on 'Create Product'
  #   # within('.all_product') do
  #   #   click_on 'Blue Label'
  #   # end
  #   click_on 'Edit'
  #   fill_in 'Name', :with => 'Black Label'
  #   fill_in 'Cost', :with => '3.95'
  #   fill_in 'Country of origin', :with => 'Mexican'
  #   click_on 'Update Product'
  #   expect(page).to have_content 'Black Label'
  # end

end