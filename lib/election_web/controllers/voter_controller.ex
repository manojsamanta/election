defmodule ElectionWeb.VoterController do
  use ElectionWeb, :controller

  alias Election.Voting
  alias Election.Voting.Voter

  def index(conn, _params) do
    changeset = Voting.changeset(%Voter{})
    render(conn, "index.html", changeset: changeset)
  end

  def result(conn, %{"voter"=> params}) do
    voters = Voting.list_voters_name(params)
    render(conn, "result.html", voters: voters)
  end

  def result2(conn, %{"voter"=> params}) do
    voters = Voting.list_voters_address(params)
    render(conn, "result2.html", voters: voters)
  end
end
