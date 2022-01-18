defmodule JoinWeb.ProductCategoryController do
  use JoinWeb, :controller

  alias Join.Catalog
  alias Join.Catalog.ProductCategory

  action_fallback JoinWeb.FallbackController

  def index(conn, _params) do
    product_categories = Catalog.list_product_categories()
    render(conn, "index.json", product_categories: product_categories)
  end

  def create(conn, %{"product_category" => product_category_params}) do
    with {:ok, %ProductCategory{} = product_category} <- Catalog.create_product_category(product_category_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.product_category_path(conn, :show, product_category))
      |> render("show.json", product_category: product_category)
    end
  end

  def show(conn, %{"id" => id}) do
    product_category = Catalog.get_product_category!(id)
    render(conn, "show.json", product_category: product_category)
  end

  def update(conn, %{"id" => id, "product_category" => product_category_params}) do
    product_category = Catalog.get_product_category!(id)

    with {:ok, %ProductCategory{} = product_category} <- Catalog.update_product_category(product_category, product_category_params) do
      render(conn, "show.json", product_category: product_category)
    end
  end

  def delete(conn, %{"id" => id}) do
    product_category = Catalog.get_product_category!(id)

    with {:ok, %ProductCategory{}} <- Catalog.delete_product_category(product_category) do
      send_resp(conn, :no_content, "")
    end
  end
end
