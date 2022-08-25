defmodule DootTodoWeb.ErrorView do
  use DootTodoWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end
  def render(template, assigns) do
    _json_error(template, assigns)
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, assigns) do
    _json_error(template, assigns)
  end

  defp _json_error(template, assigns) do
    Logger.info("Error template: #{template}")
    # render("500.html", assigns)

    # I am not sure, but I think you can just return a Map, otherwise just try to use the Jason library.
    %{
      # You need to extract it from assigns or template name
      error: 400,
      maessage: "Whoops!"
    }
  end
end
