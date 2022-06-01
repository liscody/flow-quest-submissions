## Table of Contents
- [Chapter 4 Day 1](#Chapter-4-Day-1)
- [Chapter 4 Day 2](#Chapter-4-Day-2)
- [Chapter 4 Day 3](#Chapter-4-Day-3)
- [Chapter 4 Day 4](#Chapter-4-Day-4)

## Chapter 4 Day 1
Quests
1. Explain what lives inside of an account.
2. What is the difference between the /storage/, /public/, and /private/ paths?
3. What does .save() do? What does .load() do? What does .borrow() do?
4. Explain why we couldn't save something to our account storage inside of a script.
5. Explain why I couldn't save something to your account.
6. Define a contract that returns a resource that has at least 1 field in it. Then, write 2 transactions:
- A transaction that first saves the resource to account storage, then loads it out of account storage, logs a field inside the resource, and destroys it.
- A transaction that first saves the resource to account storage, then borrows a reference to it, and logs a field inside the resource.

Answer
1. Account looks like a storage place divided at two part. First part keep a contract code, second part keep a data from contracts. This data stay in storage. Storage can be public or private. Access to private storage has only owner or user granted by owner.  
2. Difference:
- storage - place were all data lives;
- storage/private - place with limit access (only owner or granted by owner)
- storage/public - place with no limit access
3. Details: in general it is basic function. 
- .save() = save data to storage. Takes two parameters: data & path where it should save.   
- .load() = takes data from storage. One parameter: path were is data located.
- .borrow() = looks just in account storage. One parameter: path were is data located.

4. We cannot override a data in storage.  
5. User need permission to save something to my account.
6. Code.

contract 
```bash
pub contract Shop  {
    pub resource interface IGoods {
        pub let item: String 
    }
    pub resource Goods: IGoods {
        pub let item: String
        init() {
        self.item = "MacBook pro"
        } 
    }
    pub fun createGoods(): @Goods {
        return <- create  Goods()
    }
}

```

Transactions   
```bash
import Shop from 0x01
transaction() {
  prepare(signer: AuthAccount) {
    signer.save(<- Shop.createGoods(), to:/storage/MyShop)
  }
  execute {}
} 

```

```bash
import Shop from 0x01
transaction() {
  prepare(signer: AuthAccount) {
    let myGoods <- signer.load<@Shop.Goods>(from: /storage/MyShop)
                    ?? panic("No goods")
    log(myGoods.item)
    destroy myGoods;
  }
  execute {}
} 
```

```bash
import Shop from 0x01
transaction() {
  prepare(signer: AuthAccount) {
    let myGoods = signer.borrow<&Shop.Goods>(from: /storage/MyShop)
                    ?? panic("No goods")
    log(myGoods.item)
  }
  execute {}
}
```
<br>



