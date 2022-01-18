defmodule JoinWeb.ProductCategoryControllerTest do
  use JoinWeb.ConnCase

  import Join.CatalogFixtures

  alias Join.Catalog.ProductCategory

  @create_attrs %{
    icon: "some icon",
    name: "some name"
  }
  @update_attrs %{
    icon: "some updated icon",
    name: "some updated name"
  }
  @invalid_attrs %{icon: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all product_categories", %{conn: conn} do
      conn = get(conn, Routes.product_category_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product_category" do
    test "renders product_category when data is valid", %{conn: conn} do
      conn = post(conn, Routes.product_category_path(conn, :create), product_category: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.product_category_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "icon" => "some icon",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.product_category_path(conn, :create), product_category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product_category" do
    setup [:create_product_category]

    test "renders product_category when data is valid", %{conn: conn, product_category: %ProductCategory{id: id} = product_category} do
      conn = put(conn, Routes.product_category_path(conn, :update, product_category), product_category: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.product_category_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "icon" => "some updated icon",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, product_category: product_category} do
      conn = put(conn, Routes.product_category_path(conn, :update, product_category), product_category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product_category" do
    setup [:create_product_category]

    test "deletes chosen product_category", %{conn: conn, product_category: product_category} do
      conn = delete(conn, Routes.product_category_path(conn, :delete, product_category))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.product_category_path(conn, :show, product_category))
      end
    end
  end

  defp create_product_category(_) do
    product_category = product_category_fixture()
    %{product_category: product_category}
  end
end
