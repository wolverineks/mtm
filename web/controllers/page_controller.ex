defmodule Mtm.PageController do
  use Mtm.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
