defmodule Join.Repo.Migrations.AddDescriptionToShops do
  use Ecto.Migration

  def change do
    alter table("shops") do
      add_column(:description, :text)
    end
  end
end
