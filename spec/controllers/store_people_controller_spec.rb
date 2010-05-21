require File.dirname(__FILE__) + '/../spec_helper'

describe StorePeopleController do

  #Delete these examples and add some real ones
  it "should use StorePeopleController" do
    controller.should be_an_instance_of(StorePeopleController)
  end


  it "GET 'show' should be successful" do
    get 'show'
    response.should be_success
  end
end
