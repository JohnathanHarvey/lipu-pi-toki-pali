require "application_system_test_case"

class ConlangsTest < ApplicationSystemTestCase
  setup do
    @conlang = conlangs(:one)
  end

  test "visiting the index" do
    visit conlangs_url
    assert_selector "h1", text: "Conlangs"
  end

  test "should create conlang" do
    visit conlangs_url
    click_on "New conlang"

    click_on "Create Conlang"

    assert_text "Conlang was successfully created"
    click_on "Back"
  end

  test "should update Conlang" do
    visit conlang_url(@conlang)
    click_on "Edit this conlang", match: :first

    click_on "Update Conlang"

    assert_text "Conlang was successfully updated"
    click_on "Back"
  end

  test "should destroy Conlang" do
    visit conlang_url(@conlang)
    click_on "Destroy this conlang", match: :first

    assert_text "Conlang was successfully destroyed"
  end
end
