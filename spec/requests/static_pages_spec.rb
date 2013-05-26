require 'spec_helper'

describe 'StaticPages' do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  
  describe 'Home Page' do
    it "has the H1 content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
    
    it 'has the right meta title' do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "#{base_title} | Home")
    end
  end
  
  describe 'Help Page' do
    it "has the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end
    
    it 'has the right meta title' do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end
  
  describe 'About Us Page' do
    it "has the content 'About Us'" do
      visit '/static_pages/about_us'
      page.should have_selector('h1', :text => 'About Us')
    end
    
    it 'has the right meta title' do
      visit '/static_pages/about_us'
      page.should have_selector('title', :text => "#{base_title} | About Us")
    end
  end
  
end