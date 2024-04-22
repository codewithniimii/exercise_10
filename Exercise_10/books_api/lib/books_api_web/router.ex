deps/phoenix/lib/phoenix/router.ex
            ArgumentError ->
              raise MalformedURIError, "malformed URI path: #{inspect conn.request_path}"
          end
        case __match_route__(method, decoded, host) do
          :error -> raise NoRouteError, conn: conn, router: __MODULE__
          match -> Phoenix.Router.__call__(conn, match)
        end
      end
      defoverridable [init: 1, call: 2]
