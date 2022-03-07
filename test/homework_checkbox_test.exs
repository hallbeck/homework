Code.require_file("lib/common_helpers.exs")

defmodule Homework.HomeworkCheckboxTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case
  import CommonHelpers

  # Start hound session and destroy when tests are run
  hound_session()

#Testing checkboxes
  test "Selecting checkbox 1" do
    #First I get to the checkboxes page.
    goto_page("Checkboxes")
    # click the first checkbox
    element = find_element(:css, "#checkboxes > input[type=checkbox]:nth-child(1)")
    IO.puts("\nBeginning check the checkbox #1")
    if selected?(element) do
      assert selected?(element)
      click(element)
      refute selected?(element)
      click(element)
      assert selected?(element)
    else
      click(element)
      assert selected?(element)
    end
    IO.puts("Checkbox #1 Checking and unchecking: PASS")
  rescue
    error -> take_screenshot("./screenshots/screenshot_checkbox1#{DateTime.utc_now()}.png")
             raise error
  end

  test "Selecting checkbox 2" do
    #First I get to the checkboxes page.
    goto_page("Checkboxes")
    #click the second checkbox
    element = find_element(:css, "#checkboxes > input[type=checkbox]:nth-child(3)")
    IO.puts("\nBeginning check the checkbox #2")
    if selected?(element) do
      assert selected?(element)
      click(element)
      refute selected?(element)
      click(element)
      assert selected?(element)
    else
      click(element)
      assert selected?(element)
    end
    IO.puts("Checkbox #2 Checking and unchecking: PASS")
  rescue
    error -> take_screenshot("./screenshots/screenshot_checkbox2#{DateTime.utc_now()}.png")
             raise error
  end
end