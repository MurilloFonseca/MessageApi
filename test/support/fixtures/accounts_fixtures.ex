defmodule MessageApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MessageApi.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        admin: true,
        email: "some email",
        name: "some name",
        password: "some password"
      })
      |> MessageApi.Accounts.create_user()

    user
  end
end
