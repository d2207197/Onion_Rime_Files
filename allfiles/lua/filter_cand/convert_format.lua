--- 如同  comment_format

local function convert_format(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30) -- patern  支援utf8
  local config_list = ConfigList()
  format_set = {p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30}
  for i ,v in next, format_set do
    config_list:append(ConfigValue(v).element)
  end
  local proj = Projection()
  return proj:load(config_list) and proj or nil  -- load ok return proj  ng return nil
end

return convert_format