ShopState = Class{__include = BaseState}

function ShopState:enter(params)
    self.items = {
        ShopItem({
            ["name"] = "BigMac",
            ["modifiers"] = {
                Modifier(player, {
                    ["max_health"] = -10,
                    ["strength"] = 0.2
                }),
            },
            ["base_price"] = 20,
            ["slot"] = 1,

        }),
        ShopItem({
            ["name"] = "Chicken nuggets",
            ["modifiers"] = {
                Modifier(player, {
                    ["max_health"] = 20,
                }),
            },
            ["base_price"] = 12,
            ["slot"] = 2,

        }),
        ShopItem({
            ["name"] = "Pommes",
            ["modifiers"] = {
                Modifier(player, {
                    ["max_health"] = 70,
                    ["strength"] = -0.3
                }),
                Modifier(sword, {
                    ["damage"] = 50
                })
            },
            ["base_price"] = 16,
            ["slot"] = 3,
        }),
    }
    local MARGIN_X = 5
    local MARGIN_Y = 5
    local BUTTON_WIDTH = 128
    local BUTTON_HEIGHT = 16
    self.NextRoundButton = NextRoundButton("Next Round",
                                            make_divisible_by(VIRTUAL_WIDTH - BUTTON_WIDTH - MARGIN_X, 8), 
                                            make_divisible_by(VIRTUAL_HEIGHT - BUTTON_HEIGHT - MARGIN_Y, 8),
                                            BUTTON_WIDTH, BUTTON_HEIGHT,
                                            gFonts["normal"]
                                        )

    self.reroll_price = calculate_reroll_price()
    -- self.RerollButton = Button(self.reroll_price,

--)

end

function ShopState:update(dt)
    self.NextRoundButton:update(dt)

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

    self.NextRoundButton:render()
end

function ShopState:exit()

end