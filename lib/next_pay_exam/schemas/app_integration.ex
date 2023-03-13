defmodule NextPayExam.Schemas.AppIntegration do
  use Ecto.Schema

  @schema_fields [
    :app_integration_id,
    :name,
    :avatar_url,
    :description,
    :tag_ids
  ]

  @derive {Phoenix.Param, key: :app_integration_id}
  @derive {Jason.Encoder, only: @schema_fields}

  @primary_key false

  schema "app_integration" do
    field(:app_integration_id, Ecto.UUID, primary_key: true)
    field(:name, :string)
    field(:avatar_url, :string)
    field(:description, :string)
    field(:tag_ids, {:array, Ecto.UUID}, default: [])
    field(:inserted_at, :utc_datetime_usec)
    field(:updated_at, :utc_datetime_usec)
  end
end
