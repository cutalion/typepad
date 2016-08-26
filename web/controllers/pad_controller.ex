defmodule Typepad.PadController do
  use Typepad.Web, :controller
  alias Typepad.Pad

  def new(conn, _params) do
    id = Pad.get_new_id
    redirect conn, to: pad_path(conn, :show, id)
  end

  def show(conn, %{"id" => id}) do
    render conn, :show, id: id
  end
end
