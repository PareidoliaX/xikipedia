Rails.application.routes.draw do
  root: 'basics/splash'

  get: :about, to: 'basics/about'
end
