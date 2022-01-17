defmodule Join.Repo.Migrations.AddDescriptionToShops do
  use Ecto.Migration

  def change do
    alter table("shops") do
      add :description, :string
    end
  end
end
