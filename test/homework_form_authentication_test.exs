defmodule Homework.HomeworkFormAuthenticationTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()
  def goto_form_authentication() do
    #First I get to the status Code page.
    navigate_to "https://the-internet.herokuapp.com"
    #click on Form Authentication
    click(find_element(:link_text, "Form Authentication"))
  end

  @username :tomsmith
  @password :"SuperSecretPassword!"
  @badusername :lalalah
  @badpassword :"lolipop"

#Testing Form Authentication
  test "Form Authentication happy path" do
    IO.puts("\nBeginning Form Authentication - Login valid")
    goto_form_authentication()
    fill_field(find_element(:id, "username"), @username)
    fill_field(find_element(:id, "password"), @password)
    submit_element(find_element(:id, "login"))
    assert String.contains?(visible_text(find_element(:id, "flash")), "You logged into a secure area!")
    IO.puts("Form Authentication - Login valid: PASS")
    find_element(:link_text, "Logout")|> click
    assert String.contains?(visible_text(find_element(:id, "flash")), "You logged out of the secure area!")
    IO.puts("Form Authentication - Logout: PASS")
  rescue
    error -> take_screenshot("./screenshotFormAuthenticationValid#{DateTime.utc_now()}.png")
             raise error
  end

  test "Form Authentication invalid username" do
    IO.puts("\nBeginning Form Authentication  - Login failed bad username")
    goto_form_authentication()
    fill_field(find_element(:id, "username"), @badusername)
    fill_field(find_element(:id, "password"), @password)
    submit_element(find_element(:id, "login"))
    assert String.contains?(visible_text(find_element(:id, "flash")), "Your username is invalid!")
    IO.puts("Form Authentication - Login failed bad username: PASS")
  rescue
    error -> take_screenshot("./screenshotFormAuthenticationValid#{DateTime.utc_now()}.png")
             raise error
  end

  test "Form Authentication invalid password" do
    IO.puts("\nBeginning Form Authentication - Login failed bad password")
    goto_form_authentication()
    fill_field(find_element(:id, "username"), @username)
    fill_field(find_element(:id, "password"), @badpassword)
    submit_element(find_element(:id, "login"))
    assert String.contains?(visible_text(find_element(:id, "flash")), "Your password is invalid!")
    IO.puts("Form Authentication - Login failed bad password: PASS")
  rescue
    error -> take_screenshot("./screenshotFormAuthenticationValid#{DateTime.utc_now()}.png")
             raise error
  end

test "Form Authentication empty username" do
  IO.puts("\nBeginning Form Authentication - Login failed empty username")
  goto_form_authentication()
  fill_field(find_element(:id, "username"), "")
  fill_field(find_element(:id, "password"), @badpassword)
  submit_element(find_element(:id, "login"))
  assert String.contains?(visible_text(find_element(:id, "flash")), "Your username is invalid!")
  IO.puts("Form Authentication - Login failed empty username: PASS")
rescue
  error -> take_screenshot("./screenshotFormAuthenticationValid#{DateTime.utc_now()}.png")
           raise error
end

test "Form Authentication empty password" do
  IO.puts("\nBeginning Form Authentication - Login failed empty password")
  goto_form_authentication()
  fill_field(find_element(:id, "username"), @username)
  fill_field(find_element(:id, "password"), "")
  submit_element(find_element(:id, "login"))
  assert String.contains?(visible_text(find_element(:id, "flash")), "Your password is invalid!")
  IO.puts("Form Authentication - Login failed empty password: PASS")
rescue
  error -> take_screenshot("./screenshotFormAuthenticationValid#{DateTime.utc_now()}.png")
           raise error
end

end