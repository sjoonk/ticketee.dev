require 'test_helper'

class TicketsTest < ActionDispatch::IntegrationTest
  # fixtures :all

   before do
      @project = FactoryGirl.create(:project, :name => "TextMate2")
      @ticket = FactoryGirl.create(
        :ticket,
        :title => "Make it shiny!",
        :description => "Gradients! Starbursts! Oh my!",
        :project => @project
      )
      # @user = FactoryGirl.create(:user)
   end

   after do
     User.destroy_all
   end

  feature "Creating Tickets" do

   scenario "create a ticket" do
      visit root_path
      click_link "TextMate2"
      click_on "New Ticket"
      sign_in_as_a_user
      page.must_have_content "New Ticket"
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

    scenario "viewing tickets for a given project" do
      visit root_path
      click_on "TextMate2"
      page.must_have_content "Make it shiny!"
      click_on "Make it shiny!"
      page.must_have_content "Gradients! Starbursts! Oh my!"
    end

  end
  
  feature "Editing tickets" do

    # In order to alter ticket information
    # As a user
    # I want a form to edit the tickets

    scenario "Updating a ticket"

    scenario "Updating a ticket with invalid information" do
      visit project_path(@project)
      click_on "Make it shiny!"
      click_on "Edit Ticket"
      sign_in_as_a_user
      fill_in "Title", :with => ""
      click_on "Update Ticket"
      page.must_have_content "Ticket has not been updated."
    end

  end

  feature "Deleting ticket" do

    # In order to remove tickets
    # As a user
    # I want to press a button and make them disapper

    scenario "deleting a ticket" do
      visit project_ticket_path(@project, @ticket)
      click_on "Delete Ticket"
      sign_in_as_a_user
      visit project_ticket_path(@project, @ticket)
      click_on "Delete Ticket"
      page.must_have_content "Ticket has been deleted."
    end

  end


end
