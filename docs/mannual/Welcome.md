# Xylem 使用手册

欢迎使用 `Xylem` ！
非常感谢你能够来看因为想要实践小小的想法做出的小玩意儿。
希望你能够玩的开心。

## 开始使用

### 获得 Xylem

#### Windows

#### Linux

如果你选择在这个系统上运行 `Xylem` ，至少说明你明白你在干什么，那我就不那么客气了，望谅解。

和大多数 Elixirers 不同的是，我没选择 Linux 开发（因为不精通 Vim/Neovim），我那个 NeoVim 配置还卡在 Elixir 的 treesitter 高亮在装了 LSP 后不显示呢。

所以如果你想要运行 `Xylem` 的话，就下载源代码然后 `mix blabla` 吧。
获得编译依赖，然后编译应用，可以参考 Phoenix 的文档。

#### 运行命令

只需要简单的执行以下命令即可：

```sh
mix deps.get            # 获取依赖
mix deps.compile        # 编译依赖
mix compile             # 编译应用
# TODO
# 尽量用其他库的命令替代
mix xylem.repo.gen      # 创建数据库
mix xylem.repo.migrate  # 迁移数据库
mix xylem.admin.gen --nickname {昵称} --password {你设置的密码}
                        # 创建管理员
                        # 前端资源
mix tailwind.install --if-missing
mix esbuild.install --if-missing
mix tailwind default
mix esbuild default
mix phx.server          # 启动服务器
```

这很《简单》是吧？
TODO: ALL IN ONE SCRIPT AND EXECUTABLE.

### 简单的修改

#### 修改环境变量

#### 修改 `/config`
