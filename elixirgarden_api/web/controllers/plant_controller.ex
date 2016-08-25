defmodule ElixirgardenApi.PlantController do
  use ElixirgardenApi.Web, :controller

  alias ElixirgardenApi.Node

  def index(conn, _params) do
    all_plants = Node |> Node.all_plants |> Repo.all
    # plants = Node |> Node.singleMostRecent |> Repo.all
    outputNodes = Node |> Node.singleMostRecent |> Node.outputNodes
    digitalOutputNodes = outputNodes |> Node.digitalNodes |> Repo.all
    analogOutputNodes = outputNodes |> Node.analogNodes |> Repo.all
    inputNodes = Node |> Node.singleMostRecent |> Node.inputNodes |> Repo.all
    render(conn, :index, digitalOutputNodes: digitalOutputNodes, analogOutputNodes: analogOutputNodes, inputNodes: inputNodes, all_plants: all_plants)
  end

end
  
