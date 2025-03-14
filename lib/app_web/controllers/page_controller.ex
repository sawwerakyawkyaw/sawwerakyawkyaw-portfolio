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

  def webdev(conn, _params) do
    render(conn, :webdev, layout: false)
  end

  def learning(conn, _params) do
    render(conn, :learning, layout: false)
  end

  def art(conn, _params) do
    render(conn, :art, layout: false)
  end

  def leadership(conn, _params) do
    render(conn, :leadership, layout: false)
  end
end
