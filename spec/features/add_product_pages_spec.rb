require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Add new product'
    fill_in 'Name', :with => 'Coors Light'
    fill_in 'Cost', :with => '5.95'
    fill_in 'Country of origin', :with => 'American'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Coors Light'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end

  it "edit a new product" do
    visit products_path
    click_link 'Add new product'
    fill_in 'Name', :with => 'Blue Label'
    fill_in 'Cost', :with => '7.95'
    fill_in 'Country of origin', :with => 'Mexican'
    click_on 'Create Product'
    within('.all_product') do
      click_on 'Blue Label'
    end
    click_on 'Edit'
    fill_in 'Name', :with => 'Black Label'
    fill_in 'Cost', :with => '3.95'
    fill_in 'Country of origin', :with => 'Mexican'
    click_on 'Update Product'
    expect(page).to have_content 'Black Label'
  end

end