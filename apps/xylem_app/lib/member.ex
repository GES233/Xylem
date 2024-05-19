defmodule Member do
  @moduledoc """
  ...
  """

  @type t :: %__MODULE__{
    id: pos_integer(),
    nickname: binary(),
    info: binary(),
    join_at: DateTime.t()
  }
  defstruct [:id, :nickname, :info, :join_at]
end
