defmodule Xylem.Repo do
  use Ecto.Repo,
  otp_app: :xylem,
  adapter: Ecto.Adapters.SQLite3
end
