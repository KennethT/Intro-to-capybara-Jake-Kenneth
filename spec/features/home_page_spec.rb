require 'rails_helper'


describe 'User can visit homepage' do

  scenario 'User visits root of application' do

    visit '/'

    expect(page).to have_content("Locations")

  end

end
#confirm homepage test
