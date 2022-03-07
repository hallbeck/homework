defmodule ApiTest do
  use ExUnit.Case

  test "get single user test" do
    IO.puts("get single user test")
    resp = HTTPoison.get!("https://reqres.in/api/users/5")
    assert resp.status_code == 200
    user_data =JSON.decode!("#{resp.body}")
    comparison = %{
      "avatar" => "https://reqres.in/img/faces/5-image.jpg",
      "email" => "charles.morris@reqres.in",
      "first_name" => "Charles",
      "id" => 5,
      "last_name" => "Morris"
    }
    assert user_data["data"] == comparison
  end

  test "get invalid URL" do
    IO.puts("get single user test bad request")
    resp = HTTPoison.get!("https://reqres.in/api")
    assert resp.status_code == 404
  end

  test "get alpha user" do
    IO.puts("get single user test alpha request")
    resp = HTTPoison.get!("https://reqres.in/api/users/George")
    assert resp.status_code == 404
  end

  test "get list users test" do
    IO.puts("get list users test")
    resp = HTTPoison.get!("https://reqres.in/api/users?page=1")
    assert resp.status_code == 200
    user_data =JSON.decode!("#{resp.body}")
    comparison = [
      %{
        "avatar" => "https://reqres.in/img/faces/1-image.jpg",
        "email" => "george.bluth@reqres.in",
        "first_name" => "George",
        "id" => 1,
        "last_name" => "Bluth"
      },
      %{
        "avatar" => "https://reqres.in/img/faces/2-image.jpg",
        "email" => "janet.weaver@reqres.in",
        "first_name" => "Janet",
        "id" => 2,
        "last_name" => "Weaver"
      },
      %{
        "avatar" => "https://reqres.in/img/faces/3-image.jpg",
        "email" => "emma.wong@reqres.in",
        "first_name" => "Emma",
        "id" => 3,
        "last_name" => "Wong"
      },
      %{
        "avatar" => "https://reqres.in/img/faces/4-image.jpg",
        "email" => "eve.holt@reqres.in",
        "first_name" => "Eve",
        "id" => 4,
        "last_name" => "Holt"
      },
      %{
        "avatar" => "https://reqres.in/img/faces/5-image.jpg",
        "email" => "charles.morris@reqres.in",
        "first_name" => "Charles",
        "id" => 5,
        "last_name" => "Morris"
      },
      %{
        "avatar" => "https://reqres.in/img/faces/6-image.jpg",
        "email" => "tracey.ramos@reqres.in",
        "first_name" => "Tracey",
        "id" => 6,
        "last_name" => "Ramos"
      }
    ]
    assert user_data["data"] == comparison

  end

  test "get single user not found test" do
    IO.puts("get single user not found test")
    resp = HTTPoison.get!("https://reqres.in/api/users/23")
    assert resp.status_code == 404
  end

  test "post create test" do
    IO.puts("post create test")
    body = %{name: "Divvy Test", job: "QA"} |> Poison.encode!()
    resp = HTTPoison.post!("https://reqres.in/api/users", body)
    assert resp.status_code == 201
    #cannot get user201 to verify this has been updated because they don't change the db.
  end

  test "put update test" do
    IO.puts("put update test")
    body = %{name: "Divvy Test", job: "QA Master of the Universe"} |> Poison.encode!()
    put_resp = HTTPoison.put!("https://reqres.in/api/users/2", body)
    assert put_resp.status_code == 200
    #cannot get user2 to verify this has been updated because they don't change the db.
  end
end