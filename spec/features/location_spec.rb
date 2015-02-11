require 'rails_helper'


describe 'User can CRUD locations' do

  scenario 'User can create a Location' do
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


    #now we expect the index page to have the name of the location we created.
    expect(page).to have_content("Jake")
    # expecting the flash notification
    expect(page).to have_content("Location was successfully created")
  end

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

    # click on link to existing location
    click_on "Jake"

    #now we expect the index page to have the name, address and zipcode of the location we created.
    expect(page).to have_content("Jake")
    expect(page).to have_content("New Address")
    expect(page).to have_content("90210")

  end

  scenario 'User can edit a location' do
    # visit homepage
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Jake"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"

    # click on link to existing location
    click_on "Edit"

    # change  zip code field and update it 5000

    fill_in 'location[zipcode]', with: "5000"

    #submitting form to update a zipcode in location
    click_on "Update Location"

    #expect page to show updated zipcode 5000
    expect(page).to have_content("5000")

  end


  scenario 'User can delete a location' do
    #fill in
  end






end
