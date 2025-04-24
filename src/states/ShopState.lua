ShopState = Class{__include = BaseState}

function ShopState:enter(params)
    self.items = {
        ShopItem({
            ["name"] = "BigMac",
            ["stats"] = {
                ["max_health"] = 20,
                ["strength"] = -0.2,
            },
            ["base_price"] = 20,
            ["slot"] = 1,
            ["targets"] = {player}
        }),
        ShopItem({
            ["name"] = "Chicken nuggets",
            ["stats"] = {
                ["max_health"] = -10,
                ["strength"] = 0.1,
            },
            ["base_price"] = 12,
            ["slot"] = 2,
            ["targets"] = {player}
        }),
        ShopItem({
            ["name"] = "Pommes",
            ["stats"] = {
                ["max_health"] = 5,
                ["strength"] = 0.1,
            },
            ["base_price"] = 16,
            ["slot"] = 3,
            ["targets"] = {player}
        }),
    }
end

function ShopState:update(dt)
    for i, item in pairs(self.items) do
        item:update(dt)
        if item.bought then
            table.remove(self.items, i)
            local already_in_inventory = false
            for _, player_item in pairs(player.items) do
                if player_item.name == item.name then
                    player_item.ammount = player_item.ammount + item.ammount
                    already_in_inventory = true
                end
            end
            if not already_in_inventory then
                table.insert(player.items, InventoryItem({
                    ["shop_item"] = item,
                    ["slot"] = #player.items,
                    ["ammount"] = item.ammount,
                }))
            end
        end
    end
end

function ShopState:render()
    love.graphics.draw(gImages["playBackground"], 0, 0)
    for _, item in pairs(self.items) do
        item:render()
    end

    for _, item in pairs(player.items) do
        item:render()
    end
end

function ShopState:exit()

end