Code.require_file("lib/common_helpers.exs")

defmodule Homework.HomeworkStatusCodesTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case
  import CommonHelpers

  # Start hound session and destroy when tests are run
  hound_session()

    #get the status codes we can test - I should have made a loop for this. I would have gotten all elements in the ul and iterated over them.
    #If I was at work I would just see how another test did it and follow that pattern

#Testing status codes
  test "Status Code Page 200" do
    IO.puts("\nBeginning Status Code Check 200")
    goto_page("Status Codes")
    find_element(:link_text, "200")|> click
    actual = visible_text(find_element(:xpath, ~s|//*[@id="content"]/div/p|))
    assert_string_contains(actual,"This page returned a 200 status code.")
    IO.puts("Status Code Check 200: PASS")
  rescue
    error -> take_screenshot("./screenshots/screenshot_StatusCode200#{DateTime.utc_now()}.png")
             raise error
  end

  test "Status Code Page 301" do
    IO.puts("\nBeginning Status Code Check 301")
    goto_page("Status Codes")
    find_element(:link_text, "301")|> click
    actual = visible_text(find_element(:xpath, ~s|//*[@id="content"]/div/p|))
    assert_string_contains(actual,"This page returned a 301 status code.")
    IO.puts("Status Code Check 301: PASS")
  rescue
    error -> take_screenshot("./screenshots/screenshot_StatusCode301#{DateTime.utc_now()}.png")
             raise error
  end

  test "Status Code Page 404" do
    IO.puts("\nBeginning Status Code Check 404")
    goto_page("Status Codes")
    find_element(:link_text, "404")|> click
    actual = visible_text(find_element(:xpath, ~s|//*[@id="content"]/div/p|))
    assert_string_contains(actual,"This page returned a 404 status code.")
    IO.puts("Status Code Check 404: PASS")
  rescue
    error -> take_screenshot("./screenshots/screenshot_StatusCode404#{DateTime.utc_now()}.png")
             raise error
  end

  test "Status Code Page 500" do
    IO.puts("\nBeginning Status Code Check 404")
    goto_page("Status Codes")
    find_element(:link_text, "500")|> click
    actual = visible_text(find_element(:xpath, ~s|//*[@id="content"]/div/p|))
    assert_string_contains(actual,"This page returned a 500 status code.")
    IO.puts("Status Code Check 500: PASS")
  rescue
    error -> take_screenshot("./screenshots/screenshot_StatusCode500#{DateTime.utc_now()}.png")
             raise error
  end
end