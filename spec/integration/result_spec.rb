# -*- encoding: utf-8 -*-
require 'spec_helper'

describe "translation result", :js => true do
  it "translations should be shown as links to translations in second way" do
    visit '/'
    fill_in('query-field', :with => 'kOŃ')
    click_button('search-button')
    
    sleep(7)
    page.all(:css, '.result a').size.should eq(6)
    page.find('.result a').text.should == 'horse'
  end
end
