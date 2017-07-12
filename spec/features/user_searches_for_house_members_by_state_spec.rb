require 'rails_helper'

feature "User can view house members by state" do
  scenario "it is a valid search" do
    # As a user
    # When I visit "/"
    visit "/"
    # And I select "Colorado" from the dropdown
    select("Colorado", :from => "state").select_option
    # And I click on "Locate Members from the House"
    click_on "Locate Members from the House"
    # Then my path should be "/search" with "state=CO" in the parameters
    expect(current_path).to eq("/search?state=CO")
    # And I should see a message "7 Results"
    expect(page).to have_selector(".members", count: 7)
    # And I should see a list of 7 the members of the house for Colorado
    # And they should be ordered by seniority from most to least
    # And I should see a name, role, party, and district for each member```
    within first(".member") do
      expect(page).to have_selector(".member_name")
      expect(page).to have_selector(".member_role")
      expect(page).to have_selector(".member_party")
      expect(page).to have_selector(".member_district")
    end
  end
end
