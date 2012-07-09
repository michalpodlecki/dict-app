require 'spec_helper'

describe "ui", :js => true do

  # useful, when applying jQuery effects on rendered results
  it "doesn't override previous results' HTML when rendering new ones" do
    visit '/'

    page.execute_script("window.render_results(\"test1\");");
    old_hash = page.find(:xpath, "//div[@id='results_area']/div[1]").native.hash

    page.execute_script("window.render_results(\"test2\");");
    new_hash = page.find(:xpath, "//div[@id='results_area']/div[2]").native.hash

    new_hash.should eq old_hash
  end

  it "clears the previous results when new search is issued" do
    visit '/'
    page.execute_script("window.render_results(\"test\");");
    before_search = page.find_by_id('results_area').native

    fill_in('query_field', :with => 'smok')
    click_link('search_button')
    after_search = page.find_by_id('results_area').native

    (before_search == after_search).should eq true
  end

  it "changes the URL when user runs a new search" do
    visit '/'

    old_url = page.evaluate_script("document.URL")
    fill_in('query_field', :with => 'smok')
    click_link('search_button')

    new_url = page.evaluate_script("document.URL")

    new_url.should_not eq old_url
  end

end
