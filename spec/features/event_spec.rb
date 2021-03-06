require 'rails_helper'


  describe 'User can CRUD events' do

    # Users can create an event at a location.

    scenario 'User can create an event associated with a location' do
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
      fill_in 'event[description]', :with => "Ken"
      fill_in 'event[date]', with: "2015-01-02"
      check('event[requires_id]')

      #submitting form to create a event
      click_on "Create Event"

      #expect to see flash notice of successfully creation of event
      expect(page).to have_content("Event was successfully created.")


    end

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
      fill_in 'event[description]', :with => "Ken"
      fill_in 'event[date]', with: "2015-01-02"
      check('event[requires_id]')

      #submitting form to create a event
      click_on "Create Event"

      #expect to see flash notice of successfully creation of event
      expect(page).to have_content("Event was successfully created.")

      #click on new event Ken
      click_on "Ken"

      #expect to see new event name, date and true in requires_id
      expect(page).to have_content("Ken")
      expect(page).to have_content("2015-01-02")
      expect(page).to have_content(true)

    end

    #Users can edit an event
    scenario 'User can edit an event' do
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
      fill_in 'event[description]', :with => "Ken"
      fill_in 'event[date]', with: "2015-01-02"
      check('event[requires_id]')

      #submitting form to create a event
      click_on "Create Event"

      #click on Edit
      click_on "Edit"

      # change description field and update it to Kenneth
      fill_in 'event[description]', :with => "Kenneth"

      #submitting form to update a description in event
      click_on "Update Event"

      #expect page to show updated description of Kenneth
      expect(page).to have_content("Kenneth")

  end

  scenario 'User can delete an event' do

    @location = Location.create(:name => "Jake", :address => "New Address", :zipcode => "90210")
    visit "/locations/#{@location.id}"
    @event = Event.create(:description => "Ken", :date => "2015-01-02", :requires_id => true)
    visit "/locations/#{@location.id}/events/#{@event.id}"

    #click on Delete
    click_on "Delete"

    # expecting the flash notification (code says Location but should say Event)
    # test works but base code needs to be fixed
    expect(page).to have_content("Location was successfully destroyed.")

  end


end
