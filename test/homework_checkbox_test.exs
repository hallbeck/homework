defmodule Homework.HomeworkCheckboxTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()
  def goto_form_authentication() do
    #First I get to the status Code page.
    navigate_to "https://the-internet.herokuapp.com"
    #click on Form Authentication
    click(find_element(:link_text, "Checkboxes"))
  end
#Testing checkboxes
  test "checkboxes 1" do
    #First I get to the checkboxes page.
    goto_form_authentication()
    # click the first checkbox
    # I wanted to get the number of checkboxes on the page then iterate through them.
    # I went down a bunch of rabbit holes trying to figure it out. then decided to stop.
    # If I was doing this in a workplace I would have other examples of how it can be done or
    # experienced people to ask. it wasn't a waste of time because i learned a bunch about Elixir.
    element = find_element(:css, "#checkboxes > input[type=checkbox]:nth-child(1)")
    IO.puts("\nBeginning check the checkbox #1")
    if selected?(element) do
      IO.puts("Beginning state is checkbox checked.")
      click(element)
      #this should be false
      refute selected?(element)
      IO.puts("The checkbox is clicked and should not be checked (the response is false)")
      click(element)
      IO.puts("The checkbox is clicked again and should be checked (the response is true)")
      assert selected?(element)
    else
      IO.puts("Beginning state is checkbox NOT checked.")
      click(element)
      IO.puts("The checkbox is clicked and should be checked (the response is true)")
      assert selected?(element)
    end
    IO.puts("Checkbox #1 Checking and unchecking: PASS")
  rescue
    error -> take_screenshot("./screenshotCheckbox1#{DateTime.utc_now()}.png")
             raise error
  end

  test "checkboxes 2" do
    #First I get to the checkboxes page.
    goto_form_authentication()
    #click the first checkbox
    element = find_element(:css, "#checkboxes > input[type=checkbox]:nth-child(3)")
    IO.puts("\nBeginning check the checkbox #2")
    if selected?(element) do
      IO.puts("Beginning state is checkbox checked.")
      click(element)
      #this should be false
      refute selected?(element)
      IO.puts("The checkbox is clicked and should not be checked (the response is false)")
      click(element)
      IO.puts("The checkbox is clicked again and should be checked (the response is true)")
      assert selected?(element)
    else
      IO.puts("Beginning state is checkbox NOT checked.")
      click(element)
      IO.puts("The checkbox is clicked and should be checked (the response is true)")
      assert selected?(element)
    end
    IO.puts("Checkbox #2 Checking and unchecking: PASS")
  rescue
    error -> take_screenshot("./screenshotCheckbox2#{DateTime.utc_now()}.png")
             raise error
  end
end