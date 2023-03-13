defmodule NextPayExamWeb.Api.TagController do
  use NextPayExamWeb, :controller
  alias NextPayExam.Tag.Resolvers.TagResolver, as: Resolver

  def index(conn, params \\ %{}) do
    {:ok, tags} = Resolver.list_all(params)

    render(conn, "index.json", data: tags)
  end
end
