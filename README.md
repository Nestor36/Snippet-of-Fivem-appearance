<img src="https://github.com/Nestor36/Snippet-of-Fivem-appearance/assets/62574741/8431fc71-e56d-43c8-b820-84d71612e6fc">

# Snippet-of-Fivem-appearance
Esto es para tener un menú de buscar y eliminar outfits - para cualquier script de motels u otro
Claramente es necesario tener el Fivem-Appearance de Wasabi.


-- HOW USE?

-- Add File in:
-- fivem-appearance/client/(HERE) 

-- FOR MOTELS U ANOTHER - EXAMPLE:

-- esx_property/config.lua

--[[
  
Editing Code:

remove line -- 128 -> 152


Use this:

Config.WardrobeInteraction = function(PropertyId, Interaction)
  exports['fivem-appearance']:changeClothe()
end

]]
