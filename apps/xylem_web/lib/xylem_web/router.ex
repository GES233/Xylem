defmodule XylemWeb.Router do
  @moduledoc """
  关于路由：

  因为其比较独特的属性，所以需要比较比较精细的设计。
  """
  use XylemWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {XylemWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # TODO
  # 关于管理员的管线与路由
  # 我们可以什么是管理员？
  # - 从本地登录的
  # - 通过 IEX 访问的（iex -S mix phx.server）
  # - 特殊的用户组 & 有密钥
  pipeline :admin do
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_live_flash
    # ...
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  @doc """
  网页：

  "/" -> 首页
  "/t/build" -> 创建小说
  """
  scope "/", XylemWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # 关于 API：
  # 鉴权接受包括在 Header 以及作为请求参数被传入。
  # TODO: 在完成相关设置后清除下面的注释
  #
  # scope "/api", XylemWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:xylem_web, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: XylemWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
