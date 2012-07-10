require 'spec_helper'

describe "search page", :js => true do

  before(:each) do
    Dict.stub(:get_single_dictionary_translations).and_return({});
  end

  it "should have any content" do
    visit '/'

    page.has_xpath?("//*").should eq true
  end

  it "renders incoming results" do
    visit '/some_query'

    page.execute_script("window.render_results(\"test\");");
    page.has_xpath?("//div[@id='results_area']/*").should eq true
  end

  it "should take to the home page" do
    visit '/'
    old_url = page.evaluate_script("document.URL")
    visit '/smok'
    click_link('search_button')
    after_search = click_link('home_link')
    new_url = page.evaluate_script("document.URL")
    (old_url == new_url).should eq true
  end

  it "any search is in progress" do
    visit '/smok'
    page.find_by_id("progress_display").has_css?(".hidden").should eq false
  end
  
  it "search field should be focused" do
    visit "/"
    page.evaluate_script("document.activeElement.getAttribute('id')").should eq("query_field")
  end
end
