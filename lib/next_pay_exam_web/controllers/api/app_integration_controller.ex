defmodule NextPayExamWeb.Api.AppIntegrationController do
  use NextPayExamWeb, :controller
  alias NextPayExam.AppIntegration.Resolvers.AppIntegrationResolver, as: Resolver

  def index(conn, params \\ %{}) do
    params =
      if params["tagIds"] do
        Map.put(params, "tagIds", Jason.decode!(params["tagIds"]))
      else
        params
      end

    params = prepare_params(params)

    {:ok, app_integrations} = Resolver.list_all(params)

    render(conn, "index.json", data: app_integrations)
  end

  def shuffle_entries(conn, params \\ %{}) do
    params =
      if params["tagIds"] do
        Map.put(params, "tagIds", Jason.decode!(params["tagIds"]))
      else
        params
      end

    params = prepare_params(params)

    {:ok, %{entries: entries} = app_integrations} = Resolver.list_all(params)

    data = Map.put(app_integrations, :entries, Enum.shuffle(entries))

    render(conn, "index.json", data: data)
  end

  defp prepare_params(%{"tagIds" => tag_ids} = params) when tag_ids == [],
    do: Map.delete(params, "tagIds")

  defp prepare_params(%{"tagIds" => tag_ids} = params) when tag_ids not in [nil, []], do: params

  defp prepare_params(params), do: params
end
