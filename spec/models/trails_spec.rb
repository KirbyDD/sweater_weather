require 'rails_helper'

RSpec.describe Trail do
  it 'should have attributes' do
    trail_obj = {:id=>7011192,
     :name=>"Boulder Skyline Traverse",
     :type=>"Hike",
     :summary=>"The classic long mountain route in Boulder.",
     :difficulty=>"black",
     :stars=>4.7,
     :starVotes=>80,
     :location=>"Superior, Colorado",
     :url=>"https://www.hikingproject.com/trail/7011192/boulder-skyline-traverse",
     :imgSqSmall=>"https://cdn2.apstatic.com/photos/hike/7048859_sqsmall_1555540136.jpg",
     :imgSmall=>"https://cdn2.apstatic.com/photos/hike/7048859_small_1555540136.jpg",
     :imgSmallMed=>"https://cdn2.apstatic.com/photos/hike/7048859_smallMed_1555540136.jpg",
     :imgMedium=>"https://cdn2.apstatic.com/photos/hike/7048859_medium_1555540136.jpg",
     :length=>16.3,
     :ascent=>5409,
     :descent=>-5492,
     :high=>8492,
     :low=>5417,
     :longitude=>-105.2582,
     :latitude=>39.9388,
     :conditionStatus=>"All Clear",
     :conditionDetails=>"Dry",
     :conditionDate=>"2020-06-02 07:52:08"
    }
    trail = Trail.new(trail_obj, "denver,co")

    expect(trail.name).to eq('Boulder Skyline Traverse')
    expect(trail.difficulty).to eq('black')
    expect(trail.summary).to eq('The classic long mountain route in Boulder.')
    expect(trail.location).to eq('Superior, Colorado')
  end
end
