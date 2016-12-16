require('spec_helper')

describe('The shoe store route', {:type => :feature}) do
  it('will add a new shoe store') do
    visit('/')
    fill_in('store_name', :with => 'payless shoestore')
    click_button('Add Store')
    expect(page).to have_content('Payless Shoestore')
  end
end
