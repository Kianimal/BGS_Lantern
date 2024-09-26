--       ___          ___          ___
--      /\  \        /\  \        /\  \
--     /::\  \      /::\  \      /::\  \
--    /:/\:\  \    /:/\:\  \    /:/\ \  \
--   /::\~\:\__\  /:/  \:\  \  _\:\~\ \  \
--  /:/\:\ \:|__|/:/__/_\:\__\/\ \:\ \ \__\
--  \:\~\:\/:/  /\:\  /\ \/__/\:\ \:\ \/__/
--   \:\ \::/  /  \:\ \:\__\   \:\ \:\__\
--    \:\/:/  /    \:\/:/  /    \:\/:/  /
--     \::/__/      \::/  /      \::/  /
--      ‾‾           \/__/        \/__/

-- BGS_Lantern
-- Author: Snapopotamus
-- © 2024
-- A lantern modding system for RedM servers.

---------------------------------------------------------------------------------------------

Config = {}

Config.Lanterns = {
  `WEAPON_MELEE_LANTERN`,
  `WEAPON_MELEE_LANTERN_HALLOWEEN`,
  `WEAPON_MELEE_LANTERN_ELECTRIC`,  -- Don't believe this can actually be used as a lantern, but it's here for completion
  `WEAPON_MELEE_DAVY_LANTERN`,
}

-- Whether or not to use color options in the menu. If false, the light will be it's default color. If true, it can be changed to any color via slider menu.
Config.UseColorMode = true
-- Whether or not to use brightness in the light. If false, the light will be default brightness. If true, it can be changed up to the max value via slider menu.
Config.UseBrightness = true
-- The maximum brightness of the light. Default is 1.0
Config.MaxBrightness = 10.0
-- Whether or not to use the metal detector as a lantern. If set to true, the metal detector will have a configurable brightness and color, same as other lanterns.
Config.UseMetalDetectorAsLantern = true

-- Prompt keybinds (only one, default is space bar or square/x button on controller). Only appears when player is holding a lantern.
Config.Keys = {
  LanternMenu = "INPUT_RELOAD"
}

-- Prompt language options
Config.Language = {
  PromptLabel = "Lantern",
  LanternMenuPromptText = "Lantern Options",
}