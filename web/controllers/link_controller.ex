defmodule PinsterPhoenix.LinkController do
  use PinsterPhoenix.Web, :controller

  alias PinsterPhoenix.Link

  def index(conn, _params) do
    links = Repo.all(Link)
    render conn, "index.html", links: links
  end
end
