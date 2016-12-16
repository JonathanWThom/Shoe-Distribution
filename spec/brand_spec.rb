require('spec_helper')

describe(Brand) do
  it { should have_and_belong_to_many(:stores)}
  it { should validate_presence_of(:name) }
  it { should have_many(:links) }

  it('capitalizes all words in a brand name') do
    test_brand = Brand.create({:name => 'new balance'})
    expect(test_brand.name()).to(eq('New Balance'))
  end
end
