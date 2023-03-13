defmodule NextPayExamWeb.IndexTest do
  alias NextPayExamWeb.ConnCase
  alias NextPayExam.Schemas.Tag
  alias NextPayExam.Schemas.AppIntegration
  alias NextPayExam.AppIntegration.Resolvers.AppIntegrationResolver
  alias NextPayExam.Tag.Resolvers.TagResolver
  alias NextPayExam.Repo
  use ConnCase
  use Hound.Helpers

  @tag_params %{
    tag_id: Ecto.UUID.generate(),
    name: "Children",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  }

  @other_tag_params %{
    tag_id: Ecto.UUID.generate(),
    name: "Ghosts",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  }

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

  @url "http://localhost:4001/"
  hound_session()

  setup do
    Repo.insert!(struct(AppIntegration, @app_integration_params))
    Repo.insert!(struct(AppIntegration, @other_app_integration_params))
    tag_1 = Repo.insert!(struct(Tag, @tag_params))

    tag_2 = Repo.insert!(struct(Tag, @other_tag_params))

    Repo.insert!(
      struct(
        AppIntegration,
        Map.merge(@app_integration_params, %{
          tag_ids: [tag_1.tag_id],
          name: "Synchro",
          app_integration_id: Ecto.UUID.generate()
        })
      )
    )

    Repo.insert!(
      struct(
        AppIntegration,
        Map.merge(@app_integration_params, %{
          tag_ids: [tag_1.tag_id],
          app_integration_id: Ecto.UUID.generate(),
          name: "Dragon"
        })
      )
    )

    Repo.insert!(
      struct(
        AppIntegration,
        Map.merge(@other_app_integration_params, %{
          tag_ids: [tag_2.tag_id],
          app_integration_id: Ecto.UUID.generate(),
          name: "TSX1"
        })
      )
    )

    {:ok, apps} = AppIntegrationResolver.root_list_all()
    {:ok, tags} = TagResolver.list_all()
    %{apps: apps, tags: tags}
  end

  test "should render" do
    navigate_to(@url)
    assert @url = current_url()
  end

  test "should display a list of all apps", %{apps: apps} do
    navigate_to(@url)
    assert @url = current_url()

    element = find_element(:id, "feed")
    text = visible_text(element)

    app_names = Enum.map(apps, & &1.name)

    assert String.contains?(text, app_names)
  end

  test "allows for searching for a specific app", %{apps: apps} do
    navigate_to(@url)
    assert @url = current_url()

    element = find_element(:id, "search-text-input")
    fill_field(element, "Nintendo")

    app_names = Enum.map(apps, & &1.name)

    text = visible_text({:id, "feed"})

    assert String.contains?(text, "Nintendo")
    assert !String.contains?(text, Enum.reject(app_names, &(&1 == "Nintendo")))
  end

  test "shows the empty state if non-matching string query is supplied" do
    navigate_to(@url)
    assert @url = current_url()

    search = find_element(:id, "search-text-input")
    fill_field(search, "asdfasdfasfadsfadfa")

    assert element_displayed?({:id, "empty-state"})
  end

  test "shows filters checkbox when filter dropdown is clicked", %{tags: tags} do
    navigate_to(@url)
    assert @url = current_url()

    dropdown_button = find_element(:id, "dropdown-filter-button")
    click(dropdown_button)

    assert element_displayed?({:id, "popper-filter-box"})
  end
end
