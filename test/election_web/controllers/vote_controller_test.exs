defmodule ElectionWeb.VoteControllerTest do
  use ElectionWeb.ConnCase

  alias Election.Voting

  @create_attrs %{v_2014: true, v_2016: true, v_2018: true, v_2020: true}
  @update_attrs %{v_2014: false, v_2016: false, v_2018: false, v_2020: false}
  @invalid_attrs %{v_2014: nil, v_2016: nil, v_2018: nil, v_2020: nil}

  def fixture(:vote) do
    {:ok, vote} = Voting.create_vote(@create_attrs)
    vote
  end

  describe "index" do
    test "lists all votes", %{conn: conn} do
      conn = get(conn, Routes.vote_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Votes"
    end
  end

  describe "new vote" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.vote_path(conn, :new))
      assert html_response(conn, 200) =~ "New Vote"
    end
  end

  describe "create vote" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vote_path(conn, :create), vote: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.vote_path(conn, :show, id)

      conn = get(conn, Routes.vote_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Vote"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vote_path(conn, :create), vote: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Vote"
    end
  end

  describe "edit vote" do
    setup [:create_vote]

    test "renders form for editing chosen vote", %{conn: conn, vote: vote} do
      conn = get(conn, Routes.vote_path(conn, :edit, vote))
      assert html_response(conn, 200) =~ "Edit Vote"
    end
  end

  describe "update vote" do
    setup [:create_vote]

    test "redirects when data is valid", %{conn: conn, vote: vote} do
      conn = put(conn, Routes.vote_path(conn, :update, vote), vote: @update_attrs)
      assert redirected_to(conn) == Routes.vote_path(conn, :show, vote)

      conn = get(conn, Routes.vote_path(conn, :show, vote))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, vote: vote} do
      conn = put(conn, Routes.vote_path(conn, :update, vote), vote: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Vote"
    end
  end

  describe "delete vote" do
    setup [:create_vote]

    test "deletes chosen vote", %{conn: conn, vote: vote} do
      conn = delete(conn, Routes.vote_path(conn, :delete, vote))
      assert redirected_to(conn) == Routes.vote_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.vote_path(conn, :show, vote))
      end
    end
  end

  defp create_vote(_) do
    vote = fixture(:vote)
    %{vote: vote}
  end
end
