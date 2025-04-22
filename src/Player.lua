Player = Class{}

local BAR_HEIGHT = 8

function Player:init(stats, sword, attacks)
    self.max_health = stats.max_health or 100
    self.health = stats.health or stats.max_health
    self.damage = stats.damage or 1
    self.attacks = attacks
    self.active_attack = nil
    self.target = nil
    self.level = 1
end

function Player:update(dt)
    for _, attack in pairs(self.attacks) do
        attack:update(dt)
    end
    if love.keyboard.isDown("q") and not self.attacks["q"]:is_onCooldown() and not self:any_attack_active() then
        self.attacks["q"]:activate(self.target, self)
    end

    if love.keyboard.isDown("w") and not self.attacks["w"]:is_onCooldown() and not self.attacks["w"]:is_active() then
        self.attacks["w"]:activate(self.target, self)
    end

    if love.keyboard.isDown("e") and not self.attacks["e"]:is_onCooldown() and not self.attacks["e"]:is_active() then
        self.attacks["e"]:activate(self.target, self)
    end

    if love.keyboard.isDown("r") and not self.attacks["q"]:is_onCooldown() and not self.attacks["r"]:is_active() then
        self.attacks["r"]:activate(self.target, self)
    end
end

function Player:any_attack_active()
    for _, attack in pairs(self.attacks) do
        if attack:is_active() then
            return true
        end
    end
    return false
end

function Player:setEnemie(target)
    self.target = target
end

function Player:render()
    local HEALTHBAR_MAX_WIDTH = 400

    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(gImages["playerSprite"], 0, 0)

    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("line", 10, VIRTUAL_HEIGHT - 5 - BAR_HEIGHT, math.min(HEALTHBAR_MAX_WIDTH, self.max_health), BAR_HEIGHT)

    love.graphics.setColor(gColors["red"])
    love.graphics.rectangle("fill", 10, VIRTUAL_HEIGHT - 5 - BAR_HEIGHT, math.min(HEALTHBAR_MAX_WIDTH, self.health), BAR_HEIGHT)

    love.graphics.setColor(gColors["dark_grey"])
    love.graphics.rectangle("fill", 10 + self.health, VIRTUAL_HEIGHT - 5 - BAR_HEIGHT, math.min(HEALTHBAR_MAX_WIDTH, self.max_health - self.health), BAR_HEIGHT)


    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(self.health .. "/" .. self.max_health, 10 + 2, VIRTUAL_HEIGHT - 5 - BAR_HEIGHT / 2 - 4, self.max_health - 2,"left")
end