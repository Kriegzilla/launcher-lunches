require 'spec_helper'
require 'rails_helper'
require 'shoulda-matchers'

describe Lunch do
  let(:lunch) { FactoryGirl.build :lunch }
  subject { lunch }

  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_presence_of :date }
  it { should validate_presence_of :time }

  it "should allow only valid categories" do
    Lunch::CATEGORIES.each do |v|
      should allow_value(v).for(:category)
    end
  end

  it "should allow only valid prices" do
    Lunch::PRICES.each do |v|
      should allow_value(v).for(:price)
    end
  end

  it "should have many associations" do
    t = Lunch.reflect_on_association(:groups)
    t.macro.should == :has_many

    t = Lunch.reflect_on_association(:users)
    t.macro.should == :has_many
  end
end
