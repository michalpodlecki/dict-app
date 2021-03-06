# -*- encoding: utf-8 -*-
require 'spec_helper'

describe "search page", :js => true do

  before(:each) do
    Dict.stub(:get_single_dictionary_translations).and_return({})
  end

  it "should have any content" do
    visit '/'

    page.has_xpath?("//*").should eq true
  end

  it "renders incoming results" do
    visit '/?q=some_query'

    page.execute_script("window.render_results(\"test\");");
    page.has_xpath?("//div[@id='results-area']/*").should eq true
  end

  it "should take to the home page" do
    visit '/'
    old_url = page.evaluate_script("document.URL")
    visit '/?q=smok'
    click_button('search-button')
    after_search = click_link('home-link')
    new_url = page.evaluate_script("document.URL")
    (old_url == new_url).should eq true
  end

  it "any search is in progress" do
    visit '/?q=smok'
    page.find_by_id("progress-display").has_css?(".hidden").should eq false
  end

  it "search field should be focused" do
    visit "/"
    page.evaluate_script("document.activeElement.getAttribute('id')").should eq("query-field")
  end

  it "displays notification when query failed due to some exception" do
    Dict.stub(:get_single_dictionary_translations).and_throw('some major error')
    visit '/dictionaries/wrong_dictionary?q=smok'
    click_button('search-button')

    page.has_css?(".noty_message").should eq true
    page.should have_content('Nie można uzyskać tłumaczeń z wrong_dictionary')
  end
end
