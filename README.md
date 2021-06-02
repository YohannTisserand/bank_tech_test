# Bank_tech_test
[![Build Status](https://travis-ci.com/YohannTisserand/bank_tech_test.svg?branch=main)](https://travis-ci.com/YohannTisserand/bank_tech_test)

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
## User Story
```
as a user
so I can top up my bank account
I would like to make a deposit
```
```
as a user
so I can buy things
I would like to withdraw some cash
```
```
as a user
so I can keep track of my bank account
I would like to be able to print a bank statement
```
## Snapshot
![](../public/Screen Recording 2021-06-02 at 12.27.17.gif)
