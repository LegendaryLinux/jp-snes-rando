jp = {}

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
