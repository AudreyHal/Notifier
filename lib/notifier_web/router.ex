defmodule NotifierWeb.Router do
  use NotifierWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :frontend do
    plug NotifierWeb.Plugs.LoadUser
  end

  scope "/", NotifierWeb do
    pipe_through [:browser, :frontend]

    get "/", PageController, :index
<<<<<<< HEAD
    # resources "/users", UserController
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
   
=======
    resources "/memo", MemoController
>>>>>>> e9d61e31f4699e6161ae786cf1b1e3e3d85618ba
  end

  scope "/", NotifierWeb do
    pipe_through [:browser, :frontend, NotifierWeb.Plugs.AuthenticateUser]

  end

  # scope "/admin", NotifierWeb.Admin, as: :admin do
  #   pipe_through [:browser, :adminend]

  #   resources "/admins", AdminController
  #   get "/register", RegistrationController, :new
  #   post "/register", RegistrationController, :create
  #   get "/login", SessionController, :new
  #   post "/login", SessionController, :create
  #   get "/logout", SessionController, :delete
  # end

  # Other scopes may use custom stacks.
  # scope "/api", NotifierWeb do
  #   pipe_through :api
  # end
end
