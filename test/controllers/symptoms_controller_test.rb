require "test_helper"

class SymptomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @symptom = symptoms(:one)
  end

  test "should get index" do
    get symptoms_url
    assert_response :success
  end

  test "should get new" do
    get new_symptom_url
    assert_response :success
  end

  test "should create symptom" do
    assert_difference("Symptom.count") do
      post symptoms_url, params: { symptom: { description: @symptom.description, severity: @symptom.severity, start_date: @symptom.start_date, title: @symptom.title } }
    end

    assert_redirected_to symptom_url(Symptom.last)
  end

  test "should show symptom" do
    get symptom_url(@symptom)
    assert_response :success
  end

  test "should get edit" do
    get edit_symptom_url(@symptom)
    assert_response :success
  end

  test "should update symptom" do
    patch symptom_url(@symptom), params: { symptom: { description: @symptom.description, severity: @symptom.severity, start_date: @symptom.start_date, title: @symptom.title } }
    assert_redirected_to symptom_url(@symptom)
  end

  test "should destroy symptom" do
    assert_difference("Symptom.count", -1) do
      delete symptom_url(@symptom)
    end

    assert_redirected_to symptoms_url
  end
end
