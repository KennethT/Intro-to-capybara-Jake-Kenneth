The goal of this exercise is to practice testing a Rails Application using RSPEC and Capybara.

Example specs have been setup for Home Page and creating a Location.

Bundle
rake db:create db:migrate


All Specs live in spec/features

Each spec file is named in a way to identify what it is testing.
home page specs live in a file named spec/features/home_page_spec.rb




spec files need to require the following file:
  require 'rails_helper'

Run all specs with command rspec.

Run specific tests with command rspec spec/directory/file_name.rb
  example: spec/features/home_page_spec.rb


Capybara cheat sheet: https://gist.github.com/zhengjia/428105


## Test all of these things for Events and Locations.

- Example tests for visiting home page and creating a location.


###### Home page
- Users can visit homepage and see Locations



###### Locations
- Users can create a location.
- Users can see a show page for location.
- Users can edit a location.
- Users can delete a location.


###### Events
- Users can create an event at an event.
- Users can see a show page for an event.
- Users can edit an event.
- Users can delete an event.
