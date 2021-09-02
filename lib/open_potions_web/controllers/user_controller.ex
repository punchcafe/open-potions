defmodule OpenPotionsWeb.UserController do
    use OpenPotionsWeb, :controller
    use OpenPotions.GetUserBase

    def get_users(id) do
        %OpenPotions.GetUserBase.User{id: "hello!"}
    end
end