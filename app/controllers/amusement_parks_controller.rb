class AmusementParksController < ApplicationController

  def show
    @main_park = AmusementPark.first
    @rides = @main_park.rides.open_rides
    @average_thrill = @main_park.rides.average_thrill
  end
end
