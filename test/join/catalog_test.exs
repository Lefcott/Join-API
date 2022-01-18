defmodule Join.CatalogTest do
  use Join.DataCase

  alias Join.Catalog

  describe "product_categories" do
    alias Join.Catalog.ProductCategory

    import Join.CatalogFixtures

    @invalid_attrs %{icon: nil, name: nil}

    test "list_product_categories/0 returns all product_categories" do
      product_category = product_category_fixture()
      assert Catalog.list_product_categories() == [product_category]
    end

    test "get_product_category!/1 returns the product_category with given id" do
      product_category = product_category_fixture()
      assert Catalog.get_product_category!(product_category.id) == product_category
    end

    test "create_product_category/1 with valid data creates a product_category" do
      valid_attrs = %{icon: "some icon", name: "some name"}

      assert {:ok, %ProductCategory{} = product_category} = Catalog.create_product_category(valid_attrs)
      assert product_category.icon == "some icon"
      assert product_category.name == "some name"
    end

    test "create_product_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_product_category(@invalid_attrs)
    end

    test "update_product_category/2 with valid data updates the product_category" do
      product_category = product_category_fixture()
      update_attrs = %{icon: "some updated icon", name: "some updated name"}

      assert {:ok, %ProductCategory{} = product_category} = Catalog.update_product_category(product_category, update_attrs)
      assert product_category.icon == "some updated icon"
      assert product_category.name == "some updated name"
    end

    test "update_product_category/2 with invalid data returns error changeset" do
      product_category = product_category_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_product_category(product_category, @invalid_attrs)
      assert product_category == Catalog.get_product_category!(product_category.id)
    end

    test "delete_product_category/1 deletes the product_category" do
      product_category = product_category_fixture()
      assert {:ok, %ProductCategory{}} = Catalog.delete_product_category(product_category)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_product_category!(product_category.id) end
    end

    test "change_product_category/1 returns a product_category changeset" do
      product_category = product_category_fixture()
      assert %Ecto.Changeset{} = Catalog.change_product_category(product_category)
    end
  end
end
