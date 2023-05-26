require "application_system_test_case"

class SymptomsTest < ApplicationSystemTestCase
  setup do
    @symptom = symptoms(:one)
  end

  test "visiting the index" do
    visit symptoms_url
    assert_selector "h1", text: "Symptoms"
  end

  test "should create symptom" do
    visit symptoms_url
    click_on "New symptom"

    fill_in "Description", with: @symptom.description
    fill_in "Severity", with: @symptom.severity
    fill_in "Start date", with: @symptom.start_date
    fill_in "Title", with: @symptom.title
    click_on "Create Symptom"

    assert_text "Symptom was successfully created"
    click_on "Back"
  end

  test "should update Symptom" do
    visit symptom_url(@symptom)
    click_on "Edit this symptom", match: :first

    fill_in "Description", with: @symptom.description
    fill_in "Severity", with: @symptom.severity
    fill_in "Start date", with: @symptom.start_date
    fill_in "Title", with: @symptom.title
    click_on "Update Symptom"

    assert_text "Symptom was successfully updated"
    click_on "Back"
  end

  test "should destroy Symptom" do
    visit symptom_url(@symptom)
    click_on "Destroy this symptom", match: :first

    assert_text "Symptom was successfully destroyed"
  end
end
