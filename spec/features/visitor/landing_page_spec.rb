require 'spec_helper'

# Feature: Landing Page
# As a visitor
# I want to visit a home page
# So I can learn more about the website

feature 'Landing Page:' do
  # Scenario: Visit the Home Page
  # Given I am a visitor
  # When I visit the home page
  # Then I should see "Home"

  scenario 'Visit the Landing Page' do
    visit root_path
    expect(page).to have_content 'Crowdfund'
  end
end
