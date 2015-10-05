require 'rails_helper'

feature 'add a lunch', %{
  As a signed in user
  I want to add a lunch group
  So others can come and eat with me.
} do
  # Acceptance Criteria
  # [] An unauthenticated user cannot create a lunch
  # [] An authenticated user can create a new lunch
  # [] The new lunch appears on the lunch's show page

  def form_fill(lunch)
    fill_in "lunch[name]", with: lunch.name
    fill_in "date", with: lunch.date
    fill_in "time", with: lunch.time
    select lunch.price, from: "lunch[price]"
    fill_in "lunch[location]", with: lunch.location
    select lunch.category, from: "lunch[category]"
    fill_in "lunch[description]", with: lunch.description
    click_button("Add Lunch Group")
  end

  scenario 'an unauthenticated user tries to add a lunch' do
    lunch = FactoryGirl.build(:lunch)

    # add log in
    visit new_lunch_path
    form_fill(lunch)

     expect(page).to_not have_content(lunch.name)
   end

  scenario 'an authenticated user can create a new lunch' do
    lunch = FactoryGirl.build(:lunch)

    # add log in
    visit new_lunch_path
    form_fill(lunch)

    expect(page).to have_content(lunch.name)
  end

  scenario 'a new lunch is added and visible on the show page' do
    lunch = FactoryGirl.build(:lunch)

    # add log in
    visit new_lunch_path
    form_fill(lunch)
    visit lunch_path(Lunch.last)
    # add log out

    expect(page).to have_content(lunch.description)
  end
end
