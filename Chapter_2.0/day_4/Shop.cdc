pub contract Shop {

    pub var supplier: {Address: Profile}
    
    pub struct Profile {
        pub let id: Int
        pub let company: String
        pub let director: String
        pub let account: Address

        // You have to pass in 4 arguments when creating this Struct.
        init(_id: Int, _company: String, _director: String, _account: Address) {
            self.id = _id
            self.company = _company
            self.director = _director
            self.account = _account
        }
    }

    pub fun addSupplier(id: Int, company: String, director: String, account: Address) {
        let newSupplier = Profile(_id: id, _company: company, _director: director, _account: account)
        self.supplier[account] = newSupplier
    }

    init() {
        self.supplier = {}
    }

}