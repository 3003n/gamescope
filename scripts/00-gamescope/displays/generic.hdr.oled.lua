local panel_id = "generic_fhd_oled"
local panel_name = "7in FHD OLED Panel"

local panel_models = {
  { vendor = "YHB", model = "YHB02P25" },
}

local panel_hdr = {
   supported = true,
   force_enabled = true,
   eotf = gamescope.eotf.ST2084,
   max_content_light_level = 700,
   max_frame_average_luminance = 400,
   min_content_light_level = 0.005
}


gamescope.config.known_displays[panel_id] = {
  pretty_name = panel_name,

  hdr = (panel_hdr ~= nil) and panel_hdr,

  matches = function(display)
    for i, panel in ipairs(panel_models) do
      if panel.vendor == display.vendor and panel.model == display.model then
        debug("["..panel_id.."] Matched vendor: "..display.vendor.." model: "..display.model)
        return 4000
      end
    end

    return -1
  end
}