Rails.application.routes.draw do
  mount API::Base, at: "/"
end
