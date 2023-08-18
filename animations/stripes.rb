require 'hue'
require_relative 'animation'
require_relative 'sequences'

module Animations
  class Stripes < Animation
    def run
      clear_display

      hue = 45280 #blue

      Sequences::DIAGONALS.each_with_index do |diagonal_lights, index|
        if index.even?
          diagonal_lights.each do |pixel_id|
            light = pixel(pixel_id)
            light.on!
            light.set_state({:saturation => 255, :hue => hue})
          end
        end
        sleep 0.1
      end

      sleep 1

      Sequences::DIAGONALS.each_with_index do |diagonal_lights, index|
        if index.odd?
          diagonal_lights.each do |pixel_id|
            light = pixel(pixel_id)
            light.on!
            light.set_state({:saturation => 150, :hue => hue})
          end
        end
        sleep 0.1
      end

      sleep 3

      # clear diagonally in reverse
      Sequences::DIAGONALS.reverse.each_with_index do |diagonal_lights, index|
        diagonal_lights.each do |pixel_id|
          light = pixel(pixel_id)
          light.set_state({:saturation => 255, :brightness => 0})
          light.off!
        end
        sleep 0.1
      end
    end
  end
end
