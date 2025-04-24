Player = Class{}

local BAR_HEIGHT = 8

function Player:init(stats)
    self.stats = {}
    self.stats["max_health"] = stats.max_health or 100
    self.stats["strength"] = stats.strength or 1
    self.stats["health"] = stats.health or self.stats["max_health"]

    self.sword = sword
    self.attacks = attacks
    self.target = nil
    self.level = 1
    self.items = {}
end

function Player:update(dt)
    if self.health <= 0 then
        self:die()
    end

    for _, attack in pairs(self.attacks) do
        attack:update(dt)
    end
    if love.keyboard.isDown("q") and not self.attacks["q"]:is_onCooldown() and not self:any_attack_active() then
        self.attacks["q"]:activate(self.target, self)
    end

    if love.keyboard.isDown("w") and not self.attacks["w"]:is_onCooldown() and not self:any_attack_active() then
        self.attacks["w"]:activate(self.target, self)
    end

    if love.keyboard.isDown("e") and not self.attacks["e"]:is_onCooldown() and not self:any_attack_active() then
        self.attacks["e"]:activate(self.target, self)
    end

    if love.keyboard.isDown("r") and not self.attacks["r"]:is_onCooldown() and not self:any_attack_active() then
        self.attacks["r"]:activate(self.target, self)
    end

    self.sword:update(dt)
    for _, item in pairs(self.items) do
        item:update(dt)
    end
end

function Player:apply(modifiers)
    print(modifiers)
    for stat, ammount in pairs(modifiers) do
        print(stat, ammount)
        self.stats[stat] = self.stats[stat] + ammount
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

function Player:setTarget(target)
    self.target = target
end

function Player:reset()
    self:heal(math.ceil(((self.stats["max_health"] - self.stats["health"]) * 0.7))) -- heal for 70% missing hp
    for _, attack in pairs(self.attacks) do
        attack:reset()
    end
end

function Player:heal(ammount)
    self.health = math.min(self.stats["health"] + ammount, self.stats["max_health"])
end

function Player:die()
    gStateMachine:change("death", {})
end

function Player:render()
    local HEALTHBAR_MAX_WIDTH = 400
    -- local HEALTHBAR_MIN_WIDTH = 20

    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(gImages["playerSprite"], 0, 0)

    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("line", MARGIN_X, VIRTUAL_HEIGHT - MARGIN_Y - BAR_HEIGHT, math.min(HEALTHBAR_MAX_WIDTH, self.stats["max_health"]), BAR_HEIGHT)

    love.graphics.setColor(gColors["red"])
    love.graphics.rectangle("fill", MARGIN_X, VIRTUAL_HEIGHT - MARGIN_Y - BAR_HEIGHT, math.min(HEALTHBAR_MAX_WIDTH, self.stats["health"]), BAR_HEIGHT)

    love.graphics.setColor(gColors["dark_grey"])
    love.graphics.rectangle("fill", MARGIN_X + self.stats["health"], VIRTUAL_HEIGHT - MARGIN_Y - BAR_HEIGHT, math.min(HEALTHBAR_MAX_WIDTH, self.stats["max_health"] - self.stats["health"]), BAR_HEIGHT)

    love.graphics.setFont(gFonts["small"])
    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(self.health .. "/" .. self.stats["max_health"], MARGIN_X + 2, VIRTUAL_HEIGHT - MARGIN_Y - BAR_HEIGHT / 2 - 4, self.stats["max_health"] - 2,"left")

    for _, attack in pairs(self.attacks) do
        attack:render()
    end

    self.sword:render()
end