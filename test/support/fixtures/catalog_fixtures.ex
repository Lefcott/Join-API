defmodule Join.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Join.Catalog` context.
  """

  @doc """
  Generate a product_category.
  """
  def product_category_fixture(attrs \\ %{}) do
    {:ok, product_category} =
      attrs
      |> Enum.into(%{
        icon: "some icon",
        name: "some name"
      })
      |> Join.Catalog.create_product_category()

    product_category
  end
end
