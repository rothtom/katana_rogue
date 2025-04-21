require "src/Dependencies"

function love.load()
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false,
    })

    love.window.setTitle("Katana Rogue")

    love.graphics.setDefaultFilter("nearest", "nearest")

    gFonts = {
        ["heading"] = love.graphics.newFont("fonts/font.ttf", 34),
        ["normal"] = love.graphics.newFont("fonts/font.ttf", 14),
        ["buttons"] = love.graphics.newFont("fonts/font.ttf", 24)
    }
    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        --[[
        ['play'] = function() return PlayState() end,
        ['serve'] = function() return ServeState() end,
        ['game-over'] = function() return GameOverState() end,
        ['victory'] = function() return VictoryState() end,
        ['high-scores'] = function() return HighScoreState() end,
        ['enter-high-score'] = function() return EnterHighScoreState() end,
        ['paddle-select'] = function() return PaddleSelectState() end
        ]]-- 
    }
    gStateMachine:change('start', {
       ExitButton = ExitButton("Exit", VIRTUAL_WIDTH/ 2 - 50, VIRTUAL_HEIGHT- 40, 100, 20)
    })
end

function love.update(dt)
    gStateMachine:update(dt)
end

function love.draw()
    push:apply("start")
    gStateMachine:render()
    push:apply("end")
end