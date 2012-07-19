require 'spec_helper'

describe "static pages", :js => true do
  before(:each) do
    Dict.stub(:get_single_dictionary_translations).and_return({})
  end

  it "should redirect to search page, when one desires to perform a search" do
    visit '/static/about'
    fill_in('query-field', :with => 'smok')
    click_button('search-button')

    new_url = page.evaluate_script("document.URL")
    (/static\/.*\?q=smok$/ =~ new_url).should eq nil
  end
end
