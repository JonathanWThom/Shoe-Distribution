require('spec_helper')

describe(Store) do
  it { should have_and_belong_to_many(:brands)}

  it('capitalizes all words in a store name') do
    test_store = Store.create({:name => 'famous footwear'})
    expect(test_store.name()).to(eq('Famous Footwear'))
  end
end
