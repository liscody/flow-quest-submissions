pub contract Fruits  {

    // dictionary 
    pub var listOfFruits: @{String: Citrus}

    pub resource Citrus {
        pub let message: String
        init() {
            self.message = "Orange"
        }
    }

    // add to dictionary
    pub fun addCitrus(citrus: @Citrus) {
       // let key = citrus.message
       // self.listOfFruits[key] <-! citrus
       // or 
        
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

