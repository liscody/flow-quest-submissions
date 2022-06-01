pub contract color {

// array 

    pub var rainbows: @[Color]

    pub resource Color {
        pub let message: String
        init() {
            self.message = "Green"
        }
    }

    pub fun addColor(color: @Color) {
        self.rainbows.append(<- color)
    }

    pub fun removeGreeting(index: Int): @Color {
        return <- self.rainbows.remove(at: index)
    }

    init() {
        self.rainbows <- []
    }

}