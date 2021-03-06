defmodule PinsterPhoenix.LinksTest do
  use PinsterPhoenix.ConnCase
  use Hound.Helpers

  hound_session

  alias PinsterPhoenix.Link

  test "displays all links" do
    Repo.insert! %Link{url: "http://iamvery.com"}
    Repo.insert! %Link{url: "http://google.com"}

    navigate_to "/links"

    assert page_source =~ "iamvery.com"
    assert page_source =~ "google.com"
  end

  test "create link" do
    navigate_to "/links"

    element_id = find_element(:id, "link_url")
    fill_field element_id, "http://iamvery.com"
    submit_element(element_id)

    assert page_source =~ "iamvery.com"
  end

  test "delete link" do
    Repo.insert! %Link{url: "http://iamvery.com"}

    navigate_to "/links"

    element_id = find_element(:link_text, "×")
    click element_id

    refute page_source =~ "iamvery.com"
    # TODO how do you ensure that this test is valid without checking that the
    # 404 page is not being displayed?
    refute page_source =~ "not found"
    refute page_source =~ "error"
  end
end
