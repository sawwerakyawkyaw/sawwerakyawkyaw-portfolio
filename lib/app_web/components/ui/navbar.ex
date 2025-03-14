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
    <nav class="max-w-[850px] mx-auto">
      <div class="flex flex-wrap items-center justify-between mx-auto">
        <.link href={~p"/"} class="flex items-center p-4 space-x-3 rtl:space-x-reverse">
          <img src={~p"/images/wera-logo.svg"} class="h-18 dark:text-white" alt="wera Logo" />
        </.link>
        <button
          id="menu-button"
          type="button"
          class="inline-flex items-center p-4 w-20 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
          aria-controls="menu"
          aria-expanded="false"
          phx-click={toggle_menu()}
        >
          <span class="sr-only">Open main menu</span>
          <svg
            class="w-5 h-5"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 17 14"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M1 1h15M1 7h15M1 13h15"
            />
          </svg>
        </button>
        <div
          class="hidden w-full md:block md:w-auto"
          id="menu"
          phx-click-away={close_menu()}
          phx-click={close_menu()}
        >
          <ul class="font-medium flex flex-col p-4 md:p-0 md:flex-row md:space-x-2 rtl:space-x-reverse md:mt-0">
            <li>
              <.link
                href={~p"/aboutme"}
                class="block py-2 md:py-0 px-3 text-center text-gray-900 rounded-sm hover:bg-colors-office-hover-light md:border-0 md:hover:text-colors-office dark:text-white md:dark:hover:text-colors-office-light dark:hover:bg-colors-office-light dark:hover:text-colors-office-light"
                aria-current="page"
              >
                About
              </.link>
            </li>
            <li>
              <.link
                href={~p"/webdev"}
                class="block py-2 md:py-0 px-3 text-center text-gray-900 rounded-sm hover:bg-colors-studio-hover-light md:border-0 md:hover:text-colors-studio dark:text-white md:dark:hover:text-colors-studio-light dark:hover:bg-colors-studio-light dark:hover:text-colors-studio-light"
              >
                WebDev
              </.link>
            </li>
            <li>
              <.link
                href={~p"/learning"}
                class="block py-2 md:py-0 px-3 text-center text-gray-900 rounded-sm hover:bg-colors-garage-hover-light md:border-0 md:hover:text-colors-garage dark:text-white md:dark:hover:text-colors-garage-light dark:hover:bg-colors-garage-light dark:hover:text-colors-garage-light"
              >
                Learning
              </.link>
            </li>
            <li>
              <.link
                href={~p"/art"}
                class="block py-2 md:py-0 px-3 text-center text-gray-900 rounded-sm hover:bg-colors-shop-hover-light md:border-0 md:hover:text-colors-shop dark:text-white md:dark:hover:text-colors-studio-light dark:hover:bg-colors-shop-light dark:hover:text-colors-shop-light"
              >
                Art
              </.link>
            </li>
            <li>
              <.link
                href={~p"/leadership"}
                class="block py-2 md:py-0 px-3 text-center text-gray-900 rounded-sm hover:bg-colors-office-hover-light md:border-0 md:hover:text-colors-office dark:text-white md:dark:hover:text-colors-office-light dark:hover:bg-colors-office-light dark:hover:text-colors-office-light"
              >
                Leadership
              </.link>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    """
  end

  defp toggle_menu do
    %JS{}
    |> JS.remove_class("hidden", to: "#menu")
    |> JS.set_attribute({"aria-expanded", "true"}, to: "#menu-button")
  end

  defp close_menu do
    %JS{}
    |> JS.add_class("hidden", to: "#menu")
    |> JS.set_attribute({"aria-expanded", "false"}, to: "#menu-button")
  end
end
