require_relative 'animation'

module Animations
  class WhiteSparkle < Animation
    def run
      # setup
      lights.shuffle.each do |light|
        light.on!
        light.set_state(saturation: 0)
        light.set_state(hue: 0)
        light.set_state(saturation: 0) # just to make sure
        light.set_state(saturation: 0) # just to make sure
      end

      # sparkle
      5.times do
        lights.shuffle.each do |light|
          light.on!
          light.set_state({:brightness => 255})
          light.set_state({:brightness => 0})
        end
      end

      # reset saturation, brightness
      lights.shuffle.each do |light|
        light.on!
        light.set_state(saturation: 255, brightness: 0)
      end

      sleep 5

    end
  end
end
