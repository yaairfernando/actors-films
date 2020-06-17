require "application_system_test_case"

class SavedMessagesTest < ApplicationSystemTestCase
  setup do
    @saved_message = saved_messages(:one)
  end

  test "visiting the index" do
    visit saved_messages_url
    assert_selector "h1", text: "Saved Messages"
  end

  test "creating a Saved message" do
    visit saved_messages_url
    click_on "New Saved Message"

    fill_in "Body", with: @saved_message.body
    fill_in "Title", with: @saved_message.title
    click_on "Create Saved message"

    assert_text "Saved message was successfully created"
    click_on "Back"
  end

  test "updating a Saved message" do
    visit saved_messages_url
    click_on "Edit", match: :first

    fill_in "Body", with: @saved_message.body
    fill_in "Title", with: @saved_message.title
    click_on "Update Saved message"

    assert_text "Saved message was successfully updated"
    click_on "Back"
  end

  test "destroying a Saved message" do
    visit saved_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saved message was successfully destroyed"
  end
end
