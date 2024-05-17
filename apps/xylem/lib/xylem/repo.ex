defmodule Xylem.Repo do
  @common_opt [otp_app: :xylem]
  # if postgres.existrs: ...
  use Ecto.Repo,
      @common_opt ++ [adapter: Ecto.Adapters.Postgres]

  # else: sqlite
end
