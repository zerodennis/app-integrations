defmodule NextPayExamWeb.AppIntegrationControllerTest do
  use NextPayExamWeb.ConnCase
  alias NextPayExam.Repo
  alias NextPayExam.Schemas.AppIntegration
  alias NextPayExam.Schemas.Tag

  @app_integration_params %{
    app_integration_id: Ecto.UUID.generate(),
    name: "Sony",
    avatar_url: "",
    description: "desc",
    tag_ids: [],
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  }

  @other_app_integration_params %{
    app_integration_id: Ecto.UUID.generate(),
    name: "Nintendo",
    avatar_url: "",
    description: "desc",
    tag_ids: [],
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  }

  describe "/api/app-integrations" do
    test "returns a paginated list of all apps", %{conn: conn} do
      Repo.insert!(struct(AppIntegration, @app_integration_params))
      Repo.insert!(struct(AppIntegration, @other_app_integration_params))
      conn = get(conn, "/api/app-integrations")

      assert %{assigns: %{data: %{entries: entries}}} = conn
      assert length(entries) == 2
    end

    test "allows for search query", %{conn: conn} do
      Repo.insert!(struct(AppIntegration, @app_integration_params))
      Repo.insert!(struct(AppIntegration, @other_app_integration_params))

      conn = get(conn, "/api/app-integrations", %{"q" => @other_app_integration_params[:name]})

      assert %{assigns: %{data: %{entries: entries}}} = conn
      assert length(entries) == 1
    end

    test "allows for tag queries", %{conn: conn} do
      tag_1 =
        Repo.insert!(
          struct(Tag, %{
            tag_id: Ecto.UUID.generate(),
            name: "Children",
            inserted_at: DateTime.utc_now(),
            updated_at: DateTime.utc_now()
          })
        )

      tag_2 =
        Repo.insert!(
          struct(Tag, %{
            tag_id: Ecto.UUID.generate(),
            name: "Ghosts",
            inserted_at: DateTime.utc_now(),
            updated_at: DateTime.utc_now()
          })
        )

      _app_1 =
        Repo.insert!(
          struct(AppIntegration, Map.merge(@app_integration_params, %{tag_ids: [tag_1.tag_id]}))
        )

      _app_2 =
        Repo.insert!(
          struct(
            AppIntegration,
            Map.merge(@app_integration_params, %{
              tag_ids: [tag_1.tag_id],
              app_integration_id: Ecto.UUID.generate()
            })
          )
        )

      app_3 =
        Repo.insert!(
          struct(
            AppIntegration,
            Map.merge(@other_app_integration_params, %{tag_ids: [tag_2.tag_id]})
          )
        )

      conn = get(conn, "/api/app-integrations", %{"tagIds" => Jason.encode!([tag_1.tag_id])})

      assert %{assigns: %{data: %{entries: entries}}} = conn

      results_ids = Enum.map(entries, & &1.app_integration_id)

      assert app_3.app_integration_id not in results_ids

      results_tag_ids = Enum.flat_map(entries, & &1.tag_ids)

      assert tag_2.tag_id not in results_tag_ids
    end
  end
end
