PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
    self.player = params.player
    self.enemies = params.enemies
    self.player:setEnemie(self.enemies[1])
    self.player:resetAttacks()
end

function PlayState:update(dt)
    if self.enemies[1].health <= 0 then
        table.remove(self.enemies, 1)
        self.player:setEnemie(self.enemies[1])
        self.player:resetAttacks()
    end
    if #self.enemies == 0 then
        gStateMachine:change("pick_levelup", {
            player = self.player,
            upgrades = {
                Upgrade({
                    ["modifiers"] = {
                        ["max_health"] = 10,
                    },
                    ["slot"] = 1,
                    ["player"] = self.player
                }
                ),
                Upgrade({
                    ["modifiers"] = {
                        ["damage"] = 0.1,
                    },
                    ["slot"] = 2,
                    ["player"] = self.player
                }
                ),
                Upgrade({
                    ["modifiers"] = {
                        ["health"] = 10,
                    },
                    ["slot"] = 3,
                    ["player"] = self.player
                }
                ),
            }
        })
    end
    self.player:update(dt)
end

function PlayState:render()
    love.graphics.draw(gImages["playBackground"], 0,0)
    for _, enemie in pairs(self.enemies) do
        enemie:render()
    end
    self.player:render()

end

function PlayState:exit()
    self.player.round = self.player.round + 1
end