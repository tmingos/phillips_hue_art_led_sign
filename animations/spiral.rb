require 'hue'
require_relative 'animation'
require_relative 'sequences'

module Animations
  class Spiral < Animation

    def run

      3.times do
        hue = rand(Hue::Light::HUE_RANGE)

        Sequences::SPIRAL.each_with_index do |pixel_id, index|
          saturation = Hue::Light::SATURATION_RANGE.max - (Hue::Light::SATURATION_RANGE.count / Sequences::SPIRAL.length) * index
          light = pixel(pixel_id)
          light.on!
          light.set_state({:saturation => saturation, :hue => hue})
        end

        sleep 5

        Sequences::SPIRAL.each do |pixel_id|
          light = pixel(pixel_id)
          light.off!
        end
      end
    end
  end
end
