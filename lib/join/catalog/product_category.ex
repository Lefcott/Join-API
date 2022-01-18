defmodule Join.Catalog.ProductCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_categories" do
    field :icon, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(product_category, attrs) do
    product_category
    |> cast(attrs, [:name, :icon])
    |> validate_required([:name, :icon])
  end
end
