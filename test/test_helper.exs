{:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:faker)
{:ok, _} = Application.ensure_all_started(:wallaby)

ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(PartyUp.Repo, :manual)
