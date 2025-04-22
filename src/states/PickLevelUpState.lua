PickLevelUpState = Class{__includes = BaseState}

function PickLevelUpState:enter(params)
    self.player = params.player
end

function PickLevelUpState:pick(stat)
    if stat == "max_health" then
        self.player.max_health = self.palyer.max_health + 10
    elseif stat == "damage" then
        self.player.damage = self.palyer.damage + 0.1
    end
end

function PickLevelUpState:update(dt)

end

function PickLevelUpState:render()

end