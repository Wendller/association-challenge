defmodule Exmeal.User do
  use Ecto.Schema

  alias Exmeal.Meal

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:cpf, :id, :email, :name]}
  @foreign_key_type :binary_id

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:cpf, :email, :name]

  schema "users" do
    field :name, :string
    field :cpf, :string
    field :email, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
  end
end
