require 'hue'
require_relative 'animation'
require_relative 'sequences'

module Animations
  class Rain < Animation

    def run
      hue = rand(Hue::Light::HUE_RANGE.max) # light blue

      diagonals = Sequences::RAIN_TIMING

      current_index = Hash.new(0)
      waited = Hash.new(0)

      action = Hash.new('wait')

      lights.each do |light|
        light.on!
        light.set_state({hue: hue, brightness: 0, saturation: 255})
      end

      250.times do

        diagonals.each_with_index do |pixels, diagonal_index|

          if action[diagonal_index] != 'wait'
            # find current pixel
            pixel_id = pixels[current_index[diagonal_index]]

            # light up or turn off next pixel
            if pixel_id != -1
              light = pixel(pixel_id)

              if action[diagonal_index] == 'turn-on'
                light.set_state({brightness: 150})
              else
                light.set_state({brightness: 0})
              end
            end

            # increment pixel index
            current_index[diagonal_index] = current_index[diagonal_index] + 1

            # if overflow, revert index to zero and toggle action
            if current_index[diagonal_index] >= diagonals[diagonal_index].size
              current_index[diagonal_index] = 0
              if action[diagonal_index] == 'turn-on'
                action[diagonal_index] = 'turn-off'
              else
                action[diagonal_index] = 'wait'
              end
            end
          else
            waited[diagonal_index] = waited[diagonal_index] + 1
            if waited[diagonal_index] >= rand(200)
              action[diagonal_index] = 'turn-on'
              waited[diagonal_index] = 0
            end
          end

        end

        sleep 0.1

      end

       # clear diagonally right to left
      Sequences::LTR_DIAGONALS.reverse.each_with_index do |diagonal_lights|
        diagonal_lights.each do |pixel_id|
          light = pixel(pixel_id)
          light.set_state({brightness: 0})
          light.off!
        end
      end

    end

  end
end
