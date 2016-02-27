defmodule PinsterPhoenix.LinksTest do
  use PinsterPhoenix.ConnCase
  use Hound.Helpers

  hound_session

  alias PinsterPhoenix.Link

  test "displays all links" do
    Link.changeset(%Link{}, %{url: "http://iamvery.com"}) |> Repo.insert!
    Link.changeset(%Link{}, %{url: "http://google.com"}) |> Repo.insert!

    navigate_to "/links"

    assert page_source =~ "iamvery.com"
    assert page_source =~ "google.com"
  end
end
