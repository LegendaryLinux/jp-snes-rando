jp = {}

jp.eggs_remaining_address = 0x000E0F
jp.eggs = {
    -- Egg addresses have a u8 value of 0 if collected, 10 otherwise
    fake_trex_egg = 0x0031C0,
    south_hill_egg = 0x0031BE,
    western_mountain_egg = 0x0031C4,
    shock_trap_egg = 0x0031BA,
    deep_jungle_egg = 0x0031BC,
    west_trike_egg = 0x0031B8,
    visitor_center_roof_egg = 0x0031B6,
}

------------------------------------
--    Park Computer Functions     --
------------------------------------
jp.open_gate_1 = function()
    memory.write_u8(0x00024D, 1) -- Gate 1
    memory.write_u8(0x00024F, 0) -- Gate 2
    memory.write_u8(0x000251, 0) -- Gate 3
end

jp.open_gate_2 = function()
    memory.write_u8(0x00024D, 0)
    memory.write_u8(0x00024F, 0)
    memory.write_u8(0x000251, 0)
end

jp.open_gate_3 = function()
    memory.write_u8(0x00024D, 0)
    memory.write_u8(0x00024F, 0)
    memory.write_u8(0x000251, 1)
end

------------------------------------
--        Cheat Functions         --
------------------------------------
jp.grant_ammo = function()
    -- Primary ammo
    memory.write_u16_le(0x00028B, 65535)

    -- Secondary ammo
    memory.write_u16_le(0x000295, 65535)
end

jp.grant_shotgun = function()
    -- Set current primary weapon
    memory.write_u8(0x00028D, 0)

    -- Set current primary ammo
    memory.write_u16_le(0x00028B, 32)

    -- Update graphic for current primary weapon
    memory.write_u8(0x00028F, 49)
    memory.write_u8(0x000290, 44)
    memory.write_u8(0x000291, 54)
    memory.write_u8(0x000292, 44)
    memory.write_u8(0x000293, 37)
end

jp.grant_rockets = function()
    -- Set current primary weapon
    memory.write_u8(0x00028D, 2)

    -- Set current primary ammo
    memory.write_u16_le(0x00028B, 8)

    -- Update graphic for current primary weapon
    memory.write_u8(0x00028F, 50)
    memory.write_u8(0x000290, 40)
    memory.write_u8(0x000291, 55)
    memory.write_u8(0x000292, 40)
    memory.write_u8(0x000293, 38)
end

jp.grant_tranqs = function()
    -- Set current primary weapon
    memory.write_u8(0x00028D, 4)

    -- Set current primary ammo
    memory.write_u16_le(0x00028B, 16)

    -- Update graphic for current primary weapon
    memory.write_u8(0x00028F, 51)
    memory.write_u8(0x000290, 60)
    memory.write_u8(0x000291, 56)
    memory.write_u8(0x000292, 60)
    memory.write_u8(0x000293, 39)
end

jp.grant_bolas = function()
    -- Set current secondary weapon
    memory.write_u8(0x000297, 8)

    -- Set current secondary ammo
    memory.write_u16_le(0x000295, 16)

    -- Update graphic for current secondary weapon
    memory.write_u8(0x000299, 53)
    memory.write_u8(0x00029B, 58)
    memory.write_u8(0x00029D, 40)
end

jp.grant_gas = function()
    -- Set current secondary weapon
    memory.write_u8(0x000297, 6)

    -- Set current secondary ammo
    memory.write_u16_le(0x000295, 16)

    -- Update graphic for current secondary weapon
    memory.write_u8(0x000299, 52)
    memory.write_u8(0x00029B, 57)
    memory.write_u8(0x00029D, 41)
end

jp.activate_power_generator = function()
    -- Activate power generator. To disable, set to 0
    memory.write_u16_le(0x00026B, 65535)

    -- Switches the graphic on the power panel to show it has been activated.
    -- This is set to 218 automatically when the power generator is turned on,
    -- but will not revert to 212 if the power generator is disabled. In normal
    -- gameplay, the power generator is never disabled once turned on.
    memory.write_u8(0x01314D, 218)
end

jp.disable_power_generator = function()
    memory.write_u16_le(0x00026B, 0) -- Disable power generator
    memory.write_u8(0x01314D, 212) -- Set power panel graphic to not activated
end

jp.open_all_gates = function()
    memory.write_u8(0x00024D, 1)
    memory.write_u8(0x00024F, 1)
    memory.write_u8(0x000251, 1)
end

-----------------------------------
--     Night vision goggles      --
-----------------------------------
jp.grant_battery_temp = function()
    memory.write_u16_le(0x000269, 65535) -- Grants battery for current building
end

jp.grant_south_utility_shed_battery = function()
    memory.write_u8(0x001DE8, 255) -- Determines if the battery has been acquired in this building
    memory.write_u8(0x00C635, 255) -- Removes battery from map when value > 127
end

jp.grant_beach_utility_shed_battery = function()
    memory.write_u8(0x001DE6, 255) -- Determines if the battery has been acquired in this building
    memory.write_u8(0x00C3A5, 255) -- Removes battery from map when value > 127
end

-----------------------------------
--       ID Card Functions       --
-----------------------------------
jp.grant_dennis_nedry = function()
    memory.write_u16_le(0x00025F, 65535) -- Grant ID card to player
    memory.write_u8(0x00B179, 255) -- Remove ID card from floor
    memory.write_u8(0x00B17A, 42) -- Remove ID card from floor
end

jp.revoke_dennis_nedry = function()
    memory.write_u16_le(0x00025F, 0) -- Remove ID card from player
    memory.write_u8(0x00B179, 0) -- Place ID card back on the floor
    memory.write_u8(0x00B17A, 2) -- Place ID card back on the floor
end

jp.grant_john_hammond = function()
    memory.write_u16_le(0x008862, 65535) -- Grant ID card to player
    memory.write_u8(0x000253, 1) -- Remove ID card from floor
    memory.write_u8(0x003246, 0) -- Remove ID card from floor
end

jp.revoke_john_hammond = function()
    memory.write_u16_le(0x008862, 0) -- Remove ID card from player
    memory.write_u8(0x000253, 0) -- Place ID card back on the floor
    memory.write_u8(0x003246, 16) -- Place ID card back on the floor
end

jp.grant_alan_grant = function()
    memory.write_u16_le(0x000259, 65535) -- Grant ID card to player
    memory.write_u8(0x00B95B, 255) -- Remove ID card from floor
    memory.write_u8(0x00B95C, 42) -- Remove ID card from floor
end

jp.revoke_alan_grant = function()
    memory.write_u16_le(0x000259, 0) -- Remove ID card from player
    memory.write_u8(0x00B95B, 0) -- Place ID card back on the floor
    memory.write_u8(0x00B95C, 2) -- Place ID card back on the floor
end

jp.grant_ian_malcolm = function()
    memory.write_u16_le(0x00B52C, 65535) -- Grant ID card to player
    memory.write_u8(0x000264, 255) -- Remove ID card from floor
    memory.write_u8(0x00B52E, 42) -- Remove ID card from floor
end

jp.revoke_ian_malcolm = function()
    memory.write_u16_le(0x00B52C, 255) -- Remove ID card from player
    memory.write_u8(0x000264, 0) -- Place ID card back on the floor
    memory.write_u8(0x00B52E, 2) -- Place ID card back on the floor
end

jp.grant_robert_muldoon = function()
    memory.write_u16_le(0x00D9B0, 65535) -- Grant ID card to player
    memory.write_u8(0x000258, 255) -- Remove ID card from floor
    memory.write_u8(0x00D9B2, 42) -- Remove ID card from floor
end

jp.revoke_robert_muldoon = function()
    memory.write_u16_le(0x00D9B0, 255) -- Remove ID card from player
    memory.write_u8(0x000258, 0) -- Place ID card back on the floor
    memory.write_u8(0x00D9B2, 2) -- Place ID card back on the floor
end

jp.grant_donald_gennaro = function()
    -- TODO: Find memory addresses
    -- memory.write_u16_le(0x000000, 65535) -- Grant ID card to player
    -- memory.write_u8(0x000000, 255) -- Remove ID card from floor
    -- memory.write_u8(0x000000, 42) -- Remove ID card from floor
end

jp.revoke_donald_gennaro = function()
    -- TODO: Find memory addresses
    -- memory.write_u16_le(0x000000, 0) -- Remove ID card from player
    -- memory.write_u8(0x000000, 0) -- Place ID card back on the floor
    -- memory.write_u8(0x000000, 2) -- Place ID card back on the floor
end

jp.grant_ray_arnold = function()
    -- TODO: Find memory addresses
    -- memory.write_u16_le(0x000000, 65535) -- Grant ID card to player
    -- memory.write_u8(0x000000, 255) -- Remove ID card from floor
    -- memory.write_u8(0x000000, 42) -- Remove ID card from floor
end

jp.revoke_ray_arnold = function()
    -- TODO: Find memory addresses
    -- memory.write_u16_le(0x000000, 0) -- Remove ID card from player
    -- memory.write_u8(0x000000, 0) -- Place ID card back on the floor
    -- memory.write_u8(0x000000, 2) -- Place ID card back on the floor
end

jp.grant_henry_wu = function()
    -- TODO: Find memory addresses
    -- memory.write_u16_le(0x000000, 65535) -- Grant ID card to player
    -- memory.write_u8(0x000000, 255) -- Remove ID card from floor
    -- memory.write_u8(0x000000, 42) -- Remove ID card from floor
end

jp.revoke_henry_wu = function()
    -- TODO: Find memory addresses
    -- memory.write_u16_le(0x000000, 0) -- Remove ID card from player
    -- memory.write_u8(0x000000, 0) -- Place ID card back on the floor
    -- memory.write_u8(0x000000, 2) -- Place ID card back on the floor
end

jp.grant_ellie_sattler = function()
    -- TODO: Find memory addresses
    -- memory.write_u16_le(0x000000, 65535) -- Grant ID card to player
    -- memory.write_u8(0x000000, 255) -- Remove ID card from floor
    -- memory.write_u8(0x000000, 42) -- Remove ID card from floor
end

jp.revoke_ellie_sattler = function()
    -- TODO: Find memory addresses
    -- memory.write_u16_le(0x000000, 0) -- Remove ID card from player
    -- memory.write_u8(0x000000, 0) -- Place ID card back on the floor
    -- memory.write_u8(0x000000, 2) -- Place ID card back on the floor
end
