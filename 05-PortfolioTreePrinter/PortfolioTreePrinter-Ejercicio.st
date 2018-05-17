!classDefinition: #PortfolioTest category: #'PortfolioTreePrinter-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.

	self assert: 0 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:45'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:34'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:22:46'!
test03_01WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	self assert: (Withdraw register: withdrawValue on: account) value equals: withdrawValue 
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:48'!
test04PortfolioBalanceIsSumOfManagedAccountsBalance

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert:300 = complexPortfolio balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:53'!
test05PortfolioCanManagePortfolios

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 = composedPortfolio balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:36'!
test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account registers: deposit).
	self assert: (account registers: withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:30'!
test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account registers: deposit).
	self deny: (account registers:withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:51'!
test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!
test08PortofolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:00'!
test10ReceptiveAccountManageItSelf 

	| account1 |
	account1 := ReceptiveAccount new.
		
	self assert: (account1 manages:account1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:01'!
test11ReceptiveAccountDoNotManageOtherAccount

	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 manages: account2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:02'!
test12PortfolioManagesComposedAccounts

	| account1 account2 account3 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio manages: account1).
	self assert: (complexPortfolio manages: account2).
	self deny: (complexPortfolio manages: account3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:03'!
test13PortfolioManagesComposedAccountsAndPortfolios 

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	self assert: (composedPortfolio manages: account1).
	self assert: (composedPortfolio manages: account2).
	self assert: (composedPortfolio manages: account3).
	self assert: (composedPortfolio manages: complexPortfolio).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:28'!
test14AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1=account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:15'!
test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions 

	| account1 account2 account3 complexPortfolio account composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
	self assert: 3 = composedPortfolio transactions size .
	self assert: (composedPortfolio transactions includes: deposit1).
	self assert: (composedPortfolio transactions includes: deposit2).
	self assert: (composedPortfolio transactions includes: deposit3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test16PortfolioKnowsItsAccountsTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1= (composedPortfolio transactionsOf:account1) size .
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test17PortfolioKnowsItsPortfoliosTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
		
	self assert: 2 = (composedPortfolio transactionsOf:complexPortfolio) size .
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit1).
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!
test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts 

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self 
		should: [ complexPortfolio transactionsOf:account3 ] 
		raise: Error 
		withExceptionDo: [ :accountNotManaged |
			self assert: Portfolio accountNotManagedMessageDescription = accountNotManaged messageText ]
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:24:31'!
test19CanNotCreatePortfoliosWithRepeatedAccount 

	| account1 |

	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:15'!
test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio 

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.

	self 
		should: [ Portfolio with: complexPortfolio with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:11:42'!
test20_01CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolioTwo

    | account1 account2 account3 complexPortfolio1 complexPortfolio2 |
    
    account1 := ReceptiveAccount new.
    account2 := ReceptiveAccount new.
    account3 := ReceptiveAccount new.    
    complexPortfolio1 := Portfolio with: account1 with: account2.
    complexPortfolio2 := Portfolio with: account3 with: account1.

    self 
        should: [ Portfolio with: complexPortfolio1 with: complexPortfolio2 ]
        raise: Error
        withExceptionDo: [ :invalidPortfolio |
            self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ] ! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:27'!
test21TransferShouldWithdrawFromFromAccountAndDepositIntoToAccount

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert: -100 = fromAccount balance.
	self assert:  100 = toAccount balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:30:52'!
test21_01TransferIsReachedFromTransacctions

	| fromAccount toAccount transfer |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	transfer := Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert:  100 = transfer value.
	self assert: fromAccount transactions first transfer equals: transfer.
	self assert: toAccount transactions first transfer equals: transfer.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:27:01'!
test22AccountSummaryShouldProvideHumanReadableTransactionsDetail

	| fromAccount toAccount fromAccountLines toAccountLines|

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.
	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	
	fromAccountLines := self accountSummaryLinesOf: fromAccount.
	toAccountLines := self accountSummaryLinesOf: toAccount.
	
	self assert: 3 = fromAccountLines size.
	self assert: 'Deposito por 100' = (fromAccountLines at: 1).
	self assert: 'Extraccion por 50' = (fromAccountLines at: 2).
	self assert: 'Transferencia por -100' = (fromAccountLines at: 3).
	
	self assert: 1 = toAccountLines size.
	self assert: 'Transferencia por 100' = (toAccountLines at: 1).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test23ShouldBeAbleToBeQueryTransferNet

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test24CertificateOfDepositShouldWithdrawInvestmentValue

	| account toAccount |
	account := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 1000 on: account.
	Withdraw register: 50 on: account.
	Transfer register: 100 from: account to: toAccount.
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
		
	self assert: 100 =(self investmentNetOf:account).
	self assert: 750 = account balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test25ShouldBeAbleToQueryInvestmentEarnings

	| account investmentEarnings |
	account := ReceptiveAccount new. 
		
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
	CertificateOfDeposit register: 100 during: 60 at: 15/100 on: account.

	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).
		
	self assert: investmentEarnings = (self investmentEarningsOf: account).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 8/13/2017 18:37:21'!
test26AccountSummaryShouldWorkWithCertificateOfDeposit

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	lines := self accountSummaryLinesOf: fromAccount.
		
	self assert: 4 = lines size.
	self assert: 'Deposito por 100' =  (lines at: 1).
	self assert: 'Extraccion por 50' =  (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' = (lines at: 4).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test27ShouldBeAbleToBeQueryTransferNetWithCertificateOfDeposit

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:29'!
test28PortfolioTreePrinterPrintsTheCompositeInDepthFirstOrder

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self portofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: 'composedPortfolio' = (lines at: 1).
	self assert: ' complexPortfolio' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: '  account2' = (lines at: 4).
	self assert: ' account3' = (lines at: 5).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:30'!
test29ReversePortfolioTreePrinterPrintsTheCompositeStartingFromTheLeaves

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self reversePortofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: ' account3' = (lines at: 1).
	self assert: '  account2' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: ' complexPortfolio' = (lines at: 4).
	self assert: 'composedPortfolio' = (lines at: 5).
	! !


!PortfolioTest methodsFor: 'test support' stamp: 'JL 5/14/2018 18:54:56'!
accountSummaryLinesOf: aReceptiveAccount 
	
	^ (AccountSummary of: aReceptiveAccount) value
	! !

!PortfolioTest methodsFor: 'test support' stamp: 'JL 5/14/2018 19:27:29'!
accountTransferNetOf: aReceptiveAccount 
	
	^(AccountTransferNet of: aReceptiveAccount) value
! !

!PortfolioTest methodsFor: 'test support' stamp: 'JL 5/14/2018 20:01:05'!
investmentEarningsOf: aReceptiveAccount 
	
		^ (AccountInvestmentEarnings of: aReceptiveAccount) value! !

!PortfolioTest methodsFor: 'test support' stamp: 'JL 5/14/2018 19:36:43'!
investmentNetOf: aReceptiveAccount 
	
	^ (AccountInvestmentNet of: aReceptiveAccount) value! !

!PortfolioTest methodsFor: 'test support' stamp: 'JL 5/14/2018 20:56:05'!
portofolioTreeOf: aPortfolio namingAccountWith: aDictionary 
	
	^(PortfolioTree of: aPortfolio withNamingAccounts: aDictionary) value! !

!PortfolioTest methodsFor: 'test support' stamp: 'JL 5/16/2018 14:31:35'!
reversePortofolioTreeOf: aPortfolio namingAccountWith: aDictionary 
	
	^(self portofolioTreeOf: aPortfolio namingAccountWith: aDictionary) reverse.! !


!classDefinition: #AccountInvestmentEarnings category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountInvestmentEarnings
	instanceVariableNames: 'value account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:03:49'!
initializeOf: anAccount


		value := 0.
		account := anAccount! !

!AccountInvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'JL 5/17/2018 14:31:38'!
reportACertificateOfDeposit: aCertificateOfDeposit

	value := value + aCertificateOfDeposit earnings! !

!AccountInvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:05:32'!
reportADeposit: aDeposit! !

!AccountInvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:05:28'!
reportATransferDeposit: aTransferDeposit! !

!AccountInvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:05:23'!
reportATransferWithdraw: aTransferWithdraw! !

!AccountInvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:05:15'!
reportAWithdraw: aWithdraw! !

!AccountInvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:11:55'!
value


	account transactionsDo: [:aTransaction | aTransaction report: self].
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountInvestmentEarnings class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountInvestmentEarnings class
	instanceVariableNames: ''!

!AccountInvestmentEarnings class methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:02:07'!
of: anAccount

	^self new initializeOf: anAccount.! !


!classDefinition: #AccountInvestmentNet category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountInvestmentNet
	instanceVariableNames: 'account value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestmentNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:36:00'!
initializeOf: anAccount

	account := anAccount.
	value := 0.
	! !

!AccountInvestmentNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:45:42'!
reportACertificateOfDeposit: aCertificateOfDeposit

	value := value + aCertificateOfDeposit value! !

!AccountInvestmentNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:40:15'!
reportADeposit: aDeposit
! !

!AccountInvestmentNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:40:24'!
reportATransferDeposit: aTransferDeposit! !

!AccountInvestmentNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:40:35'!
reportATransferWithdraw: aTransferWithdraw! !

!AccountInvestmentNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:41:36'!
reportAWithdraw: aDeposit
! !

!AccountInvestmentNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:41:07'!
value

	account transactionsDo: [:aTransaction | aTransaction report: self].
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountInvestmentNet class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountInvestmentNet class
	instanceVariableNames: ''!

!AccountInvestmentNet class methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:34:57'!
of: anAccount

	^self new initializeOf: anAccount.! !


!classDefinition: #AccountSummary category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountSummary
	instanceVariableNames: 'reports lines account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 18:37:38'!
initializeOf: anAccount

	lines := OrderedCollection new.
	account := anAccount.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:37:31'!
reportACertificateOfDeposit: aCertificateOfDeposit

	|aCertOfDepValue aCertOfDepDays aCertOfDepTNA aPercentage |
	
	aCertOfDepValue := aCertificateOfDeposit value asString.
	aCertOfDepDays := aCertificateOfDeposit numberOfDays asString.
	aCertOfDepTNA := aCertificateOfDeposit tna.
	aPercentage := (100*(aCertOfDepTNA numerator)/ aCertOfDepTNA denominator) asString.

	^'Plazo fijo por ', aCertOfDepValue, ' durante ', 
		aCertOfDepDays, ' dias a una tna de ', 
		aPercentage, '%'.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 18:56:11'!
reportADeposit: aDeposit

	^'Deposito por ', (aDeposit value asString)! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 18:52:34'!
reportATransferDeposit: aTransferDeposit


	^'Transferencia por ', aTransferDeposit value asString! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 18:58:48'!
reportATransferWithdraw: aTransferWithdraw


	^'Transferencia por -', (aTransferWithdraw value asString)! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 18:57:47'!
reportAWithdraw: aWithdraw

	^'Extraccion por ', (aWithdraw value asString)! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 18:43:33'!
value

	account transactionsDo: [:aTransaction | lines add: (aTransaction report: self)].
	^lines.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 18:32:49'!
of: anAccount
	
	
	^ self new initializeOf: anAccount
	
	! !

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 21:13:29'!
summarizingLinesOf: anAccount
	
	
	^ (anAccount transactions) inject: OrderedCollection new into: [:aSummary :aTransaction | aSummary add: (aTransaction report). aSummary]
	! !


!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'evaluating' stamp: 'JL 5/10/2018 18:58:28'!
modifyBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'JL 5/10/2018 19:57:03'!
report

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'JL 5/14/2018 19:00:44'!
report: aReporter

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'JL 5/10/2018 20:51:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value tna numberOfDays account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/17/2018 14:31:07'!
earnings


	|aCertOfDepositValue aCertOfDepositRate aCertOfDepositDuration|
	
	aCertOfDepositValue := self value.
	aCertOfDepositRate := self tna.
	aCertOfDepositDuration := self numberOfDays.


	^aCertOfDepositValue * ((aCertOfDepositRate)/360)*aCertOfDepositDuration! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:38:15'!
modifyBalance: aBalance

	^aBalance - self value! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:11:15'!
numberOfDays

	^numberOfDays! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:10:49'!
register: anAmountOfMoney during: anAmountOfDays  at: aPercentage on: anAccount

	value := anAmountOfMoney.
	numberOfDays := anAmountOfDays.
	tna := aPercentage.
	account := anAccount.! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:38:01'!
report: aReporter

	^aReporter reportACertificateOfDeposit: self.! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:11:22'!
tna

	^tna! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:38:29'!
value

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:44:04'!
register: anAmountOfMoney during: anAmountOfDays  at: aPercentage on: anAccount

	|certOfDeposit|
	certOfDeposit := self new register: anAmountOfMoney during: anAmountOfDays  at: aPercentage on: anAccount.
	anAccount register: certOfDeposit.
	^ certOfDeposit.
! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'JL 5/10/2018 18:58:44'!
modifyBalance: aBalance

	^aBalance + self value! !

!Deposit methodsFor: 'value' stamp: 'JL 5/10/2018 21:07:11'!
report

	^ 'Deposito por ', (self value asString)! !

!Deposit methodsFor: 'value' stamp: 'JL 5/14/2018 18:56:24'!
report: aReporter

	^aReporter reportADeposit: self.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'JL 5/10/2018 20:56:44'!
register: aValue on: account

	| deposit |
	
	deposit := self for: aValue.
	account register: deposit.
		
	^ deposit! !


!classDefinition: #TransferDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 20:40:58'!
fromTransfer: aTransfer

	transfer := aTransfer
	
	! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 20:43:05'!
modifyBalance: aBalance

	^aBalance + self value! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 21:07:40'!
report

	^ 'Transferencia por ', transfer value asString! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 18:58:05'!
report: aReporter

	^aReporter reportATransferDeposit: self.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 20:44:03'!
value

	^ transfer value! !


!TransferDeposit methodsFor: 'events-old protocol' stamp: 'JL 5/10/2018 21:02:08'!
transfer
	
	^ transfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 20:40:09'!
registerOn: aReceptiveAccount fromTransfer: aTransfer

	| aTransferDeposit |

	aTransferDeposit := self new fromTransfer: aTransfer.

	aReceptiveAccount register: aTransferDeposit.
	
	^ aTransferDeposit	! !


!classDefinition: #TransferWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 20:41:46'!
fromTransfer: aTransfer

	transfer := aTransfer! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 20:43:18'!
modifyBalance: aBalance

	^aBalance - self value! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 21:07:54'!
report

	^ 'Transferencia por ', (-1 * transfer value) asString! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 18:58:00'!
report: aReporter

	^aReporter reportATransferWithdraw: self.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 20:44:10'!
value

	^ transfer value! !


!TransferWithdraw methodsFor: 'comparing' stamp: 'JL 5/10/2018 21:01:55'!
transfer
	
	^ transfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 20:42:18'!
registerOn: aReceptiveAccount fromTransfer: aTransfer

	| aTransferWithdraw |

	aTransferWithdraw := self new fromTransfer: aTransfer.

	aReceptiveAccount register: aTransferWithdraw.
	
	^ aTransferWithdraw	! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'JL 5/10/2018 18:58:52'!
modifyBalance: aBalance

	^aBalance - self value! !

!Withdraw methodsFor: 'value' stamp: 'JL 5/10/2018 21:08:06'!
report

	^ 'Extraccion por ', self value asString! !

!Withdraw methodsFor: 'value' stamp: 'JL 5/14/2018 18:56:57'!
report: aReporter

	^aReporter reportAWithdraw: self.! !

!Withdraw methodsFor: 'value' stamp: 'JL 5/10/2018 18:48:49'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'JL 5/10/2018 20:56:27'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #AccountTransferNet category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransferNet
	instanceVariableNames: 'account value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:02:58'!
initializeOf: anAccount

	account := anAccount.
	value := 0.	


	
	! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:38:58'!
reportACertificateOfDeposit: aCertificateOfDeposit! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:08:59'!
reportADeposit: aDeposit! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:09:58'!
reportATransferDeposit: aTransferDeposit

	value := value + aTransferDeposit value
! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:24:27'!
reportATransferWithdraw: aTransferWithdraw

	value := value - aTransferWithdraw value
! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:09:09'!
reportAWithdraw: aWithdraw! !

!AccountTransferNet methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:15:11'!
value

	account transactionsDo: [:aTransaction | (aTransaction report: self)].
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNet class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransferNet class
	instanceVariableNames: ''!

!AccountTransferNet class methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 21:26:51'!
accountTransferNetOf: anAccount

	|transferDepositNet  transferWithdrawNet depositBalance withdrawBalance|
	transferDepositNet := anAccount transactions select: [:aTransaction | (aTransaction isKindOf: TransferDeposit)].
	transferWithdrawNet := anAccount transactions select: [:aTransaction | (aTransaction isKindOf: TransferWithdraw)].
	depositBalance := transferDepositNet sum: [:transferDeposit | transferDeposit value].
	withdrawBalance := transferWithdrawNet sum: [:transferWithdraw | transferWithdraw value]..
	^ depositBalance -  withdrawBalance! !

!AccountTransferNet class methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 19:02:19'!
of: anAccount


	^ self new initializeOf: anAccount.
	! !


!classDefinition: #PortfolioTree category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #PortfolioTree
	instanceVariableNames: 'lines portfolio namingAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTree methodsFor: 'as yet unclassified' stamp: 'NL 5/14/2018 21:28:14'!
initializeOf: aPortfolio withNamingAccounts: aDictionary

	portfolio := aPortfolio.
	namingAccounts := aDictionary.
	! !

!PortfolioTree methodsFor: 'as yet unclassified' stamp: 'JL 5/15/2018 20:19:09'!
reportAPortfolio: aPortfolio

	| collection collectionRecursive |
	
	collection := OrderedCollection new.
	collection add: (namingAccounts at: aPortfolio).
	
	collectionRecursive := OrderedCollection new.
	aPortfolio accountsDo: [ :anAccount | collectionRecursive addAll: (anAccount report: self) ].
	
	collectionRecursive inject: collection into: [:aCollection :aLine |  aCollection add: (' ' , aLine). aCollection].
	
	^ collection! !

!PortfolioTree methodsFor: 'as yet unclassified' stamp: 'NL 5/14/2018 21:40:24'!
reportAReceptiveAccount: aReceptiveAccount

	| collection |
	
	collection := OrderedCollection new.
	
	collection add: (namingAccounts at: aReceptiveAccount).
	
	^ collection
	! !

!PortfolioTree methodsFor: 'as yet unclassified' stamp: 'NL 5/14/2018 21:41:02'!
value

	lines := portfolio report: self.
	^ lines! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTree class' category: #'PortfolioTreePrinter-Ejercicio'!
PortfolioTree class
	instanceVariableNames: ''!

!PortfolioTree class methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 20:56:57'!
of: aPortfolio withNamingAccounts: aDictionary

	^self new initializeOf: aPortfolio withNamingAccounts: aDictionary! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!
manages: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!
registers: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:26'!
anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount manages: anAccount) or: [ anAccount manages: managedAccount ] ] ! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:01'!
manages: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !

!Portfolio methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 19:20'!
registers: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount registers: aTransaction ]  ! !


!Portfolio methodsFor: 'transactions' stamp: 'JL 5/14/2018 21:04:13'!
accounts

	^accounts! !

!Portfolio methodsFor: 'transactions' stamp: 'JL 5/15/2018 20:21:08'!
accountsDo: aBlock

	^accounts do: [:anAccount | aBlock value: anAccount]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!
balance

	^ accounts sum: [ :account | account balance ]
! !

!Portfolio methodsFor: 'transactions' stamp: 'NL 5/14/2018 21:43:19'!
report: aReporter

	^ aReporter reportAPortfolio: self! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!
transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 19:27'!
transactionsOf: anAccount 

	^ (self manages: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'JL 5/7/2018 22:01:32'!
withAccount: anAccount1 andWithAccount: anAccount2

	accounts := OrderedCollection new.
	accounts add: anAccount1.
	(self manages: anAccount2) ifTrue: [^self error: self class accountAlreadyManagedErrorMessage].
	accounts add: anAccount2.! !


!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!
with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!
withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'JL 5/10/2018 19:03:04'!
balance

	^ transactions inject: 0 into: [ :balance :transaction | transaction modifyBalance: balance ]! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'NL 5/14/2018 21:43:35'!
report: aReporter

	^ aReporter reportAReceptiveAccount: self! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'JL 5/14/2018 18:47:51'!
transactionsDo: aBlock 

	^(self transactions) do: [:aTransaction | aBlock value: aTransaction].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
manages: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
registers: aTtransaction

	^ transactions includes: aTtransaction 
! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value from to transferDeposit transferWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'JL 5/14/2018 18:59:47'!
register: aValue from: aSenderAccount to: aReceptiveAccount

	value := aValue.
	from := aSenderAccount.
	to := aReceptiveAccount.
	transferDeposit := TransferDeposit registerOn: aReceptiveAccount fromTransfer: self.
	transferWithdraw := TransferWithdraw registerOn: aSenderAccount fromTransfer: self.
	! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'JL 5/10/2018 21:01:04'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'new transfer' stamp: 'JL 5/10/2018 20:00:34'!
register: aValue from: aReceptiveAccount to: anOtherReceptiveAccount
	
	^self new register: aValue from: aReceptiveAccount to: anOtherReceptiveAccount! !
