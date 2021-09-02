defmodule OpenPotions.GetUserBase.User do
    defstruct id: "nil", name: "nil"
end

defmodule OpenPotions.GetUserBase do

    @callback get_user(String.t()) :: any() | {:error, integer(), String.t()} | {:forward}
    @callback get_user(Plug.Conn.t(), String.t()) :: any() | {:error, integer(), String.t()} | {:forward}

    #is this a useful enough abstraction at this point, or should it go directly through a plug instead?
    defmacro __using__(opts) do
        quote do
            @behaviour OpenPotions.GetUserBase

            alias Plug.Conn

            def get_users(id), do: raise "unimplemented"
            def get_users(%Conn{}, id), do: get_users(id)

            defoverridable(get_users: 1, get_users: 2)

            def _raw_get_users_handler(%Plug.Conn{} = conn, _params) do
                fetched_conn = Conn.fetch_query_params(conn)
                id = fetched_conn.query_params["id"]
                body = get_users(conn, id)
                Conn.resp(conn, 200, inspect(body))
            end
        end
    end
end