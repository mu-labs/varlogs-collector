import Tirexs.Bulk
import Logger

defmodule EventWorker do
  def perform(events) do
    info "Event dequeued #{inspect(events)}"
    payload = bulk([ index: "events", type: "logs"]) do
      index Enum.map(events, &(Map.to_list(&1))) 
    end

    { :ok, _, res } = Tirexs.bump(payload)._bulk()
    info inspect(res)
  end
end
