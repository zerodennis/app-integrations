defmodule NextPayExamWeb.Api.DataController do
  use NextPayExamWeb, :controller

  @data [
    %{
      id: 1,
      title: "Test Data One"
    },
    %{
      id: 2,
      title: "Test Data Two"
    },
    %{
      id: 3,
      title: "Test Data Three"
    }
  ]

  def index(conn, params) do
    render(conn, "index.json", data: @data)
  end

  def list_app_integrations(conn, params) do
  end
end
