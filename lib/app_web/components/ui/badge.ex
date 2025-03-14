defmodule AppWeb.Components.UI.Badge do
  use Phoenix.Component

  @doc """
  Renders a button.

  ## Examples

      <.button>Send!</.button>
      <.button phx-click="go" class="ml-2">Send!</.button>
  """
  attr :color, :string,
    default: "default",
    values: ~w(default dark red green yellow indigo purple pink)

  attr :type, :string, default: "badge"
  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(disabled form name value)

  slot :inner_block, required: true

  def badge(assigns) do
    ~H"""
    <badge
      type={@type}
      class={[
        "flex items-center p-2 rounded-lg text-gray-900 dark:text-gray-100",
        @color == "default" &&
          "bg-blue-100 dark:bg-blue-800 text-blue-800 text-[1rem]",
        @color == "dark" &&
          "bg-gray-100 dark:bg-gray-800 text-gray-800 text-[1rem]",
        @color == "red" &&
          "bg-red-100 dark:bg-red-800 text-red-800 text-[1rem]",
        @color == "green" &&
          "bg-green-100 dark:bg-green-800 text-green-800 text-[1rem]",
        @color == "yellow" &&
          "bg-yellow-100 dark:bg-yellow-800 text-yellow-800 text-[1rem]",
        @color == "indigo" &&
          "bg-indigo-100 dark:bg-indigo-800 text-indigo-800 text-[1rem]",
        @color == "purple" &&
          "bg-purple-100 dark:bg-purple-800 text-purple-800 text-[1rem]",
        @color == "pink" &&
          "bg-pink-100 dark:bg-pink-800 text-pink-800 text-[1rem]",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </badge>
    """
  end
end
