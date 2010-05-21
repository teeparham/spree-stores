require File.dirname(__FILE__) + '/../spec_helper'

describe StorePerson do
  before(:each) do
    @store_person = StorePerson.new
  end

  it "should be valid" do
    @store_person.should be_valid
  end
end
