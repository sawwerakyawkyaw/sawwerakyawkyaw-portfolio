defmodule AppWeb.Components.UI.Navbar do
  use Phoenix.Component

  use Phoenix.VerifiedRoutes,
    endpoint: AppWeb.Endpoint,
    router: AppWeb.Router,
    statics: AppWeb.static_paths()

  alias Phoenix.LiveView.JS

  @doc """
  Renders a navbar.

  ## Examples
    <.navbar/>
  """

  def navbar(assigns) do
    ~H"""
    <nav></nav>
    """
  end
end
