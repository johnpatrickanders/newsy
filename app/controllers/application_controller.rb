class ApplicationController < ActionController::Base
  # make available to all child controllers
  include SessionsHelper
end
