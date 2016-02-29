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
    Link.changeset(%Link{}, link_params)
    |> Repo.insert!
    |> broadcast_create
    # TODO use link_path helper
    redirect conn, to: "/links"
  end

  defp broadcast_create(link) do
    rendered = render_link_to_string(link)
    PinsterPhoenix.Endpoint.broadcast!("links", "create", %{link: %{rendered: rendered}})
  end

  defp render_link_to_string(link) do
    Phoenix.View.render_to_string(PinsterPhoenix.LinkView, "link.html", link: link)
  end

  def delete(conn, %{"id" => id}) do
    # TODO error handling
    link = Repo.get!(Link, id)
    Repo.delete!(link)
    redirect conn, to: "/links"
  end
end
