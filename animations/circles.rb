require 'hue'
require_relative 'animation'
require_relative 'sequences'

module Animations
  class Circles < Animation
    def run
      clear_display

      hue = rand(Hue::Light::HUE_RANGE)

      # light first light
      light = pixel(Sequences::CIRCLES.first)
      light.on!
      light.set_state({:hue => hue})

      sleep 0.1

      # chase lights
      Sequences::CIRCLES.each_cons(2) do |pixels|
        if pixels[0] != -1
          # turn off previous light
          light = pixel(pixels[0])
          light.off!
        end

        if pixels[1] != -1
          # turn on next light
          light = pixel(pixels[1])
          light.on!
          light.set_state({:hue => hue})
        end

        sleep 0.1
      end

      # turn off last light
      light = pixel(Sequences::CIRCLES.last)
      light.off!

    end
  end
end
