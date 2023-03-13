defmodule NextPayExamWeb.Api.AppIntegrationView do
  use NextPayExamWeb, :view

  def render("index.json", %{data: %{entries: entries} = page}) do
    %{
      app_integrations: Enum.map(entries, &build_data/1),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("data.json", %{data: datum}) do
    %{
      title: datum.title
    }
  end

  def build_data(app_integrations) do
    app_integrations
    |> Map.take([
      :app_integration_id,
      :name,
      :description,
      :avatar_url,
      :tag_ids
    ])
  end
end
