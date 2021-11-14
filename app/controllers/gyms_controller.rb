require "uri"
require 'open-uri'

require "net/http"

class GymsController < ApplicationController
  def index
    location = params[:location]
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    if location.present?
      # get gyms found near location
      @location = location
      coord = query_to_coord(@location)
      google_gyms_array = scan_gyms_by_coord(coord[:lat], coord[:lng])
      @gyms = convert_to_gyms_array(google_gyms_array)
    else
      # default to scanning current location
      google_gyms_array = scan_gyms_by_coord(@latitude, @longitude)
      @gyms = convert_to_gyms_array(google_gyms_array)
    end
  end

  def favorites
    # @gyms = Gym.where(favorite: true)
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new

    @gym = Gym.new
  end

  def create
    raise
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    if @gym.update(gym_params)
      redirect_to gym_path(@gym)
    else
      render :edit
    end
  end

  private

  def gym_params
    
    params.require(:gym).permit(:name, :equipment_ids => [])
  end

  # get single set coordinates based on user location query
  def query_to_coord(location)
    api_key = ENV['GOOGLE_MAP_API']
    single_url = URI("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{location}&inputtype=textquery&fields=formatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry&key=#{api_key}")
    single_serialized = URI.open(single_url).read
    single_results = JSON.parse(single_serialized)
    lat = single_results.first[1][0]['geometry']['location']['lat']
    lng = single_results.first[1][0]['geometry']['location']['lng']
    return { lat: lat, lng: lng }
  end

  def scan_gyms_by_coord(lat, lng)
    # get list of gyms based on the found coordinates
    api_key = ENV['GOOGLE_MAP_API']
    keyword = 'anytime fitness'
    places_url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat}%2C#{lng}&radius=1000&type=gym&keyword=#{keyword}&key=#{api_key}")
    places_serialized = URI.open(places_url).read
    places_results = JSON.parse(places_serialized)

    # return array of gyms found, if any
    return places_results['results']
  end

  def convert_to_gyms_array(google_array)
    gyms_array = []
    google_array.each do |google_gym|
      existing = Gym.find_by(google_place_id: google_gym['place_id'])
      if existing.present?
        #TODO: update existing with latest values when necessary
        gyms_array << existing
      else
        # new game, save to database
        gyms_array << Gym.create!(
          name: google_gym['name'],
          vicinity: google_gym['vicinity'],
          location_lat: google_gym['geometry']['location']['lat'],
          location_lng: google_gym['geometry']['location']['lng'],
          rating: google_gym['rating'],
          user_ratings_total: google_gym['user_ratings_total'],
          business_status: google_gym['business_status'],
          google_place_id: google_gym['place_id']
        )
      end
    end
    return gyms_array
  end
end
