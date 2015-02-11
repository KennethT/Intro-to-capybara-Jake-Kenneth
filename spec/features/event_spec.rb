require 'rails_helper'

describe 'User can CRUD locations' do

  describe 'User can CRUD events' do


    #create location for events to appear in
    scenario 'User can view a show page for a location' do
      # visit root aka homepage
      visit '/'

      # click on link to go to new location form
      click_on "New Location"

      #filling out form for location
      fill_in 'location[name]', :with => "Jake"
      fill_in 'location[address]', with: "New Address"
      fill_in 'location[zipcode]', with: "90210"

      #submitting form to create a location
      click_on "Create Location"

      # click on link to add event after it was created
      click_on "Add Event"

      #filling out form for event
      fill_in 'event[name]', :with => "Ken"
      fill_in 'event[date]', with: "01/02/2015"
      fill_in 'event[requires_id]', with: true

      #submitting form to create a event
      click_on "Create Event"

      #expect to see flash notice of successfully creation of event
      expect(page).to have_content("Event was successfully created.")

      #click on new even Ken
      click_on "Ken"

      #expect to see new event name, date and true in requires_id
      expect(page).to have_content("Ken")
      expect(page).to have_content("01/02/2015")
      expect(page).to have_content(true)



    end


  end

end
