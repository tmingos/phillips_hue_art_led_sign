require 'hue'
require_relative 'animation'

module Animations
  class LeftToRightByLine < Animation
    def run
      clear_display

      hue = rand(Hue::Light::HUE_RANGE)
      sat = rand(Hue::Light::SATURATION_RANGE)
      (0..28).each do |pixel_id|
        light = pixel(pixel_id)
        light.on!
        light.set_state({:saturation => sat, :hue => hue})
      end

      sleep 3
    end

  end
end
