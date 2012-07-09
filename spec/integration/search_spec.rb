require 'spec_helper'

describe "search page", :js => true do

  it "should have any content" do
    visit '/'

    page.has_xpath?("//*").should eq true
  end

  it "renders incoming results" do
    visit '/some_query'

    page.execute_script("window.render_results(\"test\");");
    page.has_xpath?("//div[@id='results_area']/*").should eq true
  end

end
