class StaticPagesController < ApplicationController
    def home

    end

    def search
        user_id = params[:user_id]

        flickr = Flickr.new(ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET'])

        # Call the appropriate Flickr API method to get the user's photos
        photos = flickr.people.getPublicPhotos(user_id: user_id, per_page: 3)

        # Extract the necessary information from the photos and assign it to an instance variable
        @photo_urls = photos['photo'].map { |photo| generate_photo_url(photo) }
    end

    private
    def generate_photo_url(photo)
        farm = photo['farm']
        server = photo['server']
        id = photo['id']
        secret = photo['secret']
    
        "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg"
    end


end
