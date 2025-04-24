Button = Class{}

function Button:init(text, x, y, width, height, font)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.text = text
    self.font = font or gFonts["buttons"]

    self.text_y = self.y + (self.height/2) - (getFontHeight(self.font) / 2) + 1
end

function Button:render()
    love.graphics.setFont(self.font)
    love.graphics.setColor(gColors["light_grey2"])
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

    love.graphics.setColor(gColors["light_blue"])
    love.graphics.printf(self.text, self.x, self.text_y, self.width, "center")
end

function Button:isHovered()
    local mx, my = push:toGame(love.mouse.getPosition())
    return mx > self.x and mx < self.x + self.width and
           my > self.y and my < self.y + self.height
end

function Button:isClicked()
    return self:isHovered() and love.mouse.isDown(1)
end
