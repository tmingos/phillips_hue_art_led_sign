require 'hue'
require_relative 'animation'
require_relative 'sequences'

module Animations
  class BouncingBall < Animation

    def run
      clear_display

      sleep 1

      hue = rand(Hue::Light::HUE_RANGE)

      # light first light
      light = pixel(Sequences::BOUNCING_BALL.first)
      light.on!
      light.set_state({:hue => hue})

      sleep 0.1

      # chase lights
      Sequences::BOUNCING_BALL.each_cons(2) do |pixels|

        # turn off previous light
        light = pixel(pixels[0])
        light.off!

        # turn on next light
        light = pixel(pixels[1])
        light.on!
        light.set_state({:hue => hue})

        sleep 0.1
      end

      # turn off last light
      light = pixel(Sequences::BOUNCING_BALL.last)
      light.off!

    end
  end
end
