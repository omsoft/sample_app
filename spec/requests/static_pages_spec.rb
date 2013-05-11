require 'spec_helper'

describe 'StaticPages' do
  
  describe 'Home Page' do
    it "has the H1 content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
    
    it 'has the right meta title' do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Home")
    end
  end
  
  describe 'Help Page' do
    it "has the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end
    
    it 'has the right meta title' do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Help")
    end
  end
  
  describe 'AboutUs Page' do
    it "has the content 'About Us'" do
      visit '/static_pages/about_us'
      page.should have_selector('h1', :text => 'About Us')
    end
    
    it 'has the right meta title' do
      visit '/static_pages/about_us'
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end
  
end