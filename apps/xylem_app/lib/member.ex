### DOMAIN MODEL ###

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
          password: binary() | charlist() | nil
        }
  defstruct [:id, :email, :password]
end

### REPOSITORY ###

defmodule Member.Repo do
  @moduledoc false

  @callback find_by_id(id :: pos_integer()) :: {:ok, %Member{}} | {:error, term()}

  @callback find_by_nickname(nickname :: binary()) :: {:ok, %Member{}} | {:error, term()}

  @callback create(nickname :: binary(), indo :: binary(), join_at :: %DateTime{}) ::
              {:ok, %Member{}} | {:error, term()}

  @callback update(%Member{}) :: {:ok, %Member{}} | {:error, term()}

  @callback delete(%Member{}) :: {:ok, %Member{}} | {:error, term()}
end

defmodule User.Repo do
  @moduledoc false

  @callback find_by_email(email :: binary()) :: {:ok, %User{}} | {:error, term()}

  @callback create(email :: binary(), password :: binary()) :: {:ok, %User{}} | {:error, term()}

  @callback update(%User{}) :: {:ok, %User{}} | {:error, term()}

  @callback delete(%User{}) :: {:ok, %User{}} | {:error, term()}
end

### SERVICE ###

# Register(DTO <--> Value Object <--> Domain, Exceptions)

# Update(Exceptions)

### USECASE ###

# Register

# UpdateInfo

# UpdateSensitiveInfo

# UpdateStatus
