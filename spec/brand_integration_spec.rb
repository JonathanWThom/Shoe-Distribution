require('spec_helper')

describe('The brand route', {:type => :feature}) do
  it('will add a new brand') do
    visit('/')
    fill_in('brand_name', :with => 'nike')
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end

  it('will not allow users to enter a blank brand name') do
    visit('/')
    fill_in('brand_name', :with => '')
    click_button('Add Brand')
    expect(page).to have_content('Name can\'t be blank')
  end

  it('will update the brand\'s name') do
    brand = Brand.create(:name => 'nike')
    visit("/brands/#{brand.id()}")
    fill_in('brand_name', :with => 'adidas')
    click_button('Rebrand')
    expect(page).to have_content('Adidas')
  end

  it('will add a store that the brand can be found in') do
    brand = Brand.create(:name => 'nike')
    store = Store.create(:name => 'outlet mall')
    visit("/brands/#{brand.id()}")
    check('Outlet Mall')
    expect(page).to have_content('Outlet Mall')
  end

  it('will delete a store') do
    brand = Brand.create(:name => 'nike')
    visit("/brands/#{brand.id()}")
    click_button('Delete')
    expect(page).to_not have_content('Nike')
  end
end
