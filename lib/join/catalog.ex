defmodule Join.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias Join.Repo

  alias Join.Catalog.ProductCategory

  @doc """
  Returns the list of product_categories.

  ## Examples

      iex> list_product_categories()
      [%ProductCategory{}, ...]

  """
  def list_product_categories do
    Repo.all(ProductCategory)
  end

  @doc """
  Gets a single product_category.

  Raises `Ecto.NoResultsError` if the Product category does not exist.

  ## Examples

      iex> get_product_category!(123)
      %ProductCategory{}

      iex> get_product_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product_category!(id), do: Repo.get!(ProductCategory, id)

  @doc """
  Creates a product_category.

  ## Examples

      iex> create_product_category(%{field: value})
      {:ok, %ProductCategory{}}

      iex> create_product_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product_category(attrs \\ %{}) do
    %ProductCategory{}
    |> ProductCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product_category.

  ## Examples

      iex> update_product_category(product_category, %{field: new_value})
      {:ok, %ProductCategory{}}

      iex> update_product_category(product_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product_category(%ProductCategory{} = product_category, attrs) do
    product_category
    |> ProductCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product_category.

  ## Examples

      iex> delete_product_category(product_category)
      {:ok, %ProductCategory{}}

      iex> delete_product_category(product_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product_category(%ProductCategory{} = product_category) do
    Repo.delete(product_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product_category changes.

  ## Examples

      iex> change_product_category(product_category)
      %Ecto.Changeset{data: %ProductCategory{}}

  """
  def change_product_category(%ProductCategory{} = product_category, attrs \\ %{}) do
    ProductCategory.changeset(product_category, attrs)
  end
end
