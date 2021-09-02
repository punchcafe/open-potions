defmodule OpenPotions.Repo do
  use Ecto.Repo,
    otp_app: :open_potions,
    adapter: Ecto.Adapters.Postgres
end
