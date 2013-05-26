require 'spec_helper'
include SeoHelper

describe 'StaticPages' do
  # Avoid code duplication by using this line
  # Instead of writing "page.should ..." wi simply write "should .."
  subject { page }
  
  # We create a global variable
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  
  # The Home Page section has been boosted with some great code optimizations!
  describe 'Home Page' do
    before { visit root_path }
    
    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector('title', text: meta_title(base_title, '')) }
  end
  
  # The following tests use standard RSpec code... there's a lot of duplication in here!
  
  describe 'Help Page' do
    it "has the content 'Help'" do
      visit help_path
      should have_selector('h1', text: 'Help')
    end
    
    it 'has the right meta title' do
      visit help_path
      should have_selector('title', text: meta_title(base_title, 'Help'))
    end
  end
  
  describe 'About Us Page' do
    it "has the content 'About Us'" do
      visit about_us_path
      should have_selector('h1', text: 'About Us')
    end
    
    it 'has the right meta title' do
      visit about_us_path
      should have_selector('title', text: meta_title(base_title, 'About Us'))
    end
  end
  
  describe 'Contact Page' do
    
    it 'has the H1 "Contact"' do
      visit contact_path
      should have_selector('h1', text: 'Contact')
    end
    
    it 'has the right meta title' do
      visit contact_path
      should have_selector('title', text: meta_title(base_title, 'Contact'))
    end
    
  end
  
  it "has the right links on the layout" do
    visit root_path
    click_link "About"
    should have_selector 'title', text: meta_title(base_title, 'About Us')
    click_link "Help"
    should have_selector 'title', text: meta_title(base_title, 'Help')
    click_link "Contact"
    should have_selector 'title', text: meta_title(base_title, 'Contact')
    click_link "Home"
    click_link "Sign up now!"
    should have_selector 'title', text: meta_title(base_title, 'Sign up')
    click_link "sample app"
    should have_selector 'title', text: meta_title(base_title, '')
  end
  
end