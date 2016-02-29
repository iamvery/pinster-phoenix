defmodule PinsterPhoenix.LinkChannel do
  use Phoenix.Channel

  def join("links", _message, socket) do
    {:ok, socket}
  end
end
