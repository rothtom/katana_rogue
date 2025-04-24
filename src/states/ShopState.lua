ShopState = Class{__include = BaseState}

function ShopState:enter(params)
    self.items = {
        ShopItem({
            ["name"] = "BigMac",
            ["stats"] = {
                ["max_health"] = 20,
                ["damage"] = -0.2,
            },
            ["base_price"] = 20,
            ["slot"] = 1,
        }),
        ShopItem({
            ["name"] = "Chicken nuggets",
            ["stats"] = {
                ["max_health"] = -10,
                ["damage"] = 0.1,
            },
            ["base_price"] = 12,
            ["slot"] = 2,
        }),
        ShopItem({
            ["name"] = "Pommes",
            ["stats"] = {
                ["max_health"] = 5,
                ["damage"] = 0.1,
            },
            ["base_price"] = 16,
            ["slot"] = 3,
        }),
    }
end

function ShopState:update(dt)
    for _, item in pairs(self.items) do
        item:update(dt)
    end
end

function ShopState:render()
    love.graphics.draw(gImages["playBackground"], 0, 0)
    for _, item in pairs(self.items) do
        item:render()
    end
end

function ShopState:exit()

end