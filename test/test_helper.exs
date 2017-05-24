{:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:faker)
{:ok, _} = Application.ensure_all_started(:wallaby)

Application.put_env(
  :wallaby, :base_url, PartyUp.Endpoint.url
)

ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(PartyUp.Repo, :manual)
