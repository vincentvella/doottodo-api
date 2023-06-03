defmodule DootTodo.Identities.IdentityTypes do
  use Absinthe.Schema.Notation

  import_types(Absinthe.Type.Custom)

  object :identity do
    field :id, non_null(:id)
    field :provider, non_null(:string)
    field :last_sign_in_at, :datetime
    field :user_id, :string
  end
end
