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


  feature "Viewing tickets" do
    
    # In order to view the tickets for a project
    # As a user
    # I want to see them on that project's page

    before do
      @proj1 = FactoryGirl.create(:project, :name => "TextMate2")
      @t1 = FactoryGirl.create(
        :ticket,
        :title => "Make it shiny!",
        :description => "Gradients! Starbursts! Oh my!",
        :project => @proj1
      )
    end

    scenario "viewing tickets for a given project" do
      visit root_path
      click_on "TextMate2"
      page.must_have_content "Make it shiny!"
      click_on "Make it shiny!"
      page.must_have_content "Gradients! Starbursts! Oh my!"
    end

  end

end
