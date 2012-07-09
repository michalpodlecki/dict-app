require 'spec_helper'

describe "ui", :js => true do

  # it "highlights incoming results" do
  #   visit '/'

  #   page.execute_script("window.render_results(\"test\");");
  # end

  it "clears the previous results when new search is issued" do
    visit '/'
    page.execute_script("window.render_results(\"test\");");
    before_search = page.find_by_id('results_area').native

    fill_in('query_field', :with => 'smok')
    click_link('search_button')
    after_search = page.find_by_id('results_area').native

    (before_search == after_search).should eq true
  end

end
