require 'xsd/qname'

# {urn:usaepay}AccountDetails
#   cardholderAuthentication - SOAP::SOAPString
#   checkPlatform - SOAP::SOAPString
#   creditCardPlatform - SOAP::SOAPString
#   debitCardSupport - SOAP::SOAPBoolean
#   directPayPlatform - SOAP::SOAPString
#   industry - SOAP::SOAPString
#   supportedCurrencies - CurrencyObjectArray
class AccountDetails
  attr_accessor :cardholderAuthentication
  attr_accessor :checkPlatform
  attr_accessor :creditCardPlatform
  attr_accessor :debitCardSupport
  attr_accessor :directPayPlatform
  attr_accessor :industry
  attr_accessor :supportedCurrencies

  def initialize(cardholderAuthentication = nil, checkPlatform = nil, creditCardPlatform = nil, debitCardSupport = nil, directPayPlatform = nil, industry = nil, supportedCurrencies = nil)
    @cardholderAuthentication = cardholderAuthentication
    @checkPlatform = checkPlatform
    @creditCardPlatform = creditCardPlatform
    @debitCardSupport = debitCardSupport
    @directPayPlatform = directPayPlatform
    @industry = industry
    @supportedCurrencies = supportedCurrencies
  end
end

# {urn:usaepay}Address
#   city - SOAP::SOAPString
#   company - SOAP::SOAPString
#   country - SOAP::SOAPString
#   email - SOAP::SOAPString
#   fax - SOAP::SOAPString
#   firstName - SOAP::SOAPString
#   lastName - SOAP::SOAPString
#   phone - SOAP::SOAPString
#   state - SOAP::SOAPString
#   street - SOAP::SOAPString
#   street2 - SOAP::SOAPString
#   zip - SOAP::SOAPString
class Address
  attr_accessor :city
  attr_accessor :company
  attr_accessor :country
  attr_accessor :email
  attr_accessor :fax
  attr_accessor :firstName
  attr_accessor :lastName
  attr_accessor :phone
  attr_accessor :state
  attr_accessor :street
  attr_accessor :street2
  attr_accessor :zip

  def initialize(city = nil, company = nil, country = nil, email = nil, fax = nil, firstName = nil, lastName = nil, phone = nil, state = nil, street = nil, street2 = nil, zip = nil)
    @city = city
    @company = company
    @country = country
    @email = email
    @fax = fax
    @firstName = firstName
    @lastName = lastName
    @phone = phone
    @state = state
    @street = street
    @street2 = street2
    @zip = zip
  end
end

# {urn:usaepay}Bank
#   code - SOAP::SOAPString
#   name - SOAP::SOAPString
class Bank
  attr_accessor :code
  attr_accessor :name

  def initialize(code = nil, name = nil)
    @code = code
    @name = name
  end
end

# {urn:usaepay}BatchSearchResult
#   batches - BatchStatusArray
#   batchesMatched - SOAP::SOAPInteger
#   batchesReturned - SOAP::SOAPInteger
#   limit - SOAP::SOAPInteger
#   startIndex - SOAP::SOAPInteger
class BatchSearchResult
  attr_accessor :batches
  attr_accessor :batchesMatched
  attr_accessor :batchesReturned
  attr_accessor :limit
  attr_accessor :startIndex

  def initialize(batches = nil, batchesMatched = nil, batchesReturned = nil, limit = nil, startIndex = nil)
    @batches = batches
    @batchesMatched = batchesMatched
    @batchesReturned = batchesReturned
    @limit = limit
    @startIndex = startIndex
  end
end

# {urn:usaepay}BatchStatus
#   batchRefNum - SOAP::SOAPInteger
#   closed - SOAP::SOAPString
#   creditsAmount - SOAP::SOAPDouble
#   creditsCount - SOAP::SOAPInteger
#   netAmount - SOAP::SOAPDouble
#   opened - SOAP::SOAPString
#   salesAmount - SOAP::SOAPDouble
#   salesCount - SOAP::SOAPInteger
#   scheduled - SOAP::SOAPString
#   sequence - SOAP::SOAPInteger
#   status - SOAP::SOAPString
#   transactionCount - SOAP::SOAPInteger
#   voidsAmount - SOAP::SOAPDouble
#   voidsCount - SOAP::SOAPInteger
class BatchStatus
  attr_accessor :batchRefNum
  attr_accessor :closed
  attr_accessor :creditsAmount
  attr_accessor :creditsCount
  attr_accessor :netAmount
  attr_accessor :opened
  attr_accessor :salesAmount
  attr_accessor :salesCount
  attr_accessor :scheduled
  attr_accessor :sequence
  attr_accessor :status
  attr_accessor :transactionCount
  attr_accessor :voidsAmount
  attr_accessor :voidsCount

  def initialize(batchRefNum = nil, closed = nil, creditsAmount = nil, creditsCount = nil, netAmount = nil, opened = nil, salesAmount = nil, salesCount = nil, scheduled = nil, sequence = nil, status = nil, transactionCount = nil, voidsAmount = nil, voidsCount = nil)
    @batchRefNum = batchRefNum
    @closed = closed
    @creditsAmount = creditsAmount
    @creditsCount = creditsCount
    @netAmount = netAmount
    @opened = opened
    @salesAmount = salesAmount
    @salesCount = salesCount
    @scheduled = scheduled
    @sequence = sequence
    @status = status
    @transactionCount = transactionCount
    @voidsAmount = voidsAmount
    @voidsCount = voidsCount
  end
end

# {urn:usaepay}BatchUploadStatus
#   approved - SOAP::SOAPInteger
#   uploadRefNum - SOAP::SOAPInteger
#   declined - SOAP::SOAPInteger
#   errors - SOAP::SOAPInteger
#   finished - SOAP::SOAPString
#   remaining - SOAP::SOAPInteger
#   started - SOAP::SOAPString
#   status - SOAP::SOAPString
#   transactions - SOAP::SOAPInteger
class BatchUploadStatus
  attr_accessor :approved
  attr_accessor :uploadRefNum
  attr_accessor :declined
  attr_accessor :errors
  attr_accessor :finished
  attr_accessor :remaining
  attr_accessor :started
  attr_accessor :status
  attr_accessor :transactions

  def initialize(approved = nil, uploadRefNum = nil, declined = nil, errors = nil, finished = nil, remaining = nil, started = nil, status = nil, transactions = nil)
    @approved = approved
    @uploadRefNum = uploadRefNum
    @declined = declined
    @errors = errors
    @finished = finished
    @remaining = remaining
    @started = started
    @status = status
    @transactions = transactions
  end
end

# {urn:usaepay}CheckData
#   account - SOAP::SOAPString
#   accountType - SOAP::SOAPString
#   checkNumber - SOAP::SOAPInteger
#   driversLicense - SOAP::SOAPString
#   driversLicenseState - SOAP::SOAPString
#   recordType - SOAP::SOAPString
#   routing - SOAP::SOAPString
#   auxOnUS - SOAP::SOAPString
#   epcCode - SOAP::SOAPString
#   frontImage - SOAP::SOAPString
#   backImage - SOAP::SOAPString
class CheckData
  attr_accessor :account
  attr_accessor :accountType
  attr_accessor :checkNumber
  attr_accessor :driversLicense
  attr_accessor :driversLicenseState
  attr_accessor :recordType
  attr_accessor :routing
  attr_accessor :auxOnUS
  attr_accessor :epcCode
  attr_accessor :frontImage
  attr_accessor :backImage

  def initialize(account = nil, accountType = nil, checkNumber = nil, driversLicense = nil, driversLicenseState = nil, recordType = nil, routing = nil, auxOnUS = nil, epcCode = nil, frontImage = nil, backImage = nil)
    @account = account
    @accountType = accountType
    @checkNumber = checkNumber
    @driversLicense = driversLicense
    @driversLicenseState = driversLicenseState
    @recordType = recordType
    @routing = routing
    @auxOnUS = auxOnUS
    @epcCode = epcCode
    @frontImage = frontImage
    @backImage = backImage
  end
end

# {urn:usaepay}CheckTrace
#   status - SOAP::SOAPString
#   statusCode - SOAP::SOAPString
#   bankNote - SOAP::SOAPString
#   effective - SOAP::SOAPString
#   processed - SOAP::SOAPString
#   returned - SOAP::SOAPString
#   returnCode - SOAP::SOAPString
#   reason - SOAP::SOAPString
#   settled - SOAP::SOAPString
#   trackingNum - SOAP::SOAPString
class CheckTrace
  attr_accessor :status
  attr_accessor :statusCode
  attr_accessor :bankNote
  attr_accessor :effective
  attr_accessor :processed
  attr_accessor :returned
  attr_accessor :returnCode
  attr_accessor :reason
  attr_accessor :settled
  attr_accessor :trackingNum

  def initialize(status = nil, statusCode = nil, bankNote = nil, effective = nil, processed = nil, returned = nil, returnCode = nil, reason = nil, settled = nil, trackingNum = nil)
    @status = status
    @statusCode = statusCode
    @bankNote = bankNote
    @effective = effective
    @processed = processed
    @returned = returned
    @returnCode = returnCode
    @reason = reason
    @settled = settled
    @trackingNum = trackingNum
  end
end

# {urn:usaepay}CreditCardData
#   avsStreet - SOAP::SOAPString
#   avsZip - SOAP::SOAPString
#   cardCode - SOAP::SOAPString
#   cardExpiration - SOAP::SOAPString
#   cardNumber - SOAP::SOAPString
#   cardPresent - SOAP::SOAPBoolean
#   cardType - SOAP::SOAPString
#   cAVV - SOAP::SOAPString
#   dUKPT - SOAP::SOAPString
#   eCI - SOAP::SOAPInteger
#   internalCardAuth - SOAP::SOAPBoolean
#   magStripe - SOAP::SOAPString
#   magSupport - SOAP::SOAPString
#   pares - SOAP::SOAPString
#   signature - SOAP::SOAPString
#   termType - SOAP::SOAPString
#   xID - SOAP::SOAPString
class CreditCardData
  attr_accessor :avsStreet
  attr_accessor :avsZip
  attr_accessor :cardCode
  attr_accessor :cardExpiration
  attr_accessor :cardNumber
  attr_accessor :cardPresent
  attr_accessor :cardType
  attr_accessor :cAVV
  attr_accessor :dUKPT
  attr_accessor :eCI
  attr_accessor :internalCardAuth
  attr_accessor :magStripe
  attr_accessor :magSupport
  attr_accessor :pares
  attr_accessor :signature
  attr_accessor :termType
  attr_accessor :xID

  def initialize(avsStreet = nil, avsZip = nil, cardCode = nil, cardExpiration = nil, cardNumber = nil, cardPresent = nil, cardType = nil, cAVV = nil, dUKPT = nil, eCI = nil, internalCardAuth = nil, magStripe = nil, magSupport = nil, pares = nil, signature = nil, termType = nil, xID = nil)
    @avsStreet = avsStreet
    @avsZip = avsZip
    @cardCode = cardCode
    @cardExpiration = cardExpiration
    @cardNumber = cardNumber
    @cardPresent = cardPresent
    @cardType = cardType
    @cAVV = cAVV
    @dUKPT = dUKPT
    @eCI = eCI
    @internalCardAuth = internalCardAuth
    @magStripe = magStripe
    @magSupport = magSupport
    @pares = pares
    @signature = signature
    @termType = termType
    @xID = xID
  end
end

# {urn:usaepay}CurrencyConversion
#   amount - SOAP::SOAPDouble
#   currency - SOAP::SOAPString
#   fromAmount - SOAP::SOAPDouble
#   fromCurrency - SOAP::SOAPString
#   rate - SOAP::SOAPDouble
class CurrencyConversion
  attr_accessor :amount
  attr_accessor :currency
  attr_accessor :fromAmount
  attr_accessor :fromCurrency
  attr_accessor :rate

  def initialize(amount = nil, currency = nil, fromAmount = nil, fromCurrency = nil, rate = nil)
    @amount = amount
    @currency = currency
    @fromAmount = fromAmount
    @fromCurrency = fromCurrency
    @rate = rate
  end
end

# {urn:usaepay}CurrencyObject
#   currency - SOAP::SOAPString
#   decimalPlaces - SOAP::SOAPInteger
#   numericCode - SOAP::SOAPInteger
#   rate - SOAP::SOAPDouble
#   textCode - SOAP::SOAPString
class CurrencyObject
  attr_accessor :currency
  attr_accessor :decimalPlaces
  attr_accessor :numericCode
  attr_accessor :rate
  attr_accessor :textCode

  def initialize(currency = nil, decimalPlaces = nil, numericCode = nil, rate = nil, textCode = nil)
    @currency = currency
    @decimalPlaces = decimalPlaces
    @numericCode = numericCode
    @rate = rate
    @textCode = textCode
  end
end

# {urn:usaepay}CustomerObject
#   amount - SOAP::SOAPDouble
#   billingAddress - Address
#   created - SOAP::SOAPDateTime
#   currency - SOAP::SOAPString
#   custNum - SOAP::SOAPString
#   customData - SOAP::SOAPString
#   customFields - FieldValueArray
#   customerID - SOAP::SOAPString
#   description - SOAP::SOAPString
#   enabled - SOAP::SOAPBoolean
#   failures - SOAP::SOAPInt
#   lookupCode - SOAP::SOAPString
#   modified - SOAP::SOAPDateTime
#   m_next - SOAP::SOAPString
#   notes - SOAP::SOAPString
#   numLeft - SOAP::SOAPInteger
#   orderID - SOAP::SOAPString
#   paymentMethods - PaymentMethodArray
#   priceTier - SOAP::SOAPString
#   receiptNote - SOAP::SOAPString
#   schedule - SOAP::SOAPString
#   sendReceipt - SOAP::SOAPBoolean
#   source - SOAP::SOAPString
#   tax - SOAP::SOAPDouble
#   taxClass - SOAP::SOAPString
#   user - SOAP::SOAPString
#   uRL - SOAP::SOAPString
class CustomerObject
  attr_accessor :amount
  attr_accessor :billingAddress
  attr_accessor :created
  attr_accessor :currency
  attr_accessor :custNum
  attr_accessor :customData
  attr_accessor :customFields
  attr_accessor :customerID
  attr_accessor :description
  attr_accessor :enabled
  attr_accessor :failures
  attr_accessor :lookupCode
  attr_accessor :modified
  attr_accessor :notes
  attr_accessor :numLeft
  attr_accessor :orderID
  attr_accessor :paymentMethods
  attr_accessor :priceTier
  attr_accessor :receiptNote
  attr_accessor :schedule
  attr_accessor :sendReceipt
  attr_accessor :source
  attr_accessor :tax
  attr_accessor :taxClass
  attr_accessor :user
  attr_accessor :uRL

  def m_next
    @v_next
  end

  def m_next=(value)
    @v_next = value
  end

  def initialize(amount = nil, billingAddress = nil, created = nil, currency = nil, custNum = nil, customData = nil, customFields = nil, customerID = nil, description = nil, enabled = nil, failures = nil, lookupCode = nil, modified = nil, v_next = nil, notes = nil, numLeft = nil, orderID = nil, paymentMethods = nil, priceTier = nil, receiptNote = nil, schedule = nil, sendReceipt = nil, source = nil, tax = nil, taxClass = nil, user = nil, uRL = nil)
    @amount = amount
    @billingAddress = billingAddress
    @created = created
    @currency = currency
    @custNum = custNum
    @customData = customData
    @customFields = customFields
    @customerID = customerID
    @description = description
    @enabled = enabled
    @failures = failures
    @lookupCode = lookupCode
    @modified = modified
    @v_next = v_next
    @notes = notes
    @numLeft = numLeft
    @orderID = orderID
    @paymentMethods = paymentMethods
    @priceTier = priceTier
    @receiptNote = receiptNote
    @schedule = schedule
    @sendReceipt = sendReceipt
    @source = source
    @tax = tax
    @taxClass = taxClass
    @user = user
    @uRL = uRL
  end
end

# {urn:usaepay}CustomerSearchResult
#   customers - CustomerObjectArray
#   customersMatched - SOAP::SOAPInteger
#   customersReturned - SOAP::SOAPInteger
#   limit - SOAP::SOAPInteger
#   startIndex - SOAP::SOAPInteger
class CustomerSearchResult
  attr_accessor :customers
  attr_accessor :customersMatched
  attr_accessor :customersReturned
  attr_accessor :limit
  attr_accessor :startIndex

  def initialize(customers = nil, customersMatched = nil, customersReturned = nil, limit = nil, startIndex = nil)
    @customers = customers
    @customersMatched = customersMatched
    @customersReturned = customersReturned
    @limit = limit
    @startIndex = startIndex
  end
end

# {urn:usaepay}CustomerTransactionRequest
#   command - SOAP::SOAPString
#   cardCode - SOAP::SOAPString
#   clientIP - SOAP::SOAPString
#   customFields - FieldValueArray
#   custReceipt - SOAP::SOAPBoolean
#   custReceiptEmail - SOAP::SOAPString
#   custReceiptName - SOAP::SOAPString
#   merchReceipt - SOAP::SOAPBoolean
#   merchReceiptEmail - SOAP::SOAPString
#   merchReceiptName - SOAP::SOAPString
#   details - TransactionDetail
#   ignoreDuplicate - SOAP::SOAPBoolean
#   isRecurring - SOAP::SOAPBoolean
#   lineItems - LineItemArray
#   software - SOAP::SOAPString
class CustomerTransactionRequest
  attr_accessor :command
  attr_accessor :cardCode
  attr_accessor :clientIP
  attr_accessor :customFields
  attr_accessor :custReceipt
  attr_accessor :custReceiptEmail
  attr_accessor :custReceiptName
  attr_accessor :merchReceipt
  attr_accessor :merchReceiptEmail
  attr_accessor :merchReceiptName
  attr_accessor :details
  attr_accessor :ignoreDuplicate
  attr_accessor :isRecurring
  attr_accessor :lineItems
  attr_accessor :software

  def initialize(command = nil, cardCode = nil, clientIP = nil, customFields = nil, custReceipt = nil, custReceiptEmail = nil, custReceiptName = nil, merchReceipt = nil, merchReceiptEmail = nil, merchReceiptName = nil, details = nil, ignoreDuplicate = nil, isRecurring = nil, lineItems = nil, software = nil)
    @command = command
    @cardCode = cardCode
    @clientIP = clientIP
    @customFields = customFields
    @custReceipt = custReceipt
    @custReceiptEmail = custReceiptEmail
    @custReceiptName = custReceiptName
    @merchReceipt = merchReceipt
    @merchReceiptEmail = merchReceiptEmail
    @merchReceiptName = merchReceiptName
    @details = details
    @ignoreDuplicate = ignoreDuplicate
    @isRecurring = isRecurring
    @lineItems = lineItems
    @software = software
  end
end

# {urn:usaepay}FieldValue
#   field - SOAP::SOAPString
#   value - SOAP::SOAPString
class FieldValue
  attr_accessor :field
  attr_accessor :value

  def initialize(field = nil, value = nil)
    @field = field
    @value = value
  end
end

# {urn:usaepay}LineItem
#   productRefNum - SOAP::SOAPString
#   sKU - SOAP::SOAPString
#   productName - SOAP::SOAPString
#   description - SOAP::SOAPString
#   unitPrice - SOAP::SOAPString
#   qty - SOAP::SOAPString
#   taxable - SOAP::SOAPBoolean
class LineItem
  attr_accessor :productRefNum
  attr_accessor :sKU
  attr_accessor :productName
  attr_accessor :description
  attr_accessor :unitPrice
  attr_accessor :qty
  attr_accessor :taxable

  def initialize(productRefNum = nil, sKU = nil, productName = nil, description = nil, unitPrice = nil, qty = nil, taxable = nil)
    @productRefNum = productRefNum
    @sKU = sKU
    @productName = productName
    @description = description
    @unitPrice = unitPrice
    @qty = qty
    @taxable = taxable
  end
end

# {urn:usaepay}PaymentMethod
#   methodType - SOAP::SOAPString
#   methodID - SOAP::SOAPInteger
#   methodName - SOAP::SOAPString
#   secondarySort - SOAP::SOAPInteger
#   created - SOAP::SOAPDateTime
#   modified - SOAP::SOAPDateTime
#   account - SOAP::SOAPString
#   accountType - SOAP::SOAPString
#   driversLicense - SOAP::SOAPString
#   driversLicenseState - SOAP::SOAPString
#   recordType - SOAP::SOAPString
#   routing - SOAP::SOAPString
#   avsStreet - SOAP::SOAPString
#   avsZip - SOAP::SOAPString
#   cardCode - SOAP::SOAPString
#   cardExpiration - SOAP::SOAPString
#   cardNumber - SOAP::SOAPString
#   cardType - SOAP::SOAPString
#   balance - SOAP::SOAPDouble
#   maxBalance - SOAP::SOAPDouble
#   autoReload - SOAP::SOAPString
#   reloadSchedule - SOAP::SOAPString
#   reloadThreshold - SOAP::SOAPString
#   reloadAmount - SOAP::SOAPString
#   reloadMethodID - SOAP::SOAPInteger
class PaymentMethod
  attr_accessor :methodType
  attr_accessor :methodID
  attr_accessor :methodName
  attr_accessor :secondarySort
  attr_accessor :created
  attr_accessor :modified
  attr_accessor :account
  attr_accessor :accountType
  attr_accessor :driversLicense
  attr_accessor :driversLicenseState
  attr_accessor :recordType
  attr_accessor :routing
  attr_accessor :avsStreet
  attr_accessor :avsZip
  attr_accessor :cardCode
  attr_accessor :cardExpiration
  attr_accessor :cardNumber
  attr_accessor :cardType
  attr_accessor :balance
  attr_accessor :maxBalance
  attr_accessor :autoReload
  attr_accessor :reloadSchedule
  attr_accessor :reloadThreshold
  attr_accessor :reloadAmount
  attr_accessor :reloadMethodID

  def initialize(methodType = nil, methodID = nil, methodName = nil, secondarySort = nil, created = nil, modified = nil, account = nil, accountType = nil, driversLicense = nil, driversLicenseState = nil, recordType = nil, routing = nil, avsStreet = nil, avsZip = nil, cardCode = nil, cardExpiration = nil, cardNumber = nil, cardType = nil, balance = nil, maxBalance = nil, autoReload = nil, reloadSchedule = nil, reloadThreshold = nil, reloadAmount = nil, reloadMethodID = nil)
    @methodType = methodType
    @methodID = methodID
    @methodName = methodName
    @secondarySort = secondarySort
    @created = created
    @modified = modified
    @account = account
    @accountType = accountType
    @driversLicense = driversLicense
    @driversLicenseState = driversLicenseState
    @recordType = recordType
    @routing = routing
    @avsStreet = avsStreet
    @avsZip = avsZip
    @cardCode = cardCode
    @cardExpiration = cardExpiration
    @cardNumber = cardNumber
    @cardType = cardType
    @balance = balance
    @maxBalance = maxBalance
    @autoReload = autoReload
    @reloadSchedule = reloadSchedule
    @reloadThreshold = reloadThreshold
    @reloadAmount = reloadAmount
    @reloadMethodID = reloadMethodID
  end
end

# {urn:usaepay}PriceTier
#   qty - SOAP::SOAPString
#   price - SOAP::SOAPString
#   customerTier - SOAP::SOAPString
class PriceTier
  attr_accessor :qty
  attr_accessor :price
  attr_accessor :customerTier

  def initialize(qty = nil, price = nil, customerTier = nil)
    @qty = qty
    @price = price
    @customerTier = customerTier
  end
end

# {urn:usaepay}Product
#   productRefNum - SOAP::SOAPString
#   productID - SOAP::SOAPString
#   sKU - SOAP::SOAPString
#   uPC - SOAP::SOAPString
#   category - SOAP::SOAPString
#   enabled - SOAP::SOAPBoolean
#   name - SOAP::SOAPString
#   description - SOAP::SOAPString
#   model - SOAP::SOAPString
#   weight - SOAP::SOAPDouble
#   shipWeight - SOAP::SOAPDouble
#   price - SOAP::SOAPDouble
#   wholesalePrice - SOAP::SOAPDouble
#   listPrice - SOAP::SOAPDouble
#   dateAvailable - SOAP::SOAPString
#   manufacturer - SOAP::SOAPString
#   physicalGood - SOAP::SOAPBoolean
#   taxClass - SOAP::SOAPString
#   minQuantity - SOAP::SOAPInteger
#   imageURL - SOAP::SOAPString
#   uRL - SOAP::SOAPString
#   created - SOAP::SOAPDateTime
#   modified - SOAP::SOAPDateTime
#   inventory - ProductInventoryArray
#   priceTiers - PriceTierArray
class Product
  attr_accessor :productRefNum
  attr_accessor :productID
  attr_accessor :sKU
  attr_accessor :uPC
  attr_accessor :category
  attr_accessor :enabled
  attr_accessor :name
  attr_accessor :description
  attr_accessor :model
  attr_accessor :weight
  attr_accessor :shipWeight
  attr_accessor :price
  attr_accessor :wholesalePrice
  attr_accessor :listPrice
  attr_accessor :dateAvailable
  attr_accessor :manufacturer
  attr_accessor :physicalGood
  attr_accessor :taxClass
  attr_accessor :minQuantity
  attr_accessor :imageURL
  attr_accessor :uRL
  attr_accessor :created
  attr_accessor :modified
  attr_accessor :inventory
  attr_accessor :priceTiers

  def initialize(productRefNum = nil, productID = nil, sKU = nil, uPC = nil, category = nil, enabled = nil, name = nil, description = nil, model = nil, weight = nil, shipWeight = nil, price = nil, wholesalePrice = nil, listPrice = nil, dateAvailable = nil, manufacturer = nil, physicalGood = nil, taxClass = nil, minQuantity = nil, imageURL = nil, uRL = nil, created = nil, modified = nil, inventory = nil, priceTiers = nil)
    @productRefNum = productRefNum
    @productID = productID
    @sKU = sKU
    @uPC = uPC
    @category = category
    @enabled = enabled
    @name = name
    @description = description
    @model = model
    @weight = weight
    @shipWeight = shipWeight
    @price = price
    @wholesalePrice = wholesalePrice
    @listPrice = listPrice
    @dateAvailable = dateAvailable
    @manufacturer = manufacturer
    @physicalGood = physicalGood
    @taxClass = taxClass
    @minQuantity = minQuantity
    @imageURL = imageURL
    @uRL = uRL
    @created = created
    @modified = modified
    @inventory = inventory
    @priceTiers = priceTiers
  end
end

# {urn:usaepay}ProductCategory
#   productCategoryRefNum - SOAP::SOAPString
#   name - SOAP::SOAPString
#   created - SOAP::SOAPDateTime
#   modified - SOAP::SOAPDateTime
class ProductCategory
  attr_accessor :productCategoryRefNum
  attr_accessor :name
  attr_accessor :created
  attr_accessor :modified

  def initialize(productCategoryRefNum = nil, name = nil, created = nil, modified = nil)
    @productCategoryRefNum = productCategoryRefNum
    @name = name
    @created = created
    @modified = modified
  end
end

# {urn:usaepay}ProductInventory
#   inventoryLocation - SOAP::SOAPString
#   qtyOnHand - SOAP::SOAPString
#   qtyOnOrder - SOAP::SOAPString
#   dateAvailable - SOAP::SOAPString
class ProductInventory
  attr_accessor :inventoryLocation
  attr_accessor :qtyOnHand
  attr_accessor :qtyOnOrder
  attr_accessor :dateAvailable

  def initialize(inventoryLocation = nil, qtyOnHand = nil, qtyOnOrder = nil, dateAvailable = nil)
    @inventoryLocation = inventoryLocation
    @qtyOnHand = qtyOnHand
    @qtyOnOrder = qtyOnOrder
    @dateAvailable = dateAvailable
  end
end

# {urn:usaepay}ProductSearchResult
#   products - ProductArray
#   productsMatched - SOAP::SOAPInteger
#   productsReturned - SOAP::SOAPInteger
#   limit - SOAP::SOAPInteger
#   startIndex - SOAP::SOAPInteger
class ProductSearchResult
  attr_accessor :products
  attr_accessor :productsMatched
  attr_accessor :productsReturned
  attr_accessor :limit
  attr_accessor :startIndex

  def initialize(products = nil, productsMatched = nil, productsReturned = nil, limit = nil, startIndex = nil)
    @products = products
    @productsMatched = productsMatched
    @productsReturned = productsReturned
    @limit = limit
    @startIndex = startIndex
  end
end

# {urn:usaepay}Receipt
#   receiptRefNum - SOAP::SOAPInteger
#   name - SOAP::SOAPString
#   subject - SOAP::SOAPString
#   fromEmail - SOAP::SOAPString
#   target - SOAP::SOAPString
#   contentType - SOAP::SOAPString
#   templateHTML - SOAP::SOAPString
#   templateText - SOAP::SOAPString
class Receipt
  attr_accessor :receiptRefNum
  attr_accessor :name
  attr_accessor :subject
  attr_accessor :fromEmail
  attr_accessor :target
  attr_accessor :contentType
  attr_accessor :templateHTML
  attr_accessor :templateText

  def initialize(receiptRefNum = nil, name = nil, subject = nil, fromEmail = nil, target = nil, contentType = nil, templateHTML = nil, templateText = nil)
    @receiptRefNum = receiptRefNum
    @name = name
    @subject = subject
    @fromEmail = fromEmail
    @target = target
    @contentType = contentType
    @templateHTML = templateHTML
    @templateText = templateText
  end
end

# {urn:usaepay}RecurringBilling
#   amount - SOAP::SOAPDouble
#   enabled - SOAP::SOAPBoolean
#   expire - SOAP::SOAPString
#   m_next - SOAP::SOAPString
#   numLeft - SOAP::SOAPInteger
#   schedule - SOAP::SOAPString
class RecurringBilling
  attr_accessor :amount
  attr_accessor :enabled
  attr_accessor :expire
  attr_accessor :numLeft
  attr_accessor :schedule

  def m_next
    @v_next
  end

  def m_next=(value)
    @v_next = value
  end

  def initialize(amount = nil, enabled = nil, expire = nil, v_next = nil, numLeft = nil, schedule = nil)
    @amount = amount
    @enabled = enabled
    @expire = expire
    @v_next = v_next
    @numLeft = numLeft
    @schedule = schedule
  end
end

# {urn:usaepay}SearchParam
#   field - SOAP::SOAPString
#   type - SOAP::SOAPString
#   value - SOAP::SOAPString
class SearchParam
  attr_accessor :field
  attr_accessor :type
  attr_accessor :value

  def initialize(field = nil, type = nil, value = nil)
    @field = field
    @type = type
    @value = value
  end
end

# {urn:usaepay}SyncLog
#   syncPosition - SOAP::SOAPInteger
#   objectName - SOAP::SOAPString
#   refNum - SOAP::SOAPString
#   changeDate - SOAP::SOAPDateTime
#   action - SOAP::SOAPString
class SyncLog
  attr_accessor :syncPosition
  attr_accessor :objectName
  attr_accessor :refNum
  attr_accessor :changeDate
  attr_accessor :action

  def initialize(syncPosition = nil, objectName = nil, refNum = nil, changeDate = nil, action = nil)
    @syncPosition = syncPosition
    @objectName = objectName
    @refNum = refNum
    @changeDate = changeDate
    @action = action
  end
end

# {urn:usaepay}SystemInfo
#   apiVersion - SOAP::SOAPString
#   environment - SOAP::SOAPString
#   datacenter - SOAP::SOAPString
#   time - SOAP::SOAPString
class SystemInfo
  attr_accessor :apiVersion
  attr_accessor :environment
  attr_accessor :datacenter
  attr_accessor :time

  def initialize(apiVersion = nil, environment = nil, datacenter = nil, time = nil)
    @apiVersion = apiVersion
    @environment = environment
    @datacenter = datacenter
    @time = time
  end
end

# {urn:usaepay}TransactionDetail
#   allowPartialAuth - SOAP::SOAPBoolean
#   amount - SOAP::SOAPDouble
#   clerk - SOAP::SOAPString
#   currency - SOAP::SOAPString
#   description - SOAP::SOAPString
#   comments - SOAP::SOAPString
#   discount - SOAP::SOAPDouble
#   invoice - SOAP::SOAPString
#   nonTax - SOAP::SOAPBoolean
#   orderID - SOAP::SOAPString
#   pONum - SOAP::SOAPString
#   shipping - SOAP::SOAPDouble
#   subtotal - SOAP::SOAPDouble
#   table - SOAP::SOAPString
#   tax - SOAP::SOAPDouble
#   terminal - SOAP::SOAPString
#   tip - SOAP::SOAPDouble
class TransactionDetail
  attr_accessor :allowPartialAuth
  attr_accessor :amount
  attr_accessor :clerk
  attr_accessor :currency
  attr_accessor :description
  attr_accessor :comments
  attr_accessor :discount
  attr_accessor :invoice
  attr_accessor :nonTax
  attr_accessor :orderID
  attr_accessor :pONum
  attr_accessor :shipping
  attr_accessor :subtotal
  attr_accessor :table
  attr_accessor :tax
  attr_accessor :terminal
  attr_accessor :tip

  def initialize(allowPartialAuth = nil, amount = nil, clerk = nil, currency = nil, description = nil, comments = nil, discount = nil, invoice = nil, nonTax = nil, orderID = nil, pONum = nil, shipping = nil, subtotal = nil, table = nil, tax = nil, terminal = nil, tip = nil)
    @allowPartialAuth = allowPartialAuth
    @amount = amount
    @clerk = clerk
    @currency = currency
    @description = description
    @comments = comments
    @discount = discount
    @invoice = invoice
    @nonTax = nonTax
    @orderID = orderID
    @pONum = pONum
    @shipping = shipping
    @subtotal = subtotal
    @table = table
    @tax = tax
    @terminal = terminal
    @tip = tip
  end
end

# {urn:usaepay}TransactionObject
#   accountHolder - SOAP::SOAPString
#   billingAddress - Address
#   checkData - CheckData
#   checkTrace - CheckTrace
#   clientIP - SOAP::SOAPString
#   creditCardData - CreditCardData
#   customerID - SOAP::SOAPString
#   customFields - FieldValueArray
#   dateTime - SOAP::SOAPString
#   details - TransactionDetail
#   lineItems - LineItemArray
#   response - TransactionResponse
#   serverIP - SOAP::SOAPString
#   shippingAddress - Address
#   source - SOAP::SOAPString
#   status - SOAP::SOAPString
#   transactionType - SOAP::SOAPString
#   user - SOAP::SOAPString
class TransactionObject
  attr_accessor :accountHolder
  attr_accessor :billingAddress
  attr_accessor :checkData
  attr_accessor :checkTrace
  attr_accessor :clientIP
  attr_accessor :creditCardData
  attr_accessor :customerID
  attr_accessor :customFields
  attr_accessor :dateTime
  attr_accessor :details
  attr_accessor :lineItems
  attr_accessor :response
  attr_accessor :serverIP
  attr_accessor :shippingAddress
  attr_accessor :source
  attr_accessor :status
  attr_accessor :transactionType
  attr_accessor :user

  def initialize(accountHolder = nil, billingAddress = nil, checkData = nil, checkTrace = nil, clientIP = nil, creditCardData = nil, customerID = nil, customFields = nil, dateTime = nil, details = nil, lineItems = nil, response = nil, serverIP = nil, shippingAddress = nil, source = nil, status = nil, transactionType = nil, user = nil)
    @accountHolder = accountHolder
    @billingAddress = billingAddress
    @checkData = checkData
    @checkTrace = checkTrace
    @clientIP = clientIP
    @creditCardData = creditCardData
    @customerID = customerID
    @customFields = customFields
    @dateTime = dateTime
    @details = details
    @lineItems = lineItems
    @response = response
    @serverIP = serverIP
    @shippingAddress = shippingAddress
    @source = source
    @status = status
    @transactionType = transactionType
    @user = user
  end
end

# {urn:usaepay}TransactionRequestObject
#   accountHolder - SOAP::SOAPString
#   authCode - SOAP::SOAPString
#   billingAddress - Address
#   checkData - CheckData
#   clientIP - SOAP::SOAPString
#   command - SOAP::SOAPString
#   creditCardData - CreditCardData
#   customerID - SOAP::SOAPString
#   customFields - FieldValueArray
#   custReceipt - SOAP::SOAPBoolean
#   custReceiptName - SOAP::SOAPString
#   details - TransactionDetail
#   ignoreDuplicate - SOAP::SOAPBoolean
#   lineItems - LineItemArray
#   recurringBilling - RecurringBilling
#   refNum - SOAP::SOAPString
#   shippingAddress - Address
#   software - SOAP::SOAPString
class TransactionRequestObject
  attr_accessor :accountHolder
  attr_accessor :authCode
  attr_accessor :billingAddress
  attr_accessor :checkData
  attr_accessor :clientIP
  attr_accessor :command
  attr_accessor :creditCardData
  attr_accessor :customerID
  attr_accessor :customFields
  attr_accessor :custReceipt
  attr_accessor :custReceiptName
  attr_accessor :details
  attr_accessor :ignoreDuplicate
  attr_accessor :lineItems
  attr_accessor :recurringBilling
  attr_accessor :refNum
  attr_accessor :shippingAddress
  attr_accessor :software

  def initialize(accountHolder = nil, authCode = nil, billingAddress = nil, checkData = nil, clientIP = nil, command = nil, creditCardData = nil, customerID = nil, customFields = nil, custReceipt = nil, custReceiptName = nil, details = nil, ignoreDuplicate = nil, lineItems = nil, recurringBilling = nil, refNum = nil, shippingAddress = nil, software = nil)
    @accountHolder = accountHolder
    @authCode = authCode
    @billingAddress = billingAddress
    @checkData = checkData
    @clientIP = clientIP
    @command = command
    @creditCardData = creditCardData
    @customerID = customerID
    @customFields = customFields
    @custReceipt = custReceipt
    @custReceiptName = custReceiptName
    @details = details
    @ignoreDuplicate = ignoreDuplicate
    @lineItems = lineItems
    @recurringBilling = recurringBilling
    @refNum = refNum
    @shippingAddress = shippingAddress
    @software = software
  end
end

# {urn:usaepay}TransactionResponse
#   acsUrl - SOAP::SOAPString
#   authAmount - SOAP::SOAPDouble
#   authCode - SOAP::SOAPString
#   avsResult - SOAP::SOAPString
#   avsResultCode - SOAP::SOAPString
#   batchNum - SOAP::SOAPInteger
#   batchRefNum - SOAP::SOAPInteger
#   cardCodeResult - SOAP::SOAPString
#   cardCodeResultCode - SOAP::SOAPString
#   cardLevelResult - SOAP::SOAPString
#   cardLevelResultCode - SOAP::SOAPString
#   conversionRate - SOAP::SOAPDouble
#   convertedAmount - SOAP::SOAPDouble
#   convertedAmountCurrency - SOAP::SOAPString
#   custNum - SOAP::SOAPInteger
#   error - SOAP::SOAPString
#   errorCode - SOAP::SOAPInteger
#   isDuplicate - SOAP::SOAPBoolean
#   payload - SOAP::SOAPString
#   refNum - SOAP::SOAPInteger
#   remainingBalance - SOAP::SOAPDouble
#   result - SOAP::SOAPString
#   resultCode - SOAP::SOAPString
#   status - SOAP::SOAPString
#   statusCode - SOAP::SOAPString
#   vpasResultCode - SOAP::SOAPString
class TransactionResponse
  attr_accessor :acsUrl
  attr_accessor :authAmount
  attr_accessor :authCode
  attr_accessor :avsResult
  attr_accessor :avsResultCode
  attr_accessor :batchNum
  attr_accessor :batchRefNum
  attr_accessor :cardCodeResult
  attr_accessor :cardCodeResultCode
  attr_accessor :cardLevelResult
  attr_accessor :cardLevelResultCode
  attr_accessor :conversionRate
  attr_accessor :convertedAmount
  attr_accessor :convertedAmountCurrency
  attr_accessor :custNum
  attr_accessor :error
  attr_accessor :errorCode
  attr_accessor :isDuplicate
  attr_accessor :payload
  attr_accessor :refNum
  attr_accessor :remainingBalance
  attr_accessor :result
  attr_accessor :resultCode
  attr_accessor :status
  attr_accessor :statusCode
  attr_accessor :vpasResultCode

  def initialize(acsUrl = nil, authAmount = nil, authCode = nil, avsResult = nil, avsResultCode = nil, batchNum = nil, batchRefNum = nil, cardCodeResult = nil, cardCodeResultCode = nil, cardLevelResult = nil, cardLevelResultCode = nil, conversionRate = nil, convertedAmount = nil, convertedAmountCurrency = nil, custNum = nil, error = nil, errorCode = nil, isDuplicate = nil, payload = nil, refNum = nil, remainingBalance = nil, result = nil, resultCode = nil, status = nil, statusCode = nil, vpasResultCode = nil)
    @acsUrl = acsUrl
    @authAmount = authAmount
    @authCode = authCode
    @avsResult = avsResult
    @avsResultCode = avsResultCode
    @batchNum = batchNum
    @batchRefNum = batchRefNum
    @cardCodeResult = cardCodeResult
    @cardCodeResultCode = cardCodeResultCode
    @cardLevelResult = cardLevelResult
    @cardLevelResultCode = cardLevelResultCode
    @conversionRate = conversionRate
    @convertedAmount = convertedAmount
    @convertedAmountCurrency = convertedAmountCurrency
    @custNum = custNum
    @error = error
    @errorCode = errorCode
    @isDuplicate = isDuplicate
    @payload = payload
    @refNum = refNum
    @remainingBalance = remainingBalance
    @result = result
    @resultCode = resultCode
    @status = status
    @statusCode = statusCode
    @vpasResultCode = vpasResultCode
  end
end

# {urn:usaepay}TransactionSearchResult
#   authOnlyAmount - SOAP::SOAPFloat
#   authOnlyCount - SOAP::SOAPInteger
#   creditsAmount - SOAP::SOAPFloat
#   creditsCount - SOAP::SOAPInteger
#   declinesAmount - SOAP::SOAPFloat
#   declinesCount - SOAP::SOAPInteger
#   errorsAmount - SOAP::SOAPFloat
#   errorsCount - SOAP::SOAPInteger
#   limit - SOAP::SOAPInteger
#   salesAmount - SOAP::SOAPFloat
#   salesCount - SOAP::SOAPInteger
#   startIndex - SOAP::SOAPInteger
#   transactions - TransactionObjectArray
#   transactionsMatched - SOAP::SOAPInteger
#   transactionsReturned - SOAP::SOAPInteger
#   voidsAmount - SOAP::SOAPFloat
#   voidsCount - SOAP::SOAPInteger
class TransactionSearchResult
  attr_accessor :authOnlyAmount
  attr_accessor :authOnlyCount
  attr_accessor :creditsAmount
  attr_accessor :creditsCount
  attr_accessor :declinesAmount
  attr_accessor :declinesCount
  attr_accessor :errorsAmount
  attr_accessor :errorsCount
  attr_accessor :limit
  attr_accessor :salesAmount
  attr_accessor :salesCount
  attr_accessor :startIndex
  attr_accessor :transactions
  attr_accessor :transactionsMatched
  attr_accessor :transactionsReturned
  attr_accessor :voidsAmount
  attr_accessor :voidsCount

  def initialize(authOnlyAmount = nil, authOnlyCount = nil, creditsAmount = nil, creditsCount = nil, declinesAmount = nil, declinesCount = nil, errorsAmount = nil, errorsCount = nil, limit = nil, salesAmount = nil, salesCount = nil, startIndex = nil, transactions = nil, transactionsMatched = nil, transactionsReturned = nil, voidsAmount = nil, voidsCount = nil)
    @authOnlyAmount = authOnlyAmount
    @authOnlyCount = authOnlyCount
    @creditsAmount = creditsAmount
    @creditsCount = creditsCount
    @declinesAmount = declinesAmount
    @declinesCount = declinesCount
    @errorsAmount = errorsAmount
    @errorsCount = errorsCount
    @limit = limit
    @salesAmount = salesAmount
    @salesCount = salesCount
    @startIndex = startIndex
    @transactions = transactions
    @transactionsMatched = transactionsMatched
    @transactionsReturned = transactionsReturned
    @voidsAmount = voidsAmount
    @voidsCount = voidsCount
  end
end

# {urn:usaepay}ueHash
#   hashValue - SOAP::SOAPString
#   seed - SOAP::SOAPString
#   type - SOAP::SOAPString
class UeHash
  attr_accessor :hashValue
  attr_accessor :seed
  attr_accessor :type

  def initialize(hashValue = nil, seed = nil, type = nil)
    @hashValue = hashValue
    @seed = seed
    @type = type
  end
end

# {urn:usaepay}ueSecurityToken
#   clientIP - SOAP::SOAPString
#   pinHash - UeHash
#   sourceKey - SOAP::SOAPString
class UeSecurityToken
  attr_accessor :clientIP
  attr_accessor :pinHash
  attr_accessor :sourceKey

  def initialize(clientIP = nil, pinHash = nil, sourceKey = nil)
    @clientIP = clientIP
    @pinHash = pinHash
    @sourceKey = sourceKey
  end
end

# {urn:usaepay}BankArray
class BankArray < ::Array
end

# {urn:usaepay}BatchStatusArray
class BatchStatusArray < ::Array
end

# {urn:usaepay}CurrencyConversionArray
class CurrencyConversionArray < ::Array
end

# {urn:usaepay}CurrencyObjectArray
class CurrencyObjectArray < ::Array
end

# {urn:usaepay}CustomerObjectArray
class CustomerObjectArray < ::Array
end

# {urn:usaepay}doubleArray
class DoubleArray < ::Array
end

# {urn:usaepay}FieldValueArray
class FieldValueArray < ::Array
end

# {urn:usaepay}LineItemArray
class LineItemArray < ::Array
end

# {urn:usaepay}PaymentMethodArray
class PaymentMethodArray < ::Array
end

# {urn:usaepay}PriceTierArray
class PriceTierArray < ::Array
end

# {urn:usaepay}ProductArray
class ProductArray < ::Array
end

# {urn:usaepay}ProductCategoryArray
class ProductCategoryArray < ::Array
end

# {urn:usaepay}ProductInventoryArray
class ProductInventoryArray < ::Array
end

# {urn:usaepay}ReceiptArray
class ReceiptArray < ::Array
end

# {urn:usaepay}SearchParamArray
class SearchParamArray < ::Array
end

# {urn:usaepay}stringArray
class StringArray < ::Array
end

# {urn:usaepay}SyncLogArray
class SyncLogArray < ::Array
end

# {urn:usaepay}TransactionObjectArray
class TransactionObjectArray < ::Array
end
