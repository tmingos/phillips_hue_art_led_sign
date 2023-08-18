
#  Pixel Ids
#
#                     0    1     2    3    4    5    6
#             7    8    9     10   11  (12)  13   14   15
#     16   17   18   19    20    21  (22) (23)  24   25
#                                  26   27   28

module Config

  def bulb(pixel_number)
    bulb_ids = Hash.new
    bulb_ids[0]  = 1
    bulb_ids[1]  = 21
    bulb_ids[2]  = 28
    bulb_ids[3]  = 5
    bulb_ids[4]  = 7
    bulb_ids[5]  = 10
    bulb_ids[6]  = 6
    bulb_ids[7]  = 9
    bulb_ids[8]  = 27
    bulb_ids[9]  = 24
    bulb_ids[10] = 13
    bulb_ids[11] = 2
    bulb_ids[12] = 29
    bulb_ids[13] = 25
    bulb_ids[14] = 18
    bulb_ids[15] = 20
    bulb_ids[16] = 23
    bulb_ids[17] = 26
    bulb_ids[18] = 22
    bulb_ids[19] = 11
    bulb_ids[20] = 3
    bulb_ids[21] = 12
    bulb_ids[22] = 8
    bulb_ids[23] = 16
    bulb_ids[24] = 19
    bulb_ids[25] = 14
    bulb_ids[26] = 15
    bulb_ids[27] = 17
    bulb_ids[28] = 4
    bulb_ids[pixel_number]
  end

end