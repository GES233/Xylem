defmodule Mix.Tasks.Xylem.Admin.Gen do
  @moduledoc """
  创建管理员
  """
  @behaviour Mix.Task

  @impl true
  def run(command_line_args) do
    # 检查数据库是否为空
    database_status = prelude()
    clear_database = case database_status do
      # {:warn, :database_not_found} -> false
      {:warn, :database_has_data} -> false
      {:ok, _} -> true
    end

    if clear_database == true do
      # 清除数据库

      # 将数据库迁移到最新
      Mix.Tasks.Xylem.Repo.Migrate.run(command_line_args)
    end
  end

  defp prelude() do
    # 有无数据库
    {status, info_or_conn} = db_exists()
    # {:ok, db_conn} | {:warn, :database_not_found}

    # 数据库有无信息？
    db_status = case status do
      :ok -> info_or_conn |> check_data_exists()
      _ -> status
    end

    data_status = case db_status do
      :ok -> {:ok, :no_data}
      {:error, reason} -> {:error, reason}
      :warn -> {:warn, :database_not_found}
      _ -> {:warn, :database_has_data}
    end
    # {:ok, nil_data}
    # {:error, reason}
    # {:warn, :database_has_data}

    # 释放数据库连接
    Exqlite.Sqlite3.close(info_or_conn)

    data_status
  end

  # 检查数据库是否存在
  defp db_exists() do
    {:ok, repos} = Application.fetch_env(:xylem, :ecto_repos)

    case Application.fetch_env(:xylem, Enum.at(repos, 0)) do
      {:ok, repo_path} ->
        Exqlite.Sqlite3.open(Access.get(repo_path, :database))
      _ -> {:warn, :database_not_found}
    end
  end

  # 检查数据库是否有业务信息
  defp check_data_exists(conn) do
    conn
    |> Exqlite.Sqlite3.execute("SELECT * FROM")
  end
end
