require 'spec_helper'

describe Character do
  it 'should be able to be created' do
    c = FactoryGirl.build(:character)
    expect(c).to be_a_new(Character)
  end

  it 'should have an empty item collection when first created' do
    c = FactoryGirl.build(:character)
    expect(c.items.count).to eq(0)
  end
end
