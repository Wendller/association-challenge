defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view

  alias Exmeal.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      meal: %{meal: meal},
      message: "Meal created!"
    }
  end

  def render() do
    # TO DO
  end
end
