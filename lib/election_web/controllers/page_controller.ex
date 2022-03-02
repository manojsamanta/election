defmodule ElectionWeb.PageController do
  use ElectionWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
