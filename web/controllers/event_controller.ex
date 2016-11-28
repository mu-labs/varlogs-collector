import Tirexs.HTTP
import Logger

defmodule Collector.EventController do
  use Collector.Web, :controller

  def index(conn, _) do
    { :ok, _, res } = get("/events/trace/_search")
    %{ hits: %{ hits: hits } } = res
    json conn, Enum.map(hits, &(&1[:"_source"]))
  end

  def create(conn, _params) do
    {:ok, ack} = Exq.Enqueuer.enqueue(Exq.Enqueuer, "default", EventWorker, [_params["events"]])
    info "Envent enqueued"
    conn
    |> put_status(:no_content)
    |> json %{}
  end

end
