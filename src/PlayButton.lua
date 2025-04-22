PlayButton = Class{__includes = Button}

function PlayButton:update(dt)
    if self:isClicked() then
        gStateMachine:change("play", {
            player = Player(),
            enemies = {Enemie({
                max_health = 100,
                damage = 72,
            }
            )}
        })        
    end
end