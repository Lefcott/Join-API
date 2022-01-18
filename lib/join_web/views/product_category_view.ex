defmodule JoinWeb.ProductCategoryView do
  use JoinWeb, :view
  alias JoinWeb.ProductCategoryView

  def render("index.json", %{product_categories: product_categories}) do
    %{data: render_many(product_categories, ProductCategoryView, "product_category.json")}
  end

  def render("show.json", %{product_category: product_category}) do
    %{data: render_one(product_category, ProductCategoryView, "product_category.json")}
  end

  def render("product_category.json", %{product_category: product_category}) do
    %{
      id: product_category.id,
      name: product_category.name,
      icon: product_category.icon
    }
  end
end
