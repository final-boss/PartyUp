defmodule PartyUp.SignUpController do
  use PartyUp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def sign_up(conn, _params) do
    
  end
end
