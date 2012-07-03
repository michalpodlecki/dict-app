require 'spec_helper'

describe "home page", :js => true do

  it "should have content" do
    visit '/'
    page.should have_content('Dict')
  end

end