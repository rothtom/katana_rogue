RewardState = Class{__includes = BaseState}

function RewardState:enter(params)
    self.rewards = {}
    self.rewards["gold"] = scale_gold()
    local BUTTON_WIDTH = 130
    local BUTTON_HEIGHT = 20
    self.margin_y = (VIRTUAL_HEIGHT / 5) / 2
    self.margin_x = (VIRTUAL_WIDTH / 3) / 2
    self.ContinueButton = ContinueButton("Continue", (VIRTUAL_WIDTH - BUTTON_WIDTH) / 2, VIRTUAL_HEIGHT - BUTTON_HEIGHT - self.margin_y - 16, 
                                        BUTTON_WIDTH, BUTTON_HEIGHT)

end

function RewardState:update(dt)
    self.ContinueButton:update(dt)
end

function RewardState:render()
    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(gImages["playBackground"], 0, 0)

    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("line", self.margin_x, self.margin_y, VIRTUAL_WIDTH - self.margin_x * 2,VIRTUAL_HEIGHT - self.margin_y * 2)

    love.graphics.setColor(gColors["dark_grey"])
    love.graphics.rectangle("fill", self.margin_x, self.margin_y, VIRTUAL_WIDTH - self.margin_x * 2,VIRTUAL_HEIGHT - self.margin_y * 2)

    love.graphics.setFont(gFonts["heading"])
    love.graphics.setColor(gColors["light_blue"])
    love.graphics.printf("Rewards", 0, VIRTUAL_HEIGHT / 3 - 40, VIRTUAL_WIDTH,"center")

    love.graphics.setColor(1,1,1,1)
    love.graphics.setFont(gFonts["normal"])
    for reward, ammount in pairs(self.rewards) do
        love.graphics.printf(reward .. " x" .. ammount, 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH,"center")
    end
    self.ContinueButton:render()
end

function RewardState:exit()
    player.gold = player.gold + self.rewards["gold"]
end