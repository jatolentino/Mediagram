defmodule Mediagram.ConversationUser do
  use Mediagram.Model

  alias Mediagram.{Conversation, User}

  schema "conversation_users" do
    belongs_to :conversation, Conversation
    belongs_to :user, User

    timestamps()
  end

  def changeset(conversation_users, attrs) do
    conversation_users
    |> cast(attrs, [:conversation_id, :user_id])
    |> validate_required([:conversation_id, :user_id])
    |> unique_constraint(:user_id, name: :conversation_users_conversation_id_user_id_index)
  end
end
