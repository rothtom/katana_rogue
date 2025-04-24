PickLevelUpState = Class{__includes = BaseState}

function PickLevelUpState:enter(params)
    self.upgrades = {
        Upgrade({
            ["modifiers"] = {
                Modifier(sword, {
                    ["damage"] = 15,
                })
            },
            ["slot"] = 1,
        }
        ),
        Upgrade({
            ["modifiers"] = {
                Modifier(player, {
                    ["strength"] = 0.1,
                })
            },
            ["slot"] = 2,
        }
        ),
        Upgrade({
            ["modifiers"] = {
                Modifier(player.attacks["q"], {
                    ["duration"] = -0.2
                })
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