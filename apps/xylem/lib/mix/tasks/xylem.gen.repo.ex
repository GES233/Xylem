defmodule Mix.Tasks.Xylem.Gen.Repo do
  @moduledoc """
  建立新的数据库。
  """
  @behaviour Mix.Task

  def default_path(env), do:
    "/xylem_#{Atom.to_charlist(env)}.db"

  @impl true
  @doc """
  Create database named `db_name`.
  """
  def run(_command_line_args) do
    # ...
  end
end
