require "application_system_test_case"

class SpiffyTasksTest < ApplicationSystemTestCase
  setup do
    @spiffy_task = spiffy_tasks(:one)
  end

  test "visiting the index" do
    visit spiffy_tasks_url
    assert_selector "h1", text: "Spiffy Tasks"
  end

  test "creating a Spiffy task" do
    visit spiffy_tasks_url
    click_on "New Spiffy Task"

    check "Active" if @spiffy_task.active
    fill_in "Description", with: @spiffy_task.description
    fill_in "Name", with: @spiffy_task.name
    fill_in "Value", with: @spiffy_task.value
    click_on "Create Spiffy task"

    assert_text "Spiffy task was successfully created"
    click_on "Back"
  end

  test "updating a Spiffy task" do
    visit spiffy_tasks_url
    click_on "Edit", match: :first

    check "Active" if @spiffy_task.active
    fill_in "Description", with: @spiffy_task.description
    fill_in "Name", with: @spiffy_task.name
    fill_in "Value", with: @spiffy_task.value
    click_on "Update Spiffy task"

    assert_text "Spiffy task was successfully updated"
    click_on "Back"
  end

  test "destroying a Spiffy task" do
    visit spiffy_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spiffy task was successfully destroyed"
  end
end
