defmodule Mediagram.Factory do
  use ExMachina.Ecto, repo: Mediagram.Repo

  def user_factory do
    %Mediagram.User{
      name: Faker.Name.name(),
      email: Faker.Internet.email(),
      password: "password",
      password_hash: Bcrypt.hash_pwd_salt("password")
    }
  end

  def post_factory do
    %Mediagram.Post{
      body: Faker.Lorem.paragraph(),
      user: build(:user)
    }
  end

  def comment_factory do
    %Mediagram.Comment{
      body: Faker.Lorem.paragraph(),
      post: build(:post),
      user: build(:user)
    }
  end

  def conversation_factory do
    %Mediagram.Conversation{
      title: Faker.Lorem.sentence()
    }
  end

  def conversation_user_factory do
    %Mediagram.ConversationUser{
      conversation: build(:conversation),
      user: build(:user)
    }
  end

  def message_factory do
    %Mediagram.Message{
      body: Faker.Lorem.paragraph(),
      conversation: build(:conversation),
      user: build(:user)
    }
  end
end
