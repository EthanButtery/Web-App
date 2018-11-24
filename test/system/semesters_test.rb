require "application_system_test_case"

class SemestersTest < ApplicationSystemTestCase
  setup do
    @semester = semesters(:one)
  end

  test "visiting the index" do
    visit semesters_url
    assert_selector "h1", text: "Semesters"
  end

  test "creating a Semester" do
    visit semesters_url
    click_on "New Semester"

    fill_in "Season", with: @semester.season
    fill_in "Total Credits", with: @semester.total_credits
    fill_in "User", with: @semester.user_id
    fill_in "Year", with: @semester.year
    click_on "Create Semester"

    assert_text "Semester was successfully created"
    click_on "Back"
  end

  test "updating a Semester" do
    visit semesters_url
    click_on "Edit", match: :first

    fill_in "Season", with: @semester.season
    fill_in "Total Credits", with: @semester.total_credits
    fill_in "User", with: @semester.user_id
    fill_in "Year", with: @semester.year
    click_on "Update Semester"

    assert_text "Semester was successfully updated"
    click_on "Back"
  end

  test "destroying a Semester" do
    visit semesters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Semester was successfully destroyed"
  end
end
