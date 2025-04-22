Player = Class{}

local BAR_HEIGHT = 8

function Player:init(stats, sword, attacks)
    self.max_health = stats.max_health
    self.health = stats.health or stats.max_health
    self.attacks = attacks
    self.active_attack = nil
    self.target = nil
end

function Player:update(dt)
    for _, attack in pairs(self.attacks) do
        attack:update(dt)
    end
    if love.keyboard.isDown("q") and not self.attacks["q"]:is_onCooldown() and not self.attacks["q"]:is_active() then
        self.attacks["q"]:activate(self.target)
    end
end

function Player:setEnemie(target)
    self.target = target
end

function Player:render()
    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(gImages["playerSprite"], 0, 0)

    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("line", 10, VIRTUAL_HEIGHT - 5 - BAR_HEIGHT, self.max_health, BAR_HEIGHT)

    love.graphics.setColor(gColors["red"])
    love.graphics.rectangle("fill", 10, VIRTUAL_HEIGHT - 5 - BAR_HEIGHT, self.health, BAR_HEIGHT)

    love.graphics.setColor(gColors["dark_grey"])
    love.graphics.rectangle("fill", 10 + self.health, VIRTUAL_HEIGHT - 5 - BAR_HEIGHT, self.max_health - self.health, BAR_HEIGHT)


    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(self.health .. "/" .. self.max_health, 10 + 2, VIRTUAL_HEIGHT - 5 - BAR_HEIGHT / 2 - 4, self.max_health - 2,"left")
end