class ListController < ApplicationController
    def index
        unless helpers.logged_in?
            redirect_to '/login', flash: {"notice": "Please Log in to continue."}
        end
    end
end
