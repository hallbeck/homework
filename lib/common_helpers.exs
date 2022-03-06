defmodule CommonHelpers do
  use Hound.Helpers
  use ExUnit.Case

  def goto_page(link_text) do
    #First I get to the status Code page.
    navigate_to "https://the-internet.herokuapp.com"
    #click on Form Authentication
    click(find_element(:link_text, link_text))
  end

  # i think this actually makes it more lines of code but I put it here and dont want to go through and change it back.
  #In a real world testing situation this may or may not be the way to go depending on if you might want to change
  # also I could have used assert actual +~ expected
  # if used in the workplace I would ask about any downfalls of one or the other or which is preferred.
  def assert_string_contains(actual,expected) do
    assert String.contains?(actual, expected)
  end

end