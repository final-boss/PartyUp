defmodule PartyUp.Router do
  use PartyUp.Web, :router
  use Addict.RoutesHelper

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PartyUp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    addict :routes,
      login:            [controller: UserController],
      register:         [controller: UserController],
      logout:           [controller: UserController],
      recover_password: [controller: UserController],
      reset_password:   [controller: UserController]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PartyUp do
  #   pipe_through :api
  # end
end
