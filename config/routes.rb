# frozen_string_literal: true

Rails.application.routes.draw do
  root "pushes#new"

  resources :pushes, only: [:new, :create, :show]

  # Health check endpoint that returns a simple 200 OK response
  get "/up" => proc { |env|
    [200, {"Content-Type" => "text/html"}, ["OK"]]
  }

  post "/csp-violation-report", to: "csp_reports#create"
end
