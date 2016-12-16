require('spec_helper')

describe(Link) do
  it { should belong_to(:brand) }
end
