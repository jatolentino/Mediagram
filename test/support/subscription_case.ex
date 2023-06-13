defmodule MediagramWeb.SubscriptionCase do
  use ExUnit.CaseTemplate

  alias Mediagram.Guardian

  using do
    quote do
      use MediagramWeb.ChannelCase
      use Absinthe.Phoenix.SubscriptionTest, schema: MediagramWeb.Schema
      use ExSpec
      import Mediagram.Factory

      setup do
        user = insert(:user)

        # When connecting to a socket, if you pass a token we will set the context's `current_user`
        params = %{
          "token" => sign_auth_token(user)
        }

        {:ok, socket} = Phoenix.ChannelTest.connect(MediagramWeb.AbsintheSocket, params)
        {:ok, socket} = Absinthe.Phoenix.SubscriptionTest.join_absinthe(socket)

        {:ok, socket: socket, user: user}
      end

      defp sign_auth_token(user) do
        {:ok, token, _claims} = Guardian.encode_and_sign(user)
        token
      end
    end
  end
end
