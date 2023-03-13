defmodule NextPayExamWeb.PageController do
  use NextPayExamWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
