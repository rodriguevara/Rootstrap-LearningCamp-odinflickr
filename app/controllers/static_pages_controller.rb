class StaticPagesController < ApplicationController
    require 'flickr'
    def index
        flickr = Flickr.new Rails.application.credentials.dig(:flickr, :api_key), Rails.application.credentials.dig(:flickr, :secret_key)
        if params[:user_id]
          begin
            unless params[:user_id].empty?
              @photos = flickr.photos.search(user_id: params[:user_id], per_page: 15)
            end
          rescue Flickr::FailedResponse
            flash.now[:alert] = "User doesn't exist"
            @photos = nil
          end
    
        end
    end
end
