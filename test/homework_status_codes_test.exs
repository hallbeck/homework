defmodule Homework.HomeworkStatusCodesTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  def goto_status_codes() do
    #First I get to the status Code page.
    navigate_to "https://the-internet.herokuapp.com"
    #click on Status_Codes
    click(find_element(:link_text, "Status Codes"))
  end
    #get the status codes we can test - I should have done this. But I was not getting responses back so Im doing this for now.
    #If I was at work I would just see how another test did it and follow that pattern

#Testing status codes
  test "goes to the-internet.herokuapp Status Code Page 200" do
    IO.puts("\nBeginning Status Code Check 200")
    goto_status_codes()
    find_element(:link_text, "200")|> click
    assert String.contains?(visible_text(find_element(:xpath, ~s|//*[@id="content"]/div/p|)),"This page returned a 200 status code.")
    IO.puts("Status Code Check 200: PASS")
  rescue
    error -> take_screenshot("./screenshotStatusCode200#{DateTime.utc_now()}.png")
      raise error
  end

  test "goes to the-internet.herokuapp Status Code Page 301" do
    IO.puts("\nBeginning Status Code Check 301")
    goto_status_codes()
    find_element(:link_text, "301")|> click
    assert String.contains?(visible_text(find_element(:xpath, ~s|//*[@id="content"]/div/p|)),"This page returned a 301 status code.")
    IO.puts("Status Code Check 301: PASS")
  rescue
    error -> take_screenshot("./screenshotStatusCode301#{DateTime.utc_now()}.png")
             raise error
  end

  test "goes to the-internet.herokuapp Status Code Page 404" do
    IO.puts("\nBeginning Status Code Check 404")
    goto_status_codes()
    find_element(:link_text, "404")|> click
    assert String.contains?(visible_text(find_element(:xpath, ~s|//*[@id="content"]/div/p|)),"This page returned a 404 status code.")
    IO.puts("Status Code Check 404: PASS")
  rescue
    error -> take_screenshot("./screenshotStatusCode404#{DateTime.utc_now()}.png")
             raise error
  end

  test "goes to the-internet.herokuapp Status Code Page 500" do
    IO.puts("\nBeginning Status Code Check 404")
    goto_status_codes()
    find_element(:link_text, "500")|> click
    assert String.contains?(visible_text(find_element(:xpath, ~s|//*[@id="content"]/div/p|)),"This page returned a 500 status code.")
    IO.puts("Status Code Check 500: PASS")
  rescue
    error -> take_screenshot("./screenshotStatusCode500#{DateTime.utc_now()}.png")
             raise error
  end
end