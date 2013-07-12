require 'test_helper'

class TicketsTest < ActionDispatch::IntegrationTest
  # fixtures :all

  feature "Creating Tickets" do

    before do
      @project ||= FactoryGirl.create(:project, :name => "Internet Explorer")
    end

    scenario "create a ticket" do
      visit root_path
      click_on "Internet Explorer"
      click_on "New Ticket"
      fill_in "Title", :with => "Non-standards compliance"
      fill_in "Description", :with => "My pages are ugly!"
      click_on "Create Ticket"
      page.must_have_content "Ticket has been created"
    end

    scenario "creating a ticket without valid attributes fails"

  end
end
