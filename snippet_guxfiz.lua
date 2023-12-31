-- HOW USE?

-- esx_property/config.lua

--[[
Editing Code:

remove line -- 128 -> 152


Use this:

Config.WardrobeInteraction = function(PropertyId, Interaction)
  exports['fivem-appearance']:changeClothe()
end


]]


changeClothe = function()
    
    TriggerEvent('fivem-appearance:Snippet:GuxFiz')

end

exports('changeClothe', changeClothe)


RegisterNetEvent('fivem-appearance:Snippet:GuxFiz', function()

    lib.registerContext({
        id = 'gx_snippet_browse',
        title = Strings.clothing_shop_title,
        options = {
            {
                title = Strings.browse_outfits_title,
                description = Strings.browse_outfits_desc,
                arrow = false,
                event = 'fivem-appearance:Snippet:GuxFiz:GET'
            },
            {
                title = Strings.delete_outfit_title,
                description = Strings.delete_outfit_desc,
                arrow = false,
                event = 'fivem-appearance:Snippet:GuxFiz:DELETE'
            },
        }
    })
    lib.showContext('gx_snippet_browse')

end)


RegisterNetEvent('fivem-appearance:Snippet:GuxFiz:GET', function()

    local outfits = lib.callback.await('fivem-appearance:getOutfits', 100)
    local Options = {}
    if outfits then 
        Options = {
            {
                title = Strings.go_back_title,
                event = 'fivem-appearance:Snippet:GuxFiz'
            }
        }
        for i=1, #outfits do 
            Options[#Options + 1] = {
                title = outfits[i].name,
                event = 'fivem-appearance:setOutfit',
                args = {
                    ped = outfits[i].ped,
                    components = outfits[i].components,
                    props = outfits[i].props
                }
            }
        end
    else
        Options = {
            {
                title = Strings.go_back_title,
                description = Strings.go_back_desc,
                event = 'fivem-appearance:Snippet:GuxFiz'
            }
        }
    end
    lib.registerContext({
        id = 'snippet_menu',
        title = Strings.browse_outfits_title,
        options = Options
    })
    lib.showContext('snippet_menu')

end)

RegisterNetEvent('fivem-appearance:Snippet:GuxFiz:DELETE', function()
    local outfits = lib.callback.await('fivem-appearance:getOutfits', 100)
    local Options = {}
    if outfits then
        Options = {
            {
                title = Strings.go_back_title,
                event = 'fivem-appearance:Snippet:GuxFiz'
            }
        }
        for i=1, #outfits do
            Options[#Options + 1] = {
                title = outfits[i].name,
                serverEvent = 'fivem-appearance:deleteOutfit',
                args = outfits[i].id 
            }
        end
    else
        Options = {
            {
                title = Strings.go_back_title,
                description = Strings.go_back_desc,
                event = 'fivem-appearance:Snippet:GuxFiz'
            }
        }
    end
    lib.registerContext({
        id = 'snippet_delete_menu',
        title = Strings.delete_outfits_title,
        options = Options
    })
    lib.showContext('snippet_delete_menu')
end)