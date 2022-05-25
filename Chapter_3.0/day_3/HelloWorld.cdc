pub contract Fruits  {
     pub var listOfFruits: @{String: Citrus}
     pub resource Citrus {
        pub let fruits: String
        init() {
            self.fruits = "Orange"
        }
    }
    
    pub fun getCitrus(key: String): &Citrus {
        return &self.listOfFruits[key] as &Citrus
    }

    pub fun addCitrus(citrus: @Citrus) {

        let key = citrus.message
        let oldList <- self.listOfFruits[key] <- citrus
        destroy oldList
    }
    
    //remove from dictionary 
    pub fun removeGreeting(key: String): @Citrus {
        let citrus <- self.listOfFruits.remove(key: key) ?? panic("No Citrus")
        return <- citrus
    }

    init() {
        self.listOfFruits <- {}
    }
}
