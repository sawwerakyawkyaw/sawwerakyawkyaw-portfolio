defmodule AppWeb.Components.UI.Modal do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  @doc """
  Renders a Flowbite [Modal](https://flowbite.com/docs/components/modal).

  ## Examples

      <.modal heading="Great Modal" backdrop="static" small>
        This is my fantastic modal.
      </.modal>
  """

  attr :backdrop, :string,
    default: "dynamic",
    values: ~w(dynamic static),
    doc: "Choose between static or dynamic to prevent closing the modal when clicking outside."

  attr :heading, :string, required: true, doc: "Will be displayed left to the close button."

  attr :small, :boolean,
    default: false,
    doc:
      "If true, restricts the width of the modal according to the small modal variant in the Flowbite library. Will use default to the large modal variant otherwise"

  slot :inner_block, required: true

  def modal(assigns) do
    ~H"""
    <!-- Modal toggle -->
    <button
      phx-click={open_modal()}
      data-modal-target="static-modal"
      data-modal-toggle="static-modal"
      class="no-underline font-semibold relative cursor-pointer border border-[#D4D4D4] dark:border-white flex rounded-[10px] p-4 m-2 dark:text-gray-100 hover:bg-gray-200 hover:text-gray-900 dark:hover:bg-white dark:hover:text-black transition-all duration-300 ease-in-out transform hover:scale-105"
    >
      Toggle modal
    </button>

    <!-- Main modal -->
    <div
      phx-click-away={close_modal()}
      id="static-modal"
      data-modal-backdrop="static"
      tabindex="-1"
      aria-hidden="true"
      class="fixed inset-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto h-[calc(100%-1rem)] max-h-full flex items-center justify-center"
    >
      <div
        phx-click-away={if @backdrop == "static", do: nil, else: close_modal()}
        class={[
          "relative w-full max-h-full",
          @small && "max-w-sm ",
          !@small && "max-w-lg"
        ]}
      >
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow-sm dark:bg-gray-700">
          <!-- Modal header -->
          <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600 border-gray-200">
            <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
              {@heading}
            </h3>
            <button
              phx-click={close_modal()}
              type="button"
              class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
              data-modal-hide="static-modal"
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
              <span class="sr-only">Close modal</span>
            </button>
          </div>
          <!-- Modal body -->
          <div class="p-4 md:p-5 space-y-4">
            <p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
              With less than a month to go before the European Union enacts new consumer privacy laws for its citizens, companies around the world are updating their terms of service agreements to comply.
            </p>
            <p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
              The European Union’s General Data Protection Regulation (G.D.P.R.) goes into effect on May 25 and is meant to ensure a common set of data rights in the European Union. It requires organizations to notify users as soon as possible of high-risk data breaches that could personally affect them.
            </p>
          </div>
          <!-- Modal footer -->
          <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
            <button
              phx-click={close_modal()}
              data-modal-hide="static-modal"
              type="button"
              class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
            >
              I accept
            </button>
            <button
              phx-click={close_modal()}
              data-modal-hide="static-modal"
              type="button"
              class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700"
            >
              Decline
            </button>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def open_modal do
    %JS{}
    |> JS.toggle_class("hidden", to: "#static-modal")
    |> JS.toggle_attribute({"aria-expanded", "true", "false"}, to: "#static-modal")
  end

  def close_modal do
    %JS{}
    |> JS.toggle_class("hidden", to: "#static-modal")
    |> JS.toggle_attribute({"aria-expanded", "true", "false"}, to: "#static-modal")
  end
end
