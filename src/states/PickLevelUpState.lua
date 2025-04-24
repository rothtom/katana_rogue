PickLevelUpState = Class{__includes = BaseState}

function PickLevelUpState:enter(params)
    self.upgrades = {
        Upgrade({
            ["modifiers"] = {
                ["max_health"] = 10,
            },
            ["slot"] = 1,
        }
        ),
        Upgrade({
            ["modifiers"] = {
                ["strength"] = 0.1,
            },
            ["slot"] = 2,
        }
        ),
        Upgrade({
            ["modifiers"] = {
                ["health"] = 10,
            },
            ["slot"] = 3,
        }
        ),
    }
end

function PickLevelUpState:update(dt)
    for _, upgrade in pairs(self.upgrades) do
        upgrade:update(dt)
    end
end

function PickLevelUpState:render()
    love.graphics.draw(gImages["playBackground"], 0, 0)
    
    for _, upgrade in pairs(self.upgrades) do
        upgrade:render()
    end
end