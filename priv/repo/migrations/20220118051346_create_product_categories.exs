defmodule Join.Repo.Migrations.CreateProductCategories do
  use Ecto.Migration

  def change do
    create table(:product_categories) do
      add :name, :string
      add :icon, :string

      timestamps()
    end
  end
end
