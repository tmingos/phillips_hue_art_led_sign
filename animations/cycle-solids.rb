require 'hue'
require_relative 'animation'

module Animations
  class CycleSolids < Animation
    def run
      4.times do
        hue = rand(Hue::Light::HUE_RANGE)
        lights.each do |light|
          light.on!
          light.set_state({:saturation => 255, :hue => hue}, 20)
        end
        sleep 5
      end
    end
  end
end
