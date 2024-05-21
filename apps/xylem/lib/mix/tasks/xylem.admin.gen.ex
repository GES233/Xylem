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
      {:warn, :has_no_database} -> nil
      {:warn, :databse_has_data} -> nil
      {:ok, _} -> true
    end

    if clear_database == true do
      # 清除数据库

      # 将数据库迁移到最新
      Mix.Tasks.Xylem.Repo.Migrate.run(command_line_args)
    end
  end

  defp prelude() do
    # 关于数据库的检查
    {:ok, _repo} = Application.fetch_env(:xylem, :ecto_repos)
    # 有无数据库
    # {:warn, :has_no_database}

    # 数据库有无信息？
    # {:warn, :database_has_data}

    # 没有问题
    {:ok, nil}
  end
end
