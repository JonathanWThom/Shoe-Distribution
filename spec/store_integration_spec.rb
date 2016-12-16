require('spec_helper')

describe('The shoe store route', {:type => :feature}) do
  it('will add a new shoe store') do
    visit('/')
    fill_in('store_name', :with => 'payless shoestore')
    click_button('Add Store')
    expect(page).to have_content('Payless Shoestore')
  end

  it('will not allow a user to enter a blank store name') do
    visit('/')
    fill_in('store_name', :with => '')
    click_button('Add Store')
    expect(page).to have_content('Name can\'t be blank')
  end

  it('will update a shoe store\'s name') do
    store = Store.create(:name => 'outlet mall')
    visit("/stores/#{store.id()}")
    fill_in('new_name', :with => 'costco')
    click_button('Change Name')
    expect(page).to have_content('Costco')
  end

  it('will add a brand to a shoe store') do
    store = Store.create(:name => 'outlet mall')
    brand = Brand.create(:name => 'nike')
    visit("/stores/#{store.id()}")
    check('Nike')
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end

  it('will delete a store') do
    store = Store.create(:name => 'outlet mall')
    visit("/stores/#{store.id()}")
    click_button('Delete Store')
    expect(page).to_not have_content('Outlet Mall')
  end
end
