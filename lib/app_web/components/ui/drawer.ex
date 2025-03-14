defmodule AppWeb.Components.UI.Drawer do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  slot :inner_block, required: true

  def drawer(assigns) do
    ~H"""
    <!-- drawer init and show -->
    <button
      class="no-underline font-semibold relative cursor-pointer border border-[#D4D4D4] dark:border-white flex rounded-[10px] p-4 m-2 dark:text-gray-100 hover:bg-gray-200 hover:text-gray-900 dark:hover:bg-white dark:hover:text-black transition-all duration-300 ease-in-out transform hover:scale-105"
      phx-click={show()}
    >
      Contact Me
    </button>

    <!-- drawer component -->
    <div
      id="drawer-contact"
      class="fixed top-0 left-0 z-40 h-screen p-4 overflow-y-auto transition-transform -translate-x-full bg-white w-80 dark:bg-gray-800"
      tabindex="-1"
      aria-labelledby="drawer-contact-label"
    >
      <h5
        id="drawer-label"
        class="inline-flex items-center mb-6 text-base font-semibold text-gray-500 uppercase dark:text-gray-400"
      >
        <svg
          class="w-4 h-4 me-2.5"
          aria-hidden="true"
          xmlns="http://www.w3.org/2000/svg"
          fill="currentColor"
          viewBox="0 0 20 16"
        >
    <path d="m10.036 8.278 9.258-7.79A1.979 1.979 0 0 0 18 0H2A1.987 1.987 0 0 0 .641.541l9.395 7.737Z" />
    <path d="M11.241 9.817c-.36.275-.801.425-1.255.427-.428 0-.845-.138-1.187-.395L0 2.6V14a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V2.5l-8.759 7.317Z" />
    </svg>Contact Me
      </h5>
      <button
        type="button"
        phx-click={hide()}
        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 absolute top-2.5 end-2.5 inline-flex items-center justify-center dark:hover:bg-gray-600 dark:hover:text-white"
      >
        <svg
          class="w-3 h-3"
          aria-hidden="true"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 14 14"
        >
          <path
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"
          />
        </svg>
        <span class="sr-only">Close menu</span>
      </button>

      {render_slot(@inner_block)}
    </div>
    """
  end

  def show(js \\ %JS{}) do
    js
    |> JS.show(to: "#drawer-contact")
    |> JS.remove_class("-translate-x-full", to: "#drawer-contact")
    |> JS.add_class("transform-none", to: "#drawer-contact")
  end

  def hide(js \\ %JS{}) do
    js
    |> JS.hide(
      to: "#drawer-contact",
      transition: {"transition-transform duration-300", "-translate-x-full", "transform-none"}
    )
  end
end
