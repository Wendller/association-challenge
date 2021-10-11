defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

  alias Exmeal.Meal

  action_fallback FallbackController

  def create(connection, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.create_meal(params) do
      connection
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def delete() do
    # TO DO
  end

  def show() do
    # TO DO
  end

  def update() do
    # TO DO
  end
end
