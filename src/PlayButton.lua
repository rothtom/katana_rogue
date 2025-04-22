PlayButton = Class{__includes = Button}

function PlayButton:update(dt)
    if self:isClicked() then
        gStateMachine:change("play", {
            player = Player({
                    max_health = 200,
                    health = 100
                },
                nil, -- sword
                {
                    ["q"] = Attack({
                        ["damage"] = 15,
                        ["duration"] = 1,
                        ["cooldown"] = 2,
                    })
                }
            ),
            enemies = {Enemie({
                max_health = 100,
                damage = 72,
            }
            )}
        })        
    end
end