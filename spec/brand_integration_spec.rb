require('spec_helper')

describe('The brand route', {:type => :feature}) do
  it('will add a new brand') do
    visit('/')
    fill_in('brand_name', :with => 'nike')
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end
end
