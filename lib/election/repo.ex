defmodule Election.Repo do
  use Ecto.Repo,
    otp_app: :election,
    adapter: Ecto.Adapters.Postgres
end
