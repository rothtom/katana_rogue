PlayButton = Class{__includes = Button}

function PlayButton:update(dt)
    if self:isClicked() then
        sword = Sword({
            ["damage"] = 12,
            ["cooldown_reduction"] = 0,
        })
        attacks = {
            ["q"] = Attack({
                ["damage"] = 8,
                ["duration"] = 1,
                ["cooldown"] = 2,
            },
            "q"    
        ),
            ["w"] = Attack({
                ["damage"] = 24,
                ["duration"] = 3,
                ["cooldown"] = 2,
            },
            "w" 
        ),
            ["e"] = Attack({
                ["damage"] = 30,
                ["duration"] = 4,
                ["cooldown"] = 5,
            },
            "e"  
        ),
            ["r"] = Attack({
                ["damage"] = 50,
                ["duration"] = 1.5,
                ["cooldown"] = 10,
            },
            "r"
        ),
        
        }
        round = 1
        player = Player({
            max_health = 10,
            health = 10,
            strength = 1,
            }
        )
        gStateMachine:change("play", {})
    end
end