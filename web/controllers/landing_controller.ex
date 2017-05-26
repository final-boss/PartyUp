defmodule PartyUp.LandingController do
  use PartyUp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
