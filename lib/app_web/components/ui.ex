defmodule AppWeb.Components.UI do
  defmacro __using__(_opts) do
    quote do
      import AppWeb.Components.UI.{
        Navbar,
        Badge,
        Drawer,
        Modal
      }
    end
  end
end
