import Tirexs.Bulk
import Logger

defmodule EventWorker do
  def perform(events) do
    info "Event dequeued #{inspect(events)}"

    payload = bulk do
      Enum.flat_map(events, fn event ->
        index [index: "events", type: event["schema"]], [Map.to_list(event)]
      end)
    end

    res = Tirexs.bump(payload)._bulk()
    info inspect(res)
  end
end
