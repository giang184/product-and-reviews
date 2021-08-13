require 'rails_helper'

describe "Integration Test: " do

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

  it "Add a new product" do
    User.create(:email => "admin@a.com", :password => "a", admin: true)
    visit signin_path
    fill_in 'Email', :with => 'admin@a.com'
    fill_in 'Password', :with => 'a'
    click_on 'Sign in!'
    visit products_path
    click_on 'Add a new product'
    fill_in 'Name', :with => 'Blue Label'
    fill_in 'Cost', :with => '7.95'
    fill_in 'Country of origin', :with => 'Mexican'
    click_on 'Create Product'
    expect(page).to have_content 'Blue Label'
  end

  it "Edit a new product" do
    User.create(:email => "admin@a.com", :password => "a", admin: true)
    visit signin_path
    fill_in 'Email', :with => 'admin@a.com'
    fill_in 'Password', :with => 'a'
    click_on 'Sign in!'
    visit products_path
    click_on 'Add a new product'
    fill_in 'Name', :with => 'Black Label'
    fill_in 'Cost', :with => '7.95'
    fill_in 'Country of origin', :with => 'Mexican'
    click_on 'Create Product'
    click_on 'Edit product'
    fill_in 'Name', :with => 'Red Label'
    fill_in 'Cost', :with => '4.95'
    fill_in 'Country of origin', :with => 'Mexican'
    click_on 'Update Product'
    expect(page).to have_content 'Red Label'
  end
  
  it "should allow user to add review" do
    User.create(:email => "admin@a.com", :password => "a", admin: true)
    User.create(:email => "bab@a.com", :password => "a", admin: false)
    visit signin_path
    fill_in 'Email', :with => 'admin@a.com'
    fill_in 'Password', :with => 'a'
    click_on 'Sign in!'
    visit products_path
    click_on 'Add a new product'
    fill_in 'Name', :with => 'Blue Label'
    fill_in 'Cost', :with => '7.95'
    fill_in 'Country of origin', :with => 'Mexican'
    click_on 'Create Product'
    click_on 'Sign out'
    visit signin_path
    fill_in 'Email', :with => 'bab@a.com'
    fill_in 'Password', :with => 'a'
    click_on 'Sign in!'
    visit products_path
    click_on 'Blue Label'
    click_on 'Add a review'
    expect(page).to have_content 'New Review'
  end

  it "should not allow none user to add review" do
    User.create(:email => "admin@a.com", :password => "a", admin: true)
    visit signin_path
    fill_in 'Email', :with => 'admin@a.com'
    fill_in 'Password', :with => 'a'
    click_on 'Sign in!'
    visit products_path
    click_on 'Add a new product'
    fill_in 'Name', :with => 'Blue Label'
    fill_in 'Cost', :with => '7.95'
    fill_in 'Country of origin', :with => 'Mexican'
    click_on 'Create Product'
    click_on 'Sign out'
    visit products_path
    click_on 'Blue Label'
    click_on 'Add a review'
    expect(page).to have_content 'Password'
  end
end