defmodule NextPayExam.AppIntegration.Resolvers.AppIntegrationResolver do
  use NextPayExam, :resolver
  alias NextPayExam.AppIntegration.Queries.AppIntegrationQueries, as: Queries

  def list_all(params \\ %{}, preload \\ []) do
    app_integrations =
      params
      |> Queries.query_all(preload)
      |> Repo.paginate(page: params["page"], page_size: params["limit"])

    {:ok, app_integrations}
  end

  def root_list_all(params \\ %{}, preload \\ []) do
    app_integrations =
      params
      |> Queries.query_all(preload)
      |> Repo.all()

    {:ok, app_integrations}
  end
end
