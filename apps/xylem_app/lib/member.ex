defmodule Member.Status do
  @moduledoc """
  展示用户的状态。

  本质上是有限状态机。
  """
  use Status, [:normal, :verified, :blocked, newbie: :default]
end

defmodule Member do
  @moduledoc """
  `Member` 是 Xylem 内关于用户的领域模型。
  """

  @type t :: %__MODULE__{
    id: pos_integer(),
    nickname: binary(),
    status: Member.Status,
    info: binary(),
    join_at: DateTime.t()
  }
  defstruct [:id, :nickname, :status, :info, :join_at]
end

defmodule User do
  @type t :: %__MODULE__{
    id: pos_integer(),
    email: binary() | nil,
    password: binary() | charlist() | nil,
  }
  defstruct [:id, :email, :password]
end
