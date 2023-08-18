require 'hue'
require_relative 'animation'
require_relative 'sequences'

module Animations
  class HighlightTriangle < Animation
    def run
      hue = rand(Hue::Light::HUE_RANGE)

      lights.each do |light|
        light.on!
        light.set_state({:saturation => 0, :hue => hue, brightness:0}, 20)
      end

      sleep 3

      Sequences::THE_TRIANGLE.each do |pixel_id|
        light = pixel(pixel_id)

        light.set_state({:hue => 45280, :saturation => 255})
      end

      sleep 3

      Sequences::OUTSIDE_THE_TRIANGLE.shuffle.each do |pixel_id|
        light = pixel(pixel_id)
        light.set_state({:saturation => 255}, 25)
      end

      3.times do

        sleep 4

        hue = rand(Hue::Light::HUE_RANGE)

        Sequences::OUTSIDE_THE_TRIANGLE.shuffle.each do |pixel_id|
         light = pixel(pixel_id)
         light.set_state({:hue => hue}, 25)
        end
      end

      sleep 4

      Sequences::OUTSIDE_THE_TRIANGLE.shuffle.each do |pixel_id|
        light = pixel(pixel_id)
        light.set_state({:saturation => 0}, 25)
      end

      sleep 4
    end

  end
end
