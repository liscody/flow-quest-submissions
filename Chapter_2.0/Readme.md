## Table of Contents
- [Chapter 2 Day 1](#Chapter-2-Day-1)
- [Chapter 2 Day 2](#Chapter-2-Day-2)
- [Chapter 2 Day 3](#Chapter-2-Day-3)
- [Chapter 2 Day 4](#Chapter-2-Day-4)

## Chapter 2 Day 1
Deploy <br>
![Deploy](img/chapter_2.0_day_1/deploy.png)
Read data<br>
![Read-data](img/chapter_2.0_day_1/read_data.png)


## Chapter 2 Day 2
Quests
1. Explain why we wouldn't call changeGreeting in a script.
2. What does the AuthAccount mean in the prepare phase of the transaction?
3. What is the difference between the prepare phase and the execute phase in the transaction?
4. Add two new things inside your contract:
   - A variable named myNumber that has type Int (set it to 0 when the contract is deployed)
   - A function named updateMyNumber that takes in a new number named newNumber as a parameter that has type Int and updates myNumber to be newNumber
   - Add a script that reads myNumber from the contract
5. Add a transaction that takes in a parameter named myNewNumber and passes it into the updateMyNumber function. Verify that your number changed by running the script again.


Answer
1. Scrips do not change any data on blockchain. They are executed only for read data from blockchain. 
2. Prepare phase collected data from my account. AuthAccount that is an account from name of each which we make a call to blockchain. In other wawy we can call it as Caller or gasPayer 
3. Prepare phase collected info/data from account. Execute phase cannot collect data or info but it can call or execute a function from contracts 
Read data<br>

```bash
pub contract HelloWorld {

    pub var greeting: String
    pub var myNumber: Int

    pub fun changeGreeting(newGreeting: String) {
        self.greeting = newGreeting
    }

    pub fun updateMyNumber(newNumber: Int) {
        self.myNumber = newNumber
    }

    init() {
        self.greeting = "Hello, World!"
        self.myNumber = 0
    }
}

```

Transaction 
```bash
import HelloWorld from 0x01

transaction(myNumber: Int) {

  prepare(signer: AuthAccount) {}

  execute {
    HelloWorld.updateMyNumber(newNumber: myNumber )
  }
}
```
Scripts
```bash
import HelloWorld from 0x01

pub fun main(): Number {
    return HelloWorld.myNumber
}
```



![Read-data](img/chapter_2.0_day_2/read_data.png)


## Chapter 2 Day 3
Quests
1. In a script, initialize an array (that has length == 3) of your favourite people, represented as Strings, and log it.
2. In a script, initialize a dictionary that maps the Strings Facebook, Instagram, Twitter, YouTube, Reddit, and LinkedIn to a UInt64 that represents the order in which you use them from most to least. For example, YouTube --> 1, Reddit --> 2, etc. If you've never used one before, map it to 0!
3. Explain what the force unwrap operator ! does, with an example different from the one I showed you (you can just change the type).
4. Using this picture below, explain...
  - What the error message means
  - Why we're getting this error
  - How to fix it

Answer
1. Array
![Array](img/chapter_2.0_day_3/array.png)

2. Dictionary 
![Array](img/chapter_2.0_day_3/dictionary.png)

3. The force-unwrap operator (!) returns the value inside an optional if it contains a value, or panics and aborts the execution if the optional has no value, i.e, the optional value is nil. 
4. explain...
  - What the error message means
  This means that compilator expect exactly "String" but got string and possible not.
  - Why we're getting this error
  contains from dictionary in Cadence returns as optional type 
  - How to fix it
  we need to use 
  ```bash
  return thing[0x03]!


## Chapter 2 Day 4
Quests
1. Deploy a new contract that has a Struct of your choosing inside of it (must be different than Profile).
2. Create a dictionary or array that contains the Struct you defined.
3. Create a function to add to that array/dictionary.
4. Add a transaction to call that function in step 3.
5. Add a script to read the Struct you defined.

Answer
1. Deploy
![Deploy](img/chapter_2.0_day_4/deploy.png)
2. Dictionary
```bash
    pub var supplier: {Address: Profile}
```
3. New function

```bash
    pub fun addSupplier(id: Int, company: String, director: String, account: Address) {
        let newSupplier = Profile(_id: id, _company: company, _director: director, _account: account)
        self.supplier[account] = newSupplier
    }
```
4. Transaction to call
![Added](img/chapter_2.0_day_4/added.png)
5. Add a script
![Read](img/chapter_2.0_day_4/read.png)

