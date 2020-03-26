require "application_system_test_case"

class HabitsTest < ApplicationSystemTestCase
  setup do
    @habit = habits(:one)
  end

  test "visiting the index" do
    visit habits_url
    assert_selector "h1", text: "Habits"
  end

  test "creating a Habit" do
    visit habits_url
    click_on "New Habit"

    fill_in "Color", with: @habit.color
    fill_in "Date", with: @habit.date
    fill_in "Length", with: @habit.length
    fill_in "Name", with: @habit.name
    fill_in "Real", with: @habit.real
    fill_in "Target", with: @habit.target
    click_on "Create Habit"

    assert_text "Habit was successfully created"
    click_on "Back"
  end

  test "updating a Habit" do
    visit habits_url
    click_on "Edit", match: :first

    fill_in "Color", with: @habit.color
    fill_in "Date", with: @habit.date
    fill_in "Length", with: @habit.length
    fill_in "Name", with: @habit.name
    fill_in "Real", with: @habit.real
    fill_in "Target", with: @habit.target
    click_on "Update Habit"

    assert_text "Habit was successfully updated"
    click_on "Back"
  end

  test "destroying a Habit" do
    visit habits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Habit was successfully destroyed"
  end
end
