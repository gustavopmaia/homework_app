defmodule HomeworkAppWeb.Plugs.CurrentUser do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    # "Bearer" <> token = get_req_header(conn, "Authorization")
    user = Guardian.Plug.current_resource(conn)
    IO.inspect(user, label: "Guardian User")

    assign(conn, :current_user, user)
  end
end
