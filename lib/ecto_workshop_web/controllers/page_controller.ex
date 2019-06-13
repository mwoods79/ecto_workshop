defmodule EctoWorkshopWeb.PageController do
  use EctoWorkshopWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
