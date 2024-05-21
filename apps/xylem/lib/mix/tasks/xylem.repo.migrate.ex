defmodule Mix.Tasks.Xylem.Repo.Migrate do
  use Mix.Task

  @impl true
  def run(_command_line_args) do
    repo = get_repo()

    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
  end

  defp get_repo() do
    Application.load(:xylem)
    {:ok, repo} = Application.fetch_env(:xylem, :ecto_repos)

    # Xylem only need one repo.
    Enum.at(repo, 0)
  end
end
