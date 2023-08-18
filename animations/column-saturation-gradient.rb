require 'hue'
require_relative 'animation'
require_relative 'sequences'

module Animations
  class ColumnSaturationGradient < Animation
    def run
      9.times do
        hue = rand(Hue::Light::HUE_RANGE)
        Sequences::COLUMNS.each_with_index do |column_pixels, index|
          sat =  (index + 1) * (Hue::Light::SATURATION_RANGE.max / Sequences::COLUMNS.count)
          column_pixels.each do |pixel_id|
            light = pixel(pixel_id)
            light.on!
            light.set_state({:saturation => sat, :hue => hue})
          end
        end
        sleep 0.5
      end

      sleep 3
    end

  end
end
