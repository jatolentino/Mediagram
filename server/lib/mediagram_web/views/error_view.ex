defmodule MediagramWeb.ErrorView do
  use Phoenix.View,
    root: "server/lib/mediagram_web/templates",
    namespace: MediagramWeb

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
