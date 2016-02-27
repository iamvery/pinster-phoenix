defmodule PinsterPhoenix.LinkController do
  use PinsterPhoenix.Web, :controller

  alias PinsterPhoenix.Link

  def index(conn, _params) do
    link = Link.changeset(%Link{})
    links = Repo.all(Link)
    render conn, "index.html", link: link, links: links
  end

  def create(conn, %{"link" => link_params} ) do
    # TODO you can use a model with Repo.insert, how can I get params into a
    # model?
    # TODO error handling?
    Link.changeset(%Link{}, link_params) |> Repo.insert!
    # TODO use link_path helper
    redirect conn, to: "/links"
  end

  def delete(conn, %{"id" => id}) do
    # TODO error handling
    Repo.delete!(Link, id)
    redirect conn, to: "/links"
  end
end
