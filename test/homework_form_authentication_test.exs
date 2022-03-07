Code.require_file("lib/common_helpers.exs")

defmodule Homework.HomeworkFormAuthenticationTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case
  import CommonHelpers

  # Start hound session and destroy when tests are run
  hound_session()

  def fill_username_field(user) do
    fill_field(find_element(:id, "username"), user)
  end

  def fill_password_field(pass) do
    fill_field(find_element(:id, "password"), pass)
  end

  def press_login() do
    submit_element(find_element(:id, "login"))
  end

  @username :tomsmith
  @password :SuperSecretPassword!

  #Testing Form Authentication
  test "Form Authentication happy path" do
    IO.puts("\nBeginning Form Authentication - Login valid")
    goto_page("Form Authentication")
    fill_username_field(@username)
    fill_password_field(@password)
    press_login()
    actual = visible_text(find_element(:id, "flash"))
    assert_string_contains(actual,"You logged into a secure area!")
    #here i would check if the secure cookie was set cookies(). the page doesn't set cookies so I cant check it.
    IO.puts("Form Authentication - Login valid: PASS")
    find_element(:link_text, "Logout")|> click
    actual = visible_text(find_element(:id, "flash"))
    assert_string_contains(actual,"You logged out of the secure area!")
    #here i would check if the secure cookie was NOT set. the page doesn't set cookies so I cant check it.
    IO.puts("Form Authentication - Logout: PASS")
  rescue
    error -> take_screenshot("./screenshots/screenshot_form_authentication_happy_path#{DateTime.utc_now()}.png")
             raise error
  end

  test "Form Authentication invalid username" do
    IO.puts("\nBeginning Form Authentication  - Login failed bad username")
    goto_page("Form Authentication")
    fill_username_field("lalalah")
    fill_password_field(@password)
    press_login()
    actual = visible_text(find_element(:id, "flash"))
    assert_string_contains(actual,"Your username is invalid!")
    IO.puts("Form Authentication - Login failed bad username: PASS")
  rescue
    error -> take_screenshot("./screenshots/screenshot_form_authentication_invalid_username#{DateTime.utc_now()}.png")
             raise error
  end

  test "Form Authentication invalid password" do
    IO.puts("\nBeginning Form Authentication - Login failed bad password")
    goto_page("Form Authentication")
    fill_username_field(@username)
    fill_password_field("lolipop")
    press_login()
    actual = visible_text(find_element(:id, "flash"))
    assert_string_contains(actual,"Your password is invalid!")
    IO.puts("Form Authentication - Login failed bad password: PASS")
  rescue
    error -> take_screenshot("./screenshots/screenshot_form_authentication_invalid_password#{DateTime.utc_now()}.png")
             raise error
  end

test "Form Authentication empty username" do
  IO.puts("\nBeginning Form Authentication - Login failed empty username")
  goto_page("Form Authentication")
  fill_username_field("")
  fill_password_field(@password)
  press_login()
  actual = visible_text(find_element(:id, "flash"))
  assert_string_contains(actual,"Your username is invalid!")
  IO.puts("Form Authentication - Login failed empty username: PASS")
rescue
    error -> take_screenshot("./screenshots/screenshot_form_authentication_empty_username#{DateTime.utc_now()}.png")
             raise error
end

test "Form Authentication empty password" do
  IO.puts("\nBeginning Form Authentication - Login failed empty password")
  goto_page("Form Authentication")
  fill_username_field(@username)
  fill_password_field("")
  press_login()
  actual = visible_text(find_element(:id, "flash"))
  assert_string_contains(actual,"Your password is invalid!")
  IO.puts("Form Authentication - Login failed empty password: PASS")
rescue
    error -> take_screenshot("./screenshots/screenshot_form_authentication_empty_password#{DateTime.utc_now()}.png")
             raise error
end

end