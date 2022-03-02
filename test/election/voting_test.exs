defmodule Election.VotingTest do
  use Election.DataCase

  alias Election.Voting

  describe "voters" do
    alias Election.Voting.Voter

    @valid_attrs %{city: "some city", coun: "some coun", first: "some first", last: "some last", street: "some street"}
    @update_attrs %{city: "some updated city", coun: "some updated coun", first: "some updated first", last: "some updated last", street: "some updated street"}
    @invalid_attrs %{city: nil, coun: nil, first: nil, last: nil, street: nil}

    def voter_fixture(attrs \\ %{}) do
      {:ok, voter} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Voting.create_voter()

      voter
    end

    test "list_voters/0 returns all voters" do
      voter = voter_fixture()
      assert Voting.list_voters() == [voter]
    end

    test "get_voter!/1 returns the voter with given id" do
      voter = voter_fixture()
      assert Voting.get_voter!(voter.id) == voter
    end

    test "create_voter/1 with valid data creates a voter" do
      assert {:ok, %Voter{} = voter} = Voting.create_voter(@valid_attrs)
      assert voter.city == "some city"
      assert voter.coun == "some coun"
      assert voter.first == "some first"
      assert voter.last == "some last"
      assert voter.street == "some street"
    end

    test "create_voter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Voting.create_voter(@invalid_attrs)
    end

    test "update_voter/2 with valid data updates the voter" do
      voter = voter_fixture()
      assert {:ok, %Voter{} = voter} = Voting.update_voter(voter, @update_attrs)
      assert voter.city == "some updated city"
      assert voter.coun == "some updated coun"
      assert voter.first == "some updated first"
      assert voter.last == "some updated last"
      assert voter.street == "some updated street"
    end

    test "update_voter/2 with invalid data returns error changeset" do
      voter = voter_fixture()
      assert {:error, %Ecto.Changeset{}} = Voting.update_voter(voter, @invalid_attrs)
      assert voter == Voting.get_voter!(voter.id)
    end

    test "delete_voter/1 deletes the voter" do
      voter = voter_fixture()
      assert {:ok, %Voter{}} = Voting.delete_voter(voter)
      assert_raise Ecto.NoResultsError, fn -> Voting.get_voter!(voter.id) end
    end

    test "change_voter/1 returns a voter changeset" do
      voter = voter_fixture()
      assert %Ecto.Changeset{} = Voting.change_voter(voter)
    end
  end
end
