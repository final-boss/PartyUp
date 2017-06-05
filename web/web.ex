defmodule PartyUp.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use PartyUp.Web, :controller
      use PartyUp.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      alias PartyUp.Repo
      import Ecto
      import Ecto.Query

      import PartyUp.Router.Helpers
      import PartyUp.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import convenience functions from controllers
      import Phoenix.Controller, except: [
        render: 2, render: 3
      ]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import PartyUp.Router.Helpers
      import PartyUp.ErrorHelpers
      import PartyUp.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias PartyUp.Repo
      import Ecto
      import Ecto.Query
      import PartyUp.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
