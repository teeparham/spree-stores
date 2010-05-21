require File.dirname(__FILE__) + '/../../spec_helper'

describe "/store_people/show" do
  before do
    render 'store_people/show'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', 'Find me in app/views/store_people/show.rhtml')
  end
end
