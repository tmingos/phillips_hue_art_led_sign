require 'hue'
require_relative 'animation'
require_relative 'sequences'

module Animations
  class Rainbow < Animation
    def run
      clear_display

      Sequences::DIAGONALS.each_with_index do |diagonal_lights, index|
        hue =  index * (Hue::Light::HUE_RANGE.max / 9)
        diagonal_lights.each do |pixel_id|
          light = pixel(pixel_id)
          light.on!
          light.set_state({:saturation => 255, :hue => hue})
        end
        sleep 0.1
      end

      sleep 6

      Sequences::DIAGONALS.each_with_index do |diagonal_lights, index|
        hue =  index * (Hue::Light::HUE_RANGE.max / 9)
        diagonal_lights.each do |pixel_id|
          light = pixel(pixel_id)
          light.on!
          light.set_state({:brightness => 80})
        end
        sleep 0.1
      end

      sleep 2

      # clear diagonally in reverse
      Sequences::DIAGONALS.reverse.each do |diagonal_lights|
        diagonal_lights.each do |pixel_id|
          light = pixel(pixel_id)
          light.set_state({:brightness => 0})
          light.off!
        end
        sleep 0.1
      end
    end
  end
end
