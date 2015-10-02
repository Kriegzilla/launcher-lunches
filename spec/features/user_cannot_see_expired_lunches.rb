require 'rails_helper'

feature 'expire lunches', %{
  As a eater of lunches
  I want to see only upcoming lunches
  So I can plan my next meal.
} do
  # Acceptance Criteria
  # [] Lunches index page displays lunches
  # [] Lunches index page does not display lunches that have past
  # [] Lunches index page displays lunches ordered by most recent
  scenario 'user looks for lunches on the lunches index page' do
    lunch = FactoryGirl.create(:lunch)

    visit lunches_path
    expect(page).to have_content(lunch.name)
  end

  scenario 'user only sees current lunches on index page'
    lunch1 = FactoryGirl.create(:lunch)
    lunch2 = FactoryGirl.create(:lunch)
    lunch2.date - 10

    visit lunches_path
    expect(page).to have_content(lunch1.name)
    expect(page).to_not have_content(lunch2.name)
  end
end
