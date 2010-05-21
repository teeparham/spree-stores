require File.dirname(__FILE__) + '/../spec_helper'

describe StoreEvent do
  before(:each) do
    @store_event = StoreEvent.new
  end

  it "should be valid" do
    @store_event.should be_valid
  end
end
