defmodule PinsterPhoenix.PageController do
  use PinsterPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
