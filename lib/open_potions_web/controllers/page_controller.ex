defmodule OpenPotionsWeb.PageController do
  use OpenPotionsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
