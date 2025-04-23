PlayButton = Class{__includes = Button}

function PlayButton:update(dt)
    if self:isClicked() then
        gStateMachine:change("play", {
            player = Player({
                    max_health = 120,
                    health = 100
                },
                nil, -- sword
                {
                    ["q"] = Attack({
                        ["damage"] = 50,
                        ["duration"] = 1,
                        ["cooldown"] = 2,
                    },
                    "q"    
                ),
                    ["w"] = Attack({
                        ["damage"] = 50,
                        ["duration"] = 1,
                        ["cooldown"] = 2,
                    },
                    "w" 
                ),
                    ["e"] = Attack({
                        ["damage"] = 50,
                        ["duration"] = 1,
                        ["cooldown"] = 2,
                    },
                    "e"  
                ),
                    ["r"] = Attack({
                        ["damage"] = 50,
                        ["duration"] = 1,
                        ["cooldown"] = 2,
                    },
                    "r"
                ),
                }
            ),
            enemies = {Enemie({
                max_health = 100,
                damage = 72,
            }
            )},
            round = 1
        })
    end
end