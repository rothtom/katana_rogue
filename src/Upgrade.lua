Upgrade = Class{}


function Upgrade:init(params)
    self.modifiers = params.modifiers
    self.slot = params.slot
    self.width = math.floor(VIRTUAL_WIDTH / 5)
    self.height = VIRTUAL_HEIGHT / 2
    self.padding_x = self.width / 2
    self.x = self.padding_x + (self.padding_x + self.width) * (self.slot - 1)
    self.y =  VIRTUAL_HEIGHT / 2 - self.height / 2
    
end

function Upgrade:update(dt)
    if self:isClicked() then
        self:apply()
        gStateMachine:change("shop", {})
    end
end

function Upgrade:isClicked()
    return self:isHovered() and love.mouse.isDown(1)
end

function Upgrade:isHovered()
    local mx, my = push:toGame(love.mouse.getPosition())
    return mx > self.x and mx < self.x + self.width and
           my > self.y and my < self.y + self.height
end

function Upgrade:apply()
    for _, modifier in pairs(self.modifiers) do
        modifier:apply()
    end
end

function Upgrade:render()
    love.graphics.setColor(gColors["light_grey2"])
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1,1,1,1)
    for _, modifier in pairs(self.modifiers) do
        for stat, ammount in pairs(modifier.stats) do
            love.graphics.setFont(gFonts["normal"])
            love.graphics.printf(gStatToName[stat], self.x, self.y, self.width,"center")
            love.graphics.setFont(gFonts["small"])
            if ammount < 0 then
                love.graphics.setColor(gColors["red2"])
                love.graphics.printf(ammount, self.x, self.y + 20, self.width, "center")
            else            
                love.graphics.setColor(gColors["green"])
                love.graphics.printf("+" .. ammount, self.x, self.y + 20, self.width, "center")
            end
        end
    end
end