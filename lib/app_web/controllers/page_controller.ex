defmodule AppWeb.PageController do
  use AppWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def aboutme(conn, _params) do
    render(conn, :aboutme, layout: false)
  end

  def resume(conn, _params) do
    render(conn, :resume, layout: false)
  end
end
