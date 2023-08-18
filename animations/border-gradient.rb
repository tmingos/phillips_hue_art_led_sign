require 'hue'
require_relative 'animation'
require_relative 'sequences'

module Animations
  class BorderGradient < Animation

    def run
      clear_display

      hue_start = Hue::Light::HUE_RANGE.max
      hue_end = Hue::Light::HUE_RANGE.min

      Sequences::BORDER.each_with_index do |pixel_id, index|
        hue =  (index + 1) * (hue_end - hue_start) / Sequences::BORDER.count + hue_start
        light = pixel(pixel_id)
        light.on!
        light.set_state({:saturation => 255, :hue => hue})
      end

      sleep 5

      Sequences::BORDER.each_with_index do |pixel_id, index|
        light = pixel(pixel_id)
        light.off!
      end

    end
  end
end
