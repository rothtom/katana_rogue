Modifier = Class{}

function Modifier:init(target, stats)
    self.target = target
    self.stats = stats
end

function Modifier:apply()
    self.target:apply(self.stats)
end