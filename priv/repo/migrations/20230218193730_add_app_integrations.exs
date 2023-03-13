defmodule NextPayExam.Repo.Migrations.AddAppIntegrations do
  use Ecto.Migration

  def change do
    create table(:app_integration) do
      add :app_integration_id, :binary_id, primary_key: true
      add :name, :string
      add :avatar_url, :text
      add :description, :text
      add :tag_ids, {:array, :uuid}

      timestamps(type: :utc_datetime_usec)
    end
  end
end
