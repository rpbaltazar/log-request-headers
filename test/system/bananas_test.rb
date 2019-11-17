require "application_system_test_case"

class BananasTest < ApplicationSystemTestCase
  setup do
    @banana = bananas(:one)
  end

  test "visiting the index" do
    visit bananas_url
    assert_selector "h1", text: "Bananas"
  end

  test "creating a Banana" do
    visit bananas_url
    click_on "New Banana"

    click_on "Create Banana"

    assert_text "Banana was successfully created"
    click_on "Back"
  end

  test "updating a Banana" do
    visit bananas_url
    click_on "Edit", match: :first

    click_on "Update Banana"

    assert_text "Banana was successfully updated"
    click_on "Back"
  end

  test "destroying a Banana" do
    visit bananas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Banana was successfully destroyed"
  end
end
