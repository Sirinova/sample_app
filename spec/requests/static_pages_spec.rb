require 'rails_helper'

# RSpec.describe "StaticPages", type: :request do
#   describe "GET /static_pages" do
#     it "works! (now write some real specs)" do
#       get static_pages_index_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end

describe "Static pages" do
  
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }

    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      expect(page).to have_title(full_title('About Us'))
      click_link "Help"
      expect(page).to have_title(full_title('Help'))
      click_link "Contact"
      expect(page).to have_title(full_title('Contact'))
      click_link "Home"
      click_link "Sign up now!"
      expect(page).to have_title(full_title('Sign up now!'))
      click_link "Sample App"
      expect(page).to have_title(full_title('Sample App'))
    end
  end

  describe "Home page" do
    before { visit root_path }
    #let(:heading) { 'Sample App' }
    #let(:page_title) { '' }

    #it_should_behave_like "all static pages" 
    #it { should_not have_title('| Home') }   

    it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end
  
  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') } 
    it { should have_title(full_title('Help')) } 
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About Us') } 
    it { should have_title(full_title('About Us')) } 
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1', text: 'Contact') } 
    it { should have_title(full_title('Contact')) }
  end
end
