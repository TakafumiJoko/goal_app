require "application_system_test_case"

class UploadfilesTest < ApplicationSystemTestCase
  setup do
    @uploadfile = uploadfiles(:one)
  end

  test "visiting the index" do
    visit uploadfiles_url
    assert_selector "h1", text: "Uploadfiles"
  end

  test "creating a Uploadfile" do
    visit uploadfiles_url
    click_on "New Uploadfile"

    fill_in "Data", with: @uploadfile.data
    fill_in "Name", with: @uploadfile.name
    click_on "Create Uploadfile"

    assert_text "Uploadfile was successfully created"
    click_on "Back"
  end

  test "updating a Uploadfile" do
    visit uploadfiles_url
    click_on "Edit", match: :first

    fill_in "Data", with: @uploadfile.data
    fill_in "Name", with: @uploadfile.name
    click_on "Update Uploadfile"

    assert_text "Uploadfile was successfully updated"
    click_on "Back"
  end

  test "destroying a Uploadfile" do
    visit uploadfiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Uploadfile was successfully destroyed"
  end
end
