defmodule Typepad.Pad do
  def get_new_id do
    :crypto.strong_rand_bytes(6)
      |> Base.encode16
      |> String.slice(0,6)
  end
end
