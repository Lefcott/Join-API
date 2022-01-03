defmodule Join.Repo.Migrations.CreateShops do
  use Ecto.Migration

  def change do
    create table(:shops) do
      add :name, :string
      add :type, :string
      add :main_photo_url, :string
      add :latitude, :integer
      add :longitude, :float

      timestamps()
    end
  end
end
