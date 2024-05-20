defmodule Mix.Tasks.Xylem.Repo.Gen do
  @moduledoc """
  建立新的数据库。
  """
  @behaviour Mix.Task

  @impl true
  @doc """
  Create database named `db_name`.
  """
  def run(_command_line_args) do
    # ...
  end

  def db_name(env), do:
    "xylem_#{Atom.to_charlist(env)}.db"

  def create_db(name) do
    {:ok, conn} = Exqlite.Sqlite3.open(name)

    Exqlite.Sqlite3.close(conn)
  end

  def create_database_in_dev() do
    _path = db_name(:dev)
  end
end
