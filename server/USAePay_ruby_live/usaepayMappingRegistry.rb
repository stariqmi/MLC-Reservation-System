require_relative 'usaepay.rb'
require 'soap/mapping'

module UsaepayMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsUsaepay = "urn:usaepay"

  EncodedRegistry.register(
    :class => AccountDetails,
    :schema_type => XSD::QName.new(NsUsaepay, "AccountDetails"),
    :schema_element => [
      ["cardholderAuthentication", ["SOAP::SOAPString", XSD::QName.new(nil, "CardholderAuthentication")]],
      ["checkPlatform", ["SOAP::SOAPString", XSD::QName.new(nil, "CheckPlatform")]],
      ["creditCardPlatform", ["SOAP::SOAPString", XSD::QName.new(nil, "CreditCardPlatform")]],
      ["debitCardSupport", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "DebitCardSupport")]],
      ["directPayPlatform", ["SOAP::SOAPString", XSD::QName.new(nil, "DirectPayPlatform")]],
      ["industry", ["SOAP::SOAPString", XSD::QName.new(nil, "Industry")]],
      ["supportedCurrencies", ["CurrencyObjectArray", XSD::QName.new(nil, "SupportedCurrencies")]]
    ]
  )

  EncodedRegistry.register(
    :class => Address,
    :schema_type => XSD::QName.new(NsUsaepay, "Address"),
    :schema_element => [
      ["city", ["SOAP::SOAPString", XSD::QName.new(nil, "City")], [0, 1]],
      ["company", ["SOAP::SOAPString", XSD::QName.new(nil, "Company")], [0, 1]],
      ["country", ["SOAP::SOAPString", XSD::QName.new(nil, "Country")], [0, 1]],
      ["email", ["SOAP::SOAPString", XSD::QName.new(nil, "Email")], [0, 1]],
      ["fax", ["SOAP::SOAPString", XSD::QName.new(nil, "Fax")], [0, 1]],
      ["firstName", ["SOAP::SOAPString", XSD::QName.new(nil, "FirstName")], [0, 1]],
      ["lastName", ["SOAP::SOAPString", XSD::QName.new(nil, "LastName")], [0, 1]],
      ["phone", ["SOAP::SOAPString", XSD::QName.new(nil, "Phone")], [0, 1]],
      ["state", ["SOAP::SOAPString", XSD::QName.new(nil, "State")], [0, 1]],
      ["street", ["SOAP::SOAPString", XSD::QName.new(nil, "Street")], [0, 1]],
      ["street2", ["SOAP::SOAPString", XSD::QName.new(nil, "Street2")], [0, 1]],
      ["zip", ["SOAP::SOAPString", XSD::QName.new(nil, "Zip")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => Bank,
    :schema_type => XSD::QName.new(NsUsaepay, "Bank"),
    :schema_element => [
      ["code", ["SOAP::SOAPString", XSD::QName.new(nil, "Code")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "Name")]]
    ]
  )

  EncodedRegistry.set(
    BankArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "Bank") }
  )

  EncodedRegistry.register(
    :class => BatchSearchResult,
    :schema_type => XSD::QName.new(NsUsaepay, "BatchSearchResult"),
    :schema_element => [
      ["batches", ["BatchStatusArray", XSD::QName.new(nil, "Batches")]],
      ["batchesMatched", ["SOAP::SOAPInteger", XSD::QName.new(nil, "BatchesMatched")]],
      ["batchesReturned", ["SOAP::SOAPInteger", XSD::QName.new(nil, "BatchesReturned")]],
      ["limit", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Limit")]],
      ["startIndex", ["SOAP::SOAPInteger", XSD::QName.new(nil, "StartIndex")]]
    ]
  )

  EncodedRegistry.register(
    :class => BatchStatus,
    :schema_type => XSD::QName.new(NsUsaepay, "BatchStatus"),
    :schema_element => [
      ["batchRefNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "BatchRefNum")]],
      ["closed", ["SOAP::SOAPString", XSD::QName.new(nil, "Closed")]],
      ["creditsAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "CreditsAmount")]],
      ["creditsCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CreditsCount")]],
      ["netAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "NetAmount")]],
      ["opened", ["SOAP::SOAPString", XSD::QName.new(nil, "Opened")]],
      ["salesAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "SalesAmount")]],
      ["salesCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SalesCount")]],
      ["scheduled", ["SOAP::SOAPString", XSD::QName.new(nil, "Scheduled")]],
      ["sequence", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Sequence")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "Status")]],
      ["transactionCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "TransactionCount")]],
      ["voidsAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "VoidsAmount")]],
      ["voidsCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "VoidsCount")]]
    ]
  )

  EncodedRegistry.set(
    BatchStatusArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "BatchStatus") }
  )

  EncodedRegistry.register(
    :class => BatchUploadStatus,
    :schema_type => XSD::QName.new(NsUsaepay, "BatchUploadStatus"),
    :schema_element => [
      ["approved", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Approved")]],
      ["uploadRefNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "UploadRefNum")]],
      ["declined", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Declined")]],
      ["errors", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Errors")]],
      ["finished", ["SOAP::SOAPString", XSD::QName.new(nil, "Finished")]],
      ["remaining", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Remaining")]],
      ["started", ["SOAP::SOAPString", XSD::QName.new(nil, "Started")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "Status")]],
      ["transactions", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Transactions")]]
    ]
  )

  EncodedRegistry.register(
    :class => CheckData,
    :schema_type => XSD::QName.new(NsUsaepay, "CheckData"),
    :schema_element => [
      ["account", ["SOAP::SOAPString", XSD::QName.new(nil, "Account")]],
      ["accountType", ["SOAP::SOAPString", XSD::QName.new(nil, "AccountType")], [0, 1]],
      ["checkNumber", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CheckNumber")], [0, 1]],
      ["driversLicense", ["SOAP::SOAPString", XSD::QName.new(nil, "DriversLicense")], [0, 1]],
      ["driversLicenseState", ["SOAP::SOAPString", XSD::QName.new(nil, "DriversLicenseState")], [0, 1]],
      ["recordType", ["SOAP::SOAPString", XSD::QName.new(nil, "RecordType")], [0, 1]],
      ["routing", ["SOAP::SOAPString", XSD::QName.new(nil, "Routing")]],
      ["auxOnUS", ["SOAP::SOAPString", XSD::QName.new(nil, "AuxOnUS")], [0, 1]],
      ["epcCode", ["SOAP::SOAPString", XSD::QName.new(nil, "EpcCode")], [0, 1]],
      ["frontImage", ["SOAP::SOAPString", XSD::QName.new(nil, "FrontImage")], [0, 1]],
      ["backImage", ["SOAP::SOAPString", XSD::QName.new(nil, "BackImage")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => CheckTrace,
    :schema_type => XSD::QName.new(NsUsaepay, "CheckTrace"),
    :schema_element => [
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "Status")], [0, 1]],
      ["statusCode", ["SOAP::SOAPString", XSD::QName.new(nil, "StatusCode")], [0, 1]],
      ["bankNote", ["SOAP::SOAPString", XSD::QName.new(nil, "BankNote")], [0, 1]],
      ["effective", ["SOAP::SOAPString", XSD::QName.new(nil, "Effective")], [0, 1]],
      ["processed", ["SOAP::SOAPString", XSD::QName.new(nil, "Processed")], [0, 1]],
      ["returned", ["SOAP::SOAPString", XSD::QName.new(nil, "Returned")], [0, 1]],
      ["returnCode", ["SOAP::SOAPString", XSD::QName.new(nil, "ReturnCode")], [0, 1]],
      ["reason", ["SOAP::SOAPString", XSD::QName.new(nil, "Reason")], [0, 1]],
      ["settled", ["SOAP::SOAPString", XSD::QName.new(nil, "Settled")], [0, 1]],
      ["trackingNum", ["SOAP::SOAPString", XSD::QName.new(nil, "TrackingNum")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => CreditCardData,
    :schema_type => XSD::QName.new(NsUsaepay, "CreditCardData"),
    :schema_element => [
      ["avsStreet", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsStreet")], [0, 1]],
      ["avsZip", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsZip")], [0, 1]],
      ["cardCode", ["SOAP::SOAPString", XSD::QName.new(nil, "CardCode")], [0, 1]],
      ["cardExpiration", ["SOAP::SOAPString", XSD::QName.new(nil, "CardExpiration")], [0, 1]],
      ["cardNumber", ["SOAP::SOAPString", XSD::QName.new(nil, "CardNumber")], [0, 1]],
      ["cardPresent", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "CardPresent")], [0, 1]],
      ["cardType", ["SOAP::SOAPString", XSD::QName.new(nil, "CardType")], [0, 1]],
      ["cAVV", ["SOAP::SOAPString", XSD::QName.new(nil, "CAVV")], [0, 1]],
      ["dUKPT", ["SOAP::SOAPString", XSD::QName.new(nil, "DUKPT")], [0, 1]],
      ["eCI", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ECI")], [0, 1]],
      ["internalCardAuth", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "InternalCardAuth")], [0, 1]],
      ["magStripe", ["SOAP::SOAPString", XSD::QName.new(nil, "MagStripe")], [0, 1]],
      ["magSupport", ["SOAP::SOAPString", XSD::QName.new(nil, "MagSupport")], [0, 1]],
      ["pares", ["SOAP::SOAPString", XSD::QName.new(nil, "Pares")], [0, 1]],
      ["signature", ["SOAP::SOAPString", XSD::QName.new(nil, "Signature")], [0, 1]],
      ["termType", ["SOAP::SOAPString", XSD::QName.new(nil, "TermType")], [0, 1]],
      ["xID", ["SOAP::SOAPString", XSD::QName.new(nil, "XID")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => CurrencyConversion,
    :schema_type => XSD::QName.new(NsUsaepay, "CurrencyConversion"),
    :schema_element => [
      ["amount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Amount")]],
      ["currency", ["SOAP::SOAPString", XSD::QName.new(nil, "Currency")]],
      ["fromAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "FromAmount")]],
      ["fromCurrency", ["SOAP::SOAPString", XSD::QName.new(nil, "FromCurrency")]],
      ["rate", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Rate")]]
    ]
  )

  EncodedRegistry.set(
    CurrencyConversionArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "CurrencyConversion") }
  )

  EncodedRegistry.register(
    :class => CurrencyObject,
    :schema_type => XSD::QName.new(NsUsaepay, "CurrencyObject"),
    :schema_element => [
      ["currency", ["SOAP::SOAPString", XSD::QName.new(nil, "Currency")]],
      ["decimalPlaces", ["SOAP::SOAPInteger", XSD::QName.new(nil, "DecimalPlaces")]],
      ["numericCode", ["SOAP::SOAPInteger", XSD::QName.new(nil, "NumericCode")]],
      ["rate", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Rate")]],
      ["textCode", ["SOAP::SOAPString", XSD::QName.new(nil, "TextCode")]]
    ]
  )

  EncodedRegistry.set(
    CurrencyObjectArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "CurrencyObject") }
  )

  EncodedRegistry.register(
    :class => CustomerObject,
    :schema_type => XSD::QName.new(NsUsaepay, "CustomerObject"),
    :schema_element => [
      ["amount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Amount")]],
      ["billingAddress", ["Address", XSD::QName.new(nil, "BillingAddress")]],
      ["created", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Created")], [0, 1]],
      ["currency", ["SOAP::SOAPString", XSD::QName.new(nil, "Currency")], [0, 1]],
      ["custNum", ["SOAP::SOAPString", XSD::QName.new(nil, "CustNum")], [0, 1]],
      ["customData", ["SOAP::SOAPString", XSD::QName.new(nil, "CustomData")], [0, 1]],
      ["customFields", ["FieldValueArray", XSD::QName.new(nil, "CustomFields")], [0, 1]],
      ["customerID", ["SOAP::SOAPString", XSD::QName.new(nil, "CustomerID")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "Description")]],
      ["enabled", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "Enabled")]],
      ["failures", ["SOAP::SOAPInt", XSD::QName.new(nil, "Failures")], [0, 1]],
      ["lookupCode", ["SOAP::SOAPString", XSD::QName.new(nil, "LookupCode")], [0, 1]],
      ["modified", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Modified")], [0, 1]],
      ["v_next", ["SOAP::SOAPString", XSD::QName.new(nil, "Next")]],
      ["notes", ["SOAP::SOAPString", XSD::QName.new(nil, "Notes")], [0, 1]],
      ["numLeft", ["SOAP::SOAPInteger", XSD::QName.new(nil, "NumLeft")]],
      ["orderID", ["SOAP::SOAPString", XSD::QName.new(nil, "OrderID")]],
      ["paymentMethods", ["PaymentMethodArray", XSD::QName.new(nil, "PaymentMethods")], [0, 1]],
      ["priceTier", ["SOAP::SOAPString", XSD::QName.new(nil, "PriceTier")], [0, 1]],
      ["receiptNote", ["SOAP::SOAPString", XSD::QName.new(nil, "ReceiptNote")]],
      ["schedule", ["SOAP::SOAPString", XSD::QName.new(nil, "Schedule")]],
      ["sendReceipt", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "SendReceipt")]],
      ["source", ["SOAP::SOAPString", XSD::QName.new(nil, "Source")], [0, 1]],
      ["tax", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Tax")], [0, 1]],
      ["taxClass", ["SOAP::SOAPString", XSD::QName.new(nil, "TaxClass")], [0, 1]],
      ["user", ["SOAP::SOAPString", XSD::QName.new(nil, "User")], [0, 1]],
      ["uRL", ["SOAP::SOAPString", XSD::QName.new(nil, "URL")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    CustomerObjectArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "CustomerObject") }
  )

  EncodedRegistry.register(
    :class => CustomerSearchResult,
    :schema_type => XSD::QName.new(NsUsaepay, "CustomerSearchResult"),
    :schema_element => [
      ["customers", ["CustomerObjectArray", XSD::QName.new(nil, "Customers")]],
      ["customersMatched", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CustomersMatched")]],
      ["customersReturned", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CustomersReturned")]],
      ["limit", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Limit")]],
      ["startIndex", ["SOAP::SOAPInteger", XSD::QName.new(nil, "StartIndex")]]
    ]
  )

  EncodedRegistry.register(
    :class => CustomerTransactionRequest,
    :schema_type => XSD::QName.new(NsUsaepay, "CustomerTransactionRequest"),
    :schema_element => [
      ["command", ["SOAP::SOAPString", XSD::QName.new(nil, "Command")]],
      ["cardCode", ["SOAP::SOAPString", XSD::QName.new(nil, "CardCode")], [0, 1]],
      ["clientIP", ["SOAP::SOAPString", XSD::QName.new(nil, "ClientIP")], [0, 1]],
      ["customFields", ["FieldValueArray", XSD::QName.new(nil, "CustomFields")], [0, 1]],
      ["custReceipt", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "CustReceipt")], [0, 1]],
      ["custReceiptEmail", ["SOAP::SOAPString", XSD::QName.new(nil, "CustReceiptEmail")], [0, 1]],
      ["custReceiptName", ["SOAP::SOAPString", XSD::QName.new(nil, "CustReceiptName")], [0, 1]],
      ["merchReceipt", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "MerchReceipt")], [0, 1]],
      ["merchReceiptEmail", ["SOAP::SOAPString", XSD::QName.new(nil, "MerchReceiptEmail")], [0, 1]],
      ["merchReceiptName", ["SOAP::SOAPString", XSD::QName.new(nil, "MerchReceiptName")], [0, 1]],
      ["details", ["TransactionDetail", XSD::QName.new(nil, "Details")]],
      ["ignoreDuplicate", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "IgnoreDuplicate")], [0, 1]],
      ["isRecurring", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "isRecurring")], [0, 1]],
      ["lineItems", ["LineItemArray", XSD::QName.new(nil, "LineItems")], [0, 1]],
      ["software", ["SOAP::SOAPString", XSD::QName.new(nil, "Software")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    DoubleArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "double") }
  )

  EncodedRegistry.register(
    :class => FieldValue,
    :schema_type => XSD::QName.new(NsUsaepay, "FieldValue"),
    :schema_element => [
      ["field", ["SOAP::SOAPString", XSD::QName.new(nil, "Field")]],
      ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "Value")]]
    ]
  )

  EncodedRegistry.set(
    FieldValueArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "FieldValue") }
  )

  EncodedRegistry.register(
    :class => LineItem,
    :schema_type => XSD::QName.new(NsUsaepay, "LineItem"),
    :schema_element => [
      ["productRefNum", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductRefNum")], [0, 1]],
      ["sKU", ["SOAP::SOAPString", XSD::QName.new(nil, "SKU")], [0, 1]],
      ["productName", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductName")], [0, 1]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "Description")], [0, 1]],
      ["unitPrice", ["SOAP::SOAPString", XSD::QName.new(nil, "UnitPrice")]],
      ["qty", ["SOAP::SOAPString", XSD::QName.new(nil, "Qty")]],
      ["taxable", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "Taxable")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    LineItemArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "LineItem") }
  )

  EncodedRegistry.register(
    :class => PaymentMethod,
    :schema_type => XSD::QName.new(NsUsaepay, "PaymentMethod"),
    :schema_element => [
      ["methodType", ["SOAP::SOAPString", XSD::QName.new(nil, "MethodType")], [0, 1]],
      ["methodID", ["SOAP::SOAPInteger", XSD::QName.new(nil, "MethodID")], [0, 1]],
      ["methodName", ["SOAP::SOAPString", XSD::QName.new(nil, "MethodName")]],
      ["secondarySort", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SecondarySort")]],
      ["created", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Created")], [0, 1]],
      ["modified", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Modified")], [0, 1]],
      ["account", ["SOAP::SOAPString", XSD::QName.new(nil, "Account")], [0, 1]],
      ["accountType", ["SOAP::SOAPString", XSD::QName.new(nil, "AccountType")], [0, 1]],
      ["driversLicense", ["SOAP::SOAPString", XSD::QName.new(nil, "DriversLicense")], [0, 1]],
      ["driversLicenseState", ["SOAP::SOAPString", XSD::QName.new(nil, "DriversLicenseState")], [0, 1]],
      ["recordType", ["SOAP::SOAPString", XSD::QName.new(nil, "RecordType")], [0, 1]],
      ["routing", ["SOAP::SOAPString", XSD::QName.new(nil, "Routing")], [0, 1]],
      ["avsStreet", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsStreet")], [0, 1]],
      ["avsZip", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsZip")], [0, 1]],
      ["cardCode", ["SOAP::SOAPString", XSD::QName.new(nil, "CardCode")], [0, 1]],
      ["cardExpiration", ["SOAP::SOAPString", XSD::QName.new(nil, "CardExpiration")], [0, 1]],
      ["cardNumber", ["SOAP::SOAPString", XSD::QName.new(nil, "CardNumber")], [0, 1]],
      ["cardType", ["SOAP::SOAPString", XSD::QName.new(nil, "CardType")], [0, 1]],
      ["balance", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Balance")], [0, 1]],
      ["maxBalance", ["SOAP::SOAPDouble", XSD::QName.new(nil, "MaxBalance")], [0, 1]],
      ["autoReload", ["SOAP::SOAPString", XSD::QName.new(nil, "AutoReload")], [0, 1]],
      ["reloadSchedule", ["SOAP::SOAPString", XSD::QName.new(nil, "ReloadSchedule")], [0, 1]],
      ["reloadThreshold", ["SOAP::SOAPString", XSD::QName.new(nil, "ReloadThreshold")], [0, 1]],
      ["reloadAmount", ["SOAP::SOAPString", XSD::QName.new(nil, "ReloadAmount")], [0, 1]],
      ["reloadMethodID", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ReloadMethodID")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    PaymentMethodArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "PaymentMethod") }
  )

  EncodedRegistry.register(
    :class => PriceTier,
    :schema_type => XSD::QName.new(NsUsaepay, "PriceTier"),
    :schema_element => [
      ["qty", ["SOAP::SOAPString", XSD::QName.new(nil, "Qty")]],
      ["price", ["SOAP::SOAPString", XSD::QName.new(nil, "Price")]],
      ["customerTier", ["SOAP::SOAPString", XSD::QName.new(nil, "CustomerTier")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    PriceTierArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "PriceTier") }
  )

  EncodedRegistry.register(
    :class => Product,
    :schema_type => XSD::QName.new(NsUsaepay, "Product"),
    :schema_element => [
      ["productRefNum", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductRefNum")], [0, 1]],
      ["productID", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductID")]],
      ["sKU", ["SOAP::SOAPString", XSD::QName.new(nil, "SKU")], [0, 1]],
      ["uPC", ["SOAP::SOAPString", XSD::QName.new(nil, "UPC")], [0, 1]],
      ["category", ["SOAP::SOAPString", XSD::QName.new(nil, "Category")]],
      ["enabled", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "Enabled")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "Name")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "Description")], [0, 1]],
      ["model", ["SOAP::SOAPString", XSD::QName.new(nil, "Model")], [0, 1]],
      ["weight", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Weight")], [0, 1]],
      ["shipWeight", ["SOAP::SOAPDouble", XSD::QName.new(nil, "ShipWeight")], [0, 1]],
      ["price", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Price")]],
      ["wholesalePrice", ["SOAP::SOAPDouble", XSD::QName.new(nil, "WholesalePrice")], [0, 1]],
      ["listPrice", ["SOAP::SOAPDouble", XSD::QName.new(nil, "ListPrice")], [0, 1]],
      ["dateAvailable", ["SOAP::SOAPString", XSD::QName.new(nil, "DateAvailable")], [0, 1]],
      ["manufacturer", ["SOAP::SOAPString", XSD::QName.new(nil, "Manufacturer")], [0, 1]],
      ["physicalGood", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "PhysicalGood")], [0, 1]],
      ["taxClass", ["SOAP::SOAPString", XSD::QName.new(nil, "TaxClass")], [0, 1]],
      ["minQuantity", ["SOAP::SOAPInteger", XSD::QName.new(nil, "MinQuantity")], [0, 1]],
      ["imageURL", ["SOAP::SOAPString", XSD::QName.new(nil, "ImageURL")], [0, 1]],
      ["uRL", ["SOAP::SOAPString", XSD::QName.new(nil, "URL")], [0, 1]],
      ["created", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Created")], [0, 1]],
      ["modified", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Modified")], [0, 1]],
      ["inventory", ["ProductInventoryArray", XSD::QName.new(nil, "Inventory")], [0, 1]],
      ["priceTiers", ["PriceTierArray", XSD::QName.new(nil, "PriceTiers")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    ProductArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "Product") }
  )

  EncodedRegistry.register(
    :class => ProductCategory,
    :schema_type => XSD::QName.new(NsUsaepay, "ProductCategory"),
    :schema_element => [
      ["productCategoryRefNum", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductCategoryRefNum")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "Name")]],
      ["created", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Created")], [0, 1]],
      ["modified", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Modified")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    ProductCategoryArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "ProductCategory") }
  )

  EncodedRegistry.register(
    :class => ProductInventory,
    :schema_type => XSD::QName.new(NsUsaepay, "ProductInventory"),
    :schema_element => [
      ["inventoryLocation", ["SOAP::SOAPString", XSD::QName.new(nil, "InventoryLocation")], [0, 1]],
      ["qtyOnHand", ["SOAP::SOAPString", XSD::QName.new(nil, "QtyOnHand")]],
      ["qtyOnOrder", ["SOAP::SOAPString", XSD::QName.new(nil, "QtyOnOrder")], [0, 1]],
      ["dateAvailable", ["SOAP::SOAPString", XSD::QName.new(nil, "DateAvailable")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    ProductInventoryArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "ProductInventory") }
  )

  EncodedRegistry.register(
    :class => ProductSearchResult,
    :schema_type => XSD::QName.new(NsUsaepay, "ProductSearchResult"),
    :schema_element => [
      ["products", ["ProductArray", XSD::QName.new(nil, "Products")]],
      ["productsMatched", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ProductsMatched")]],
      ["productsReturned", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ProductsReturned")]],
      ["limit", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Limit")]],
      ["startIndex", ["SOAP::SOAPInteger", XSD::QName.new(nil, "StartIndex")]]
    ]
  )

  EncodedRegistry.register(
    :class => Receipt,
    :schema_type => XSD::QName.new(NsUsaepay, "Receipt"),
    :schema_element => [
      ["receiptRefNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ReceiptRefNum")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "Name")]],
      ["subject", ["SOAP::SOAPString", XSD::QName.new(nil, "Subject")], [0, 1]],
      ["fromEmail", ["SOAP::SOAPString", XSD::QName.new(nil, "FromEmail")], [0, 1]],
      ["target", ["SOAP::SOAPString", XSD::QName.new(nil, "Target")]],
      ["contentType", ["SOAP::SOAPString", XSD::QName.new(nil, "ContentType")]],
      ["templateHTML", ["SOAP::SOAPString", XSD::QName.new(nil, "TemplateHTML")], [0, 1]],
      ["templateText", ["SOAP::SOAPString", XSD::QName.new(nil, "TemplateText")], [0, 1]]
    ]
  )

  EncodedRegistry.set(
    ReceiptArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "Receipt") }
  )

  EncodedRegistry.register(
    :class => RecurringBilling,
    :schema_type => XSD::QName.new(NsUsaepay, "RecurringBilling"),
    :schema_element => [
      ["amount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Amount")]],
      ["enabled", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "Enabled")]],
      ["expire", ["SOAP::SOAPString", XSD::QName.new(nil, "Expire")], [0, 1]],
      ["v_next", ["SOAP::SOAPString", XSD::QName.new(nil, "Next")]],
      ["numLeft", ["SOAP::SOAPInteger", XSD::QName.new(nil, "NumLeft")]],
      ["schedule", ["SOAP::SOAPString", XSD::QName.new(nil, "Schedule")]]
    ]
  )

  EncodedRegistry.register(
    :class => SearchParam,
    :schema_type => XSD::QName.new(NsUsaepay, "SearchParam"),
    :schema_element => [
      ["field", ["SOAP::SOAPString", XSD::QName.new(nil, "Field")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "Type")]],
      ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "Value")]]
    ]
  )

  EncodedRegistry.set(
    SearchParamArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "SearchParam") }
  )

  EncodedRegistry.set(
    StringArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "string") }
  )

  EncodedRegistry.register(
    :class => SyncLog,
    :schema_type => XSD::QName.new(NsUsaepay, "SyncLog"),
    :schema_element => [
      ["syncPosition", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SyncPosition")]],
      ["objectName", ["SOAP::SOAPString", XSD::QName.new(nil, "ObjectName")]],
      ["refNum", ["SOAP::SOAPString", XSD::QName.new(nil, "RefNum")]],
      ["changeDate", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "ChangeDate")]],
      ["action", ["SOAP::SOAPString", XSD::QName.new(nil, "Action")]]
    ]
  )

  EncodedRegistry.set(
    SyncLogArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "SyncLog") }
  )

  EncodedRegistry.register(
    :class => SystemInfo,
    :schema_type => XSD::QName.new(NsUsaepay, "SystemInfo"),
    :schema_element => [
      ["apiVersion", ["SOAP::SOAPString", XSD::QName.new(nil, "ApiVersion")]],
      ["environment", ["SOAP::SOAPString", XSD::QName.new(nil, "Environment")]],
      ["datacenter", ["SOAP::SOAPString", XSD::QName.new(nil, "Datacenter")]],
      ["time", ["SOAP::SOAPString", XSD::QName.new(nil, "Time")]]
    ]
  )

  EncodedRegistry.register(
    :class => TransactionDetail,
    :schema_type => XSD::QName.new(NsUsaepay, "TransactionDetail"),
    :schema_element => [
      ["allowPartialAuth", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "AllowPartialAuth")], [0, 1]],
      ["amount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Amount")], [0, 1]],
      ["clerk", ["SOAP::SOAPString", XSD::QName.new(nil, "Clerk")], [0, 1]],
      ["currency", ["SOAP::SOAPString", XSD::QName.new(nil, "Currency")], [0, 1]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "Description")], [0, 1]],
      ["comments", ["SOAP::SOAPString", XSD::QName.new(nil, "Comments")], [0, 1]],
      ["discount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Discount")], [0, 1]],
      ["invoice", ["SOAP::SOAPString", XSD::QName.new(nil, "Invoice")], [0, 1]],
      ["nonTax", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "NonTax")], [0, 1]],
      ["orderID", ["SOAP::SOAPString", XSD::QName.new(nil, "OrderID")], [0, 1]],
      ["pONum", ["SOAP::SOAPString", XSD::QName.new(nil, "PONum")], [0, 1]],
      ["shipping", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Shipping")], [0, 1]],
      ["subtotal", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Subtotal")], [0, 1]],
      ["table", ["SOAP::SOAPString", XSD::QName.new(nil, "Table")], [0, 1]],
      ["tax", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Tax")], [0, 1]],
      ["terminal", ["SOAP::SOAPString", XSD::QName.new(nil, "Terminal")], [0, 1]],
      ["tip", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Tip")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => TransactionObject,
    :schema_type => XSD::QName.new(NsUsaepay, "TransactionObject"),
    :schema_element => [
      ["accountHolder", ["SOAP::SOAPString", XSD::QName.new(nil, "AccountHolder")]],
      ["billingAddress", ["Address", XSD::QName.new(nil, "BillingAddress")]],
      ["checkData", ["CheckData", XSD::QName.new(nil, "CheckData")]],
      ["checkTrace", ["CheckTrace", XSD::QName.new(nil, "CheckTrace")]],
      ["clientIP", ["SOAP::SOAPString", XSD::QName.new(nil, "ClientIP")]],
      ["creditCardData", ["CreditCardData", XSD::QName.new(nil, "CreditCardData")]],
      ["customerID", ["SOAP::SOAPString", XSD::QName.new(nil, "CustomerID")]],
      ["customFields", ["FieldValueArray", XSD::QName.new(nil, "CustomFields")]],
      ["dateTime", ["SOAP::SOAPString", XSD::QName.new(nil, "DateTime")]],
      ["details", ["TransactionDetail", XSD::QName.new(nil, "Details")]],
      ["lineItems", ["LineItemArray", XSD::QName.new(nil, "LineItems")], [0, 1]],
      ["response", ["TransactionResponse", XSD::QName.new(nil, "Response")]],
      ["serverIP", ["SOAP::SOAPString", XSD::QName.new(nil, "ServerIP")]],
      ["shippingAddress", ["Address", XSD::QName.new(nil, "ShippingAddress")]],
      ["source", ["SOAP::SOAPString", XSD::QName.new(nil, "Source")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "Status")]],
      ["transactionType", ["SOAP::SOAPString", XSD::QName.new(nil, "TransactionType")]],
      ["user", ["SOAP::SOAPString", XSD::QName.new(nil, "User")]]
    ]
  )

  EncodedRegistry.set(
    TransactionObjectArray,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsUsaepay, "TransactionObject") }
  )

  EncodedRegistry.register(
    :class => TransactionRequestObject,
    :schema_type => XSD::QName.new(NsUsaepay, "TransactionRequestObject"),
    :schema_element => [
      ["accountHolder", ["SOAP::SOAPString", XSD::QName.new(nil, "AccountHolder")], [0, 1]],
      ["authCode", ["SOAP::SOAPString", XSD::QName.new(nil, "AuthCode")], [0, 1]],
      ["billingAddress", ["Address", XSD::QName.new(nil, "BillingAddress")], [0, 1]],
      ["checkData", ["CheckData", XSD::QName.new(nil, "CheckData")], [0, 1]],
      ["clientIP", ["SOAP::SOAPString", XSD::QName.new(nil, "ClientIP")], [0, 1]],
      ["command", ["SOAP::SOAPString", XSD::QName.new(nil, "Command")], [0, 1]],
      ["creditCardData", ["CreditCardData", XSD::QName.new(nil, "CreditCardData")], [0, 1]],
      ["customerID", ["SOAP::SOAPString", XSD::QName.new(nil, "CustomerID")], [0, 1]],
      ["customFields", ["FieldValueArray", XSD::QName.new(nil, "CustomFields")], [0, 1]],
      ["custReceipt", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "CustReceipt")], [0, 1]],
      ["custReceiptName", ["SOAP::SOAPString", XSD::QName.new(nil, "CustReceiptName")], [0, 1]],
      ["details", ["TransactionDetail", XSD::QName.new(nil, "Details")]],
      ["ignoreDuplicate", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "IgnoreDuplicate")], [0, 1]],
      ["lineItems", ["LineItemArray", XSD::QName.new(nil, "LineItems")], [0, 1]],
      ["recurringBilling", ["RecurringBilling", XSD::QName.new(nil, "RecurringBilling")], [0, 1]],
      ["refNum", ["SOAP::SOAPString", XSD::QName.new(nil, "RefNum")], [0, 1]],
      ["shippingAddress", ["Address", XSD::QName.new(nil, "ShippingAddress")], [0, 1]],
      ["software", ["SOAP::SOAPString", XSD::QName.new(nil, "Software")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => TransactionResponse,
    :schema_type => XSD::QName.new(NsUsaepay, "TransactionResponse"),
    :schema_element => [
      ["acsUrl", ["SOAP::SOAPString", XSD::QName.new(nil, "AcsUrl")]],
      ["authAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "AuthAmount")]],
      ["authCode", ["SOAP::SOAPString", XSD::QName.new(nil, "AuthCode")]],
      ["avsResult", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsResult")]],
      ["avsResultCode", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsResultCode")]],
      ["batchNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "BatchNum")]],
      ["batchRefNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "BatchRefNum")]],
      ["cardCodeResult", ["SOAP::SOAPString", XSD::QName.new(nil, "CardCodeResult")]],
      ["cardCodeResultCode", ["SOAP::SOAPString", XSD::QName.new(nil, "CardCodeResultCode")]],
      ["cardLevelResult", ["SOAP::SOAPString", XSD::QName.new(nil, "CardLevelResult")]],
      ["cardLevelResultCode", ["SOAP::SOAPString", XSD::QName.new(nil, "CardLevelResultCode")]],
      ["conversionRate", ["SOAP::SOAPDouble", XSD::QName.new(nil, "ConversionRate")]],
      ["convertedAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "ConvertedAmount")]],
      ["convertedAmountCurrency", ["SOAP::SOAPString", XSD::QName.new(nil, "ConvertedAmountCurrency")]],
      ["custNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CustNum")]],
      ["error", ["SOAP::SOAPString", XSD::QName.new(nil, "Error")]],
      ["errorCode", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ErrorCode")]],
      ["isDuplicate", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "isDuplicate")]],
      ["payload", ["SOAP::SOAPString", XSD::QName.new(nil, "Payload")]],
      ["refNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "RefNum")]],
      ["remainingBalance", ["SOAP::SOAPDouble", XSD::QName.new(nil, "RemainingBalance")], [0, 1]],
      ["result", ["SOAP::SOAPString", XSD::QName.new(nil, "Result")]],
      ["resultCode", ["SOAP::SOAPString", XSD::QName.new(nil, "ResultCode")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "Status")]],
      ["statusCode", ["SOAP::SOAPString", XSD::QName.new(nil, "StatusCode")]],
      ["vpasResultCode", ["SOAP::SOAPString", XSD::QName.new(nil, "VpasResultCode")]]
    ]
  )

  EncodedRegistry.register(
    :class => TransactionSearchResult,
    :schema_type => XSD::QName.new(NsUsaepay, "TransactionSearchResult"),
    :schema_element => [
      ["authOnlyAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "AuthOnlyAmount")]],
      ["authOnlyCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "AuthOnlyCount")]],
      ["creditsAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "CreditsAmount")]],
      ["creditsCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CreditsCount")]],
      ["declinesAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "DeclinesAmount")]],
      ["declinesCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "DeclinesCount")]],
      ["errorsAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "ErrorsAmount")]],
      ["errorsCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ErrorsCount")]],
      ["limit", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Limit")]],
      ["salesAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "SalesAmount")]],
      ["salesCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SalesCount")]],
      ["startIndex", ["SOAP::SOAPInteger", XSD::QName.new(nil, "StartIndex")]],
      ["transactions", ["TransactionObjectArray", XSD::QName.new(nil, "Transactions")]],
      ["transactionsMatched", ["SOAP::SOAPInteger", XSD::QName.new(nil, "TransactionsMatched")]],
      ["transactionsReturned", ["SOAP::SOAPInteger", XSD::QName.new(nil, "TransactionsReturned")]],
      ["voidsAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "VoidsAmount")]],
      ["voidsCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "VoidsCount")]]
    ]
  )

  EncodedRegistry.register(
    :class => UeHash,
    :schema_type => XSD::QName.new(NsUsaepay, "ueHash"),
    :schema_element => [
      ["hashValue", ["SOAP::SOAPString", XSD::QName.new(nil, "HashValue")]],
      ["seed", ["SOAP::SOAPString", XSD::QName.new(nil, "Seed")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "Type")]]
    ]
  )

  EncodedRegistry.register(
    :class => UeSecurityToken,
    :schema_type => XSD::QName.new(NsUsaepay, "ueSecurityToken"),
    :schema_element => [
      ["clientIP", ["SOAP::SOAPString", XSD::QName.new(nil, "ClientIP")]],
      ["pinHash", ["UeHash", XSD::QName.new(nil, "PinHash")]],
      ["sourceKey", ["SOAP::SOAPString", XSD::QName.new(nil, "SourceKey")]]
    ]
  )

  LiteralRegistry.register(
    :class => AccountDetails,
    :schema_type => XSD::QName.new(NsUsaepay, "AccountDetails"),
    :schema_element => [
      ["cardholderAuthentication", ["SOAP::SOAPString", XSD::QName.new(nil, "CardholderAuthentication")]],
      ["checkPlatform", ["SOAP::SOAPString", XSD::QName.new(nil, "CheckPlatform")]],
      ["creditCardPlatform", ["SOAP::SOAPString", XSD::QName.new(nil, "CreditCardPlatform")]],
      ["debitCardSupport", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "DebitCardSupport")]],
      ["directPayPlatform", ["SOAP::SOAPString", XSD::QName.new(nil, "DirectPayPlatform")]],
      ["industry", ["SOAP::SOAPString", XSD::QName.new(nil, "Industry")]],
      ["supportedCurrencies", ["CurrencyObjectArray", XSD::QName.new(nil, "SupportedCurrencies")]]
    ]
  )

  LiteralRegistry.register(
    :class => Address,
    :schema_type => XSD::QName.new(NsUsaepay, "Address"),
    :schema_element => [
      ["city", ["SOAP::SOAPString", XSD::QName.new(nil, "City")], [0, 1]],
      ["company", ["SOAP::SOAPString", XSD::QName.new(nil, "Company")], [0, 1]],
      ["country", ["SOAP::SOAPString", XSD::QName.new(nil, "Country")], [0, 1]],
      ["email", ["SOAP::SOAPString", XSD::QName.new(nil, "Email")], [0, 1]],
      ["fax", ["SOAP::SOAPString", XSD::QName.new(nil, "Fax")], [0, 1]],
      ["firstName", ["SOAP::SOAPString", XSD::QName.new(nil, "FirstName")], [0, 1]],
      ["lastName", ["SOAP::SOAPString", XSD::QName.new(nil, "LastName")], [0, 1]],
      ["phone", ["SOAP::SOAPString", XSD::QName.new(nil, "Phone")], [0, 1]],
      ["state", ["SOAP::SOAPString", XSD::QName.new(nil, "State")], [0, 1]],
      ["street", ["SOAP::SOAPString", XSD::QName.new(nil, "Street")], [0, 1]],
      ["street2", ["SOAP::SOAPString", XSD::QName.new(nil, "Street2")], [0, 1]],
      ["zip", ["SOAP::SOAPString", XSD::QName.new(nil, "Zip")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => Bank,
    :schema_type => XSD::QName.new(NsUsaepay, "Bank"),
    :schema_element => [
      ["code", ["SOAP::SOAPString", XSD::QName.new(nil, "Code")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "Name")]]
    ]
  )

  LiteralRegistry.register(
    :class => BatchSearchResult,
    :schema_type => XSD::QName.new(NsUsaepay, "BatchSearchResult"),
    :schema_element => [
      ["batches", ["BatchStatusArray", XSD::QName.new(nil, "Batches")]],
      ["batchesMatched", ["SOAP::SOAPInteger", XSD::QName.new(nil, "BatchesMatched")]],
      ["batchesReturned", ["SOAP::SOAPInteger", XSD::QName.new(nil, "BatchesReturned")]],
      ["limit", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Limit")]],
      ["startIndex", ["SOAP::SOAPInteger", XSD::QName.new(nil, "StartIndex")]]
    ]
  )

  LiteralRegistry.register(
    :class => BatchStatus,
    :schema_type => XSD::QName.new(NsUsaepay, "BatchStatus"),
    :schema_element => [
      ["batchRefNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "BatchRefNum")]],
      ["closed", ["SOAP::SOAPString", XSD::QName.new(nil, "Closed")]],
      ["creditsAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "CreditsAmount")]],
      ["creditsCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CreditsCount")]],
      ["netAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "NetAmount")]],
      ["opened", ["SOAP::SOAPString", XSD::QName.new(nil, "Opened")]],
      ["salesAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "SalesAmount")]],
      ["salesCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SalesCount")]],
      ["scheduled", ["SOAP::SOAPString", XSD::QName.new(nil, "Scheduled")]],
      ["sequence", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Sequence")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "Status")]],
      ["transactionCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "TransactionCount")]],
      ["voidsAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "VoidsAmount")]],
      ["voidsCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "VoidsCount")]]
    ]
  )

  LiteralRegistry.register(
    :class => BatchUploadStatus,
    :schema_type => XSD::QName.new(NsUsaepay, "BatchUploadStatus"),
    :schema_element => [
      ["approved", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Approved")]],
      ["uploadRefNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "UploadRefNum")]],
      ["declined", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Declined")]],
      ["errors", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Errors")]],
      ["finished", ["SOAP::SOAPString", XSD::QName.new(nil, "Finished")]],
      ["remaining", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Remaining")]],
      ["started", ["SOAP::SOAPString", XSD::QName.new(nil, "Started")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "Status")]],
      ["transactions", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Transactions")]]
    ]
  )

  LiteralRegistry.register(
    :class => CheckData,
    :schema_type => XSD::QName.new(NsUsaepay, "CheckData"),
    :schema_element => [
      ["account", ["SOAP::SOAPString", XSD::QName.new(nil, "Account")]],
      ["accountType", ["SOAP::SOAPString", XSD::QName.new(nil, "AccountType")], [0, 1]],
      ["checkNumber", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CheckNumber")], [0, 1]],
      ["driversLicense", ["SOAP::SOAPString", XSD::QName.new(nil, "DriversLicense")], [0, 1]],
      ["driversLicenseState", ["SOAP::SOAPString", XSD::QName.new(nil, "DriversLicenseState")], [0, 1]],
      ["recordType", ["SOAP::SOAPString", XSD::QName.new(nil, "RecordType")], [0, 1]],
      ["routing", ["SOAP::SOAPString", XSD::QName.new(nil, "Routing")]],
      ["auxOnUS", ["SOAP::SOAPString", XSD::QName.new(nil, "AuxOnUS")], [0, 1]],
      ["epcCode", ["SOAP::SOAPString", XSD::QName.new(nil, "EpcCode")], [0, 1]],
      ["frontImage", ["SOAP::SOAPString", XSD::QName.new(nil, "FrontImage")], [0, 1]],
      ["backImage", ["SOAP::SOAPString", XSD::QName.new(nil, "BackImage")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => CheckTrace,
    :schema_type => XSD::QName.new(NsUsaepay, "CheckTrace"),
    :schema_element => [
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "Status")], [0, 1]],
      ["statusCode", ["SOAP::SOAPString", XSD::QName.new(nil, "StatusCode")], [0, 1]],
      ["bankNote", ["SOAP::SOAPString", XSD::QName.new(nil, "BankNote")], [0, 1]],
      ["effective", ["SOAP::SOAPString", XSD::QName.new(nil, "Effective")], [0, 1]],
      ["processed", ["SOAP::SOAPString", XSD::QName.new(nil, "Processed")], [0, 1]],
      ["returned", ["SOAP::SOAPString", XSD::QName.new(nil, "Returned")], [0, 1]],
      ["returnCode", ["SOAP::SOAPString", XSD::QName.new(nil, "ReturnCode")], [0, 1]],
      ["reason", ["SOAP::SOAPString", XSD::QName.new(nil, "Reason")], [0, 1]],
      ["settled", ["SOAP::SOAPString", XSD::QName.new(nil, "Settled")], [0, 1]],
      ["trackingNum", ["SOAP::SOAPString", XSD::QName.new(nil, "TrackingNum")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => CreditCardData,
    :schema_type => XSD::QName.new(NsUsaepay, "CreditCardData"),
    :schema_element => [
      ["avsStreet", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsStreet")], [0, 1]],
      ["avsZip", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsZip")], [0, 1]],
      ["cardCode", ["SOAP::SOAPString", XSD::QName.new(nil, "CardCode")], [0, 1]],
      ["cardExpiration", ["SOAP::SOAPString", XSD::QName.new(nil, "CardExpiration")], [0, 1]],
      ["cardNumber", ["SOAP::SOAPString", XSD::QName.new(nil, "CardNumber")], [0, 1]],
      ["cardPresent", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "CardPresent")], [0, 1]],
      ["cardType", ["SOAP::SOAPString", XSD::QName.new(nil, "CardType")], [0, 1]],
      ["cAVV", ["SOAP::SOAPString", XSD::QName.new(nil, "CAVV")], [0, 1]],
      ["dUKPT", ["SOAP::SOAPString", XSD::QName.new(nil, "DUKPT")], [0, 1]],
      ["eCI", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ECI")], [0, 1]],
      ["internalCardAuth", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "InternalCardAuth")], [0, 1]],
      ["magStripe", ["SOAP::SOAPString", XSD::QName.new(nil, "MagStripe")], [0, 1]],
      ["magSupport", ["SOAP::SOAPString", XSD::QName.new(nil, "MagSupport")], [0, 1]],
      ["pares", ["SOAP::SOAPString", XSD::QName.new(nil, "Pares")], [0, 1]],
      ["signature", ["SOAP::SOAPString", XSD::QName.new(nil, "Signature")], [0, 1]],
      ["termType", ["SOAP::SOAPString", XSD::QName.new(nil, "TermType")], [0, 1]],
      ["xID", ["SOAP::SOAPString", XSD::QName.new(nil, "XID")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => CurrencyConversion,
    :schema_type => XSD::QName.new(NsUsaepay, "CurrencyConversion"),
    :schema_element => [
      ["amount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Amount")]],
      ["currency", ["SOAP::SOAPString", XSD::QName.new(nil, "Currency")]],
      ["fromAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "FromAmount")]],
      ["fromCurrency", ["SOAP::SOAPString", XSD::QName.new(nil, "FromCurrency")]],
      ["rate", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Rate")]]
    ]
  )

  LiteralRegistry.register(
    :class => CurrencyObject,
    :schema_type => XSD::QName.new(NsUsaepay, "CurrencyObject"),
    :schema_element => [
      ["currency", ["SOAP::SOAPString", XSD::QName.new(nil, "Currency")]],
      ["decimalPlaces", ["SOAP::SOAPInteger", XSD::QName.new(nil, "DecimalPlaces")]],
      ["numericCode", ["SOAP::SOAPInteger", XSD::QName.new(nil, "NumericCode")]],
      ["rate", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Rate")]],
      ["textCode", ["SOAP::SOAPString", XSD::QName.new(nil, "TextCode")]]
    ]
  )

  LiteralRegistry.register(
    :class => CustomerObject,
    :schema_type => XSD::QName.new(NsUsaepay, "CustomerObject"),
    :schema_element => [
      ["amount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Amount")]],
      ["billingAddress", ["Address", XSD::QName.new(nil, "BillingAddress")]],
      ["created", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Created")], [0, 1]],
      ["currency", ["SOAP::SOAPString", XSD::QName.new(nil, "Currency")], [0, 1]],
      ["custNum", ["SOAP::SOAPString", XSD::QName.new(nil, "CustNum")], [0, 1]],
      ["customData", ["SOAP::SOAPString", XSD::QName.new(nil, "CustomData")], [0, 1]],
      ["customFields", ["FieldValueArray", XSD::QName.new(nil, "CustomFields")], [0, 1]],
      ["customerID", ["SOAP::SOAPString", XSD::QName.new(nil, "CustomerID")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "Description")]],
      ["enabled", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "Enabled")]],
      ["failures", ["SOAP::SOAPInt", XSD::QName.new(nil, "Failures")], [0, 1]],
      ["lookupCode", ["SOAP::SOAPString", XSD::QName.new(nil, "LookupCode")], [0, 1]],
      ["modified", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Modified")], [0, 1]],
      ["v_next", ["SOAP::SOAPString", XSD::QName.new(nil, "Next")]],
      ["notes", ["SOAP::SOAPString", XSD::QName.new(nil, "Notes")], [0, 1]],
      ["numLeft", ["SOAP::SOAPInteger", XSD::QName.new(nil, "NumLeft")]],
      ["orderID", ["SOAP::SOAPString", XSD::QName.new(nil, "OrderID")]],
      ["paymentMethods", ["PaymentMethodArray", XSD::QName.new(nil, "PaymentMethods")], [0, 1]],
      ["priceTier", ["SOAP::SOAPString", XSD::QName.new(nil, "PriceTier")], [0, 1]],
      ["receiptNote", ["SOAP::SOAPString", XSD::QName.new(nil, "ReceiptNote")]],
      ["schedule", ["SOAP::SOAPString", XSD::QName.new(nil, "Schedule")]],
      ["sendReceipt", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "SendReceipt")]],
      ["source", ["SOAP::SOAPString", XSD::QName.new(nil, "Source")], [0, 1]],
      ["tax", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Tax")], [0, 1]],
      ["taxClass", ["SOAP::SOAPString", XSD::QName.new(nil, "TaxClass")], [0, 1]],
      ["user", ["SOAP::SOAPString", XSD::QName.new(nil, "User")], [0, 1]],
      ["uRL", ["SOAP::SOAPString", XSD::QName.new(nil, "URL")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => CustomerSearchResult,
    :schema_type => XSD::QName.new(NsUsaepay, "CustomerSearchResult"),
    :schema_element => [
      ["customers", ["CustomerObjectArray", XSD::QName.new(nil, "Customers")]],
      ["customersMatched", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CustomersMatched")]],
      ["customersReturned", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CustomersReturned")]],
      ["limit", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Limit")]],
      ["startIndex", ["SOAP::SOAPInteger", XSD::QName.new(nil, "StartIndex")]]
    ]
  )

  LiteralRegistry.register(
    :class => CustomerTransactionRequest,
    :schema_type => XSD::QName.new(NsUsaepay, "CustomerTransactionRequest"),
    :schema_element => [
      ["command", ["SOAP::SOAPString", XSD::QName.new(nil, "Command")]],
      ["cardCode", ["SOAP::SOAPString", XSD::QName.new(nil, "CardCode")], [0, 1]],
      ["clientIP", ["SOAP::SOAPString", XSD::QName.new(nil, "ClientIP")], [0, 1]],
      ["customFields", ["FieldValueArray", XSD::QName.new(nil, "CustomFields")], [0, 1]],
      ["custReceipt", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "CustReceipt")], [0, 1]],
      ["custReceiptEmail", ["SOAP::SOAPString", XSD::QName.new(nil, "CustReceiptEmail")], [0, 1]],
      ["custReceiptName", ["SOAP::SOAPString", XSD::QName.new(nil, "CustReceiptName")], [0, 1]],
      ["merchReceipt", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "MerchReceipt")], [0, 1]],
      ["merchReceiptEmail", ["SOAP::SOAPString", XSD::QName.new(nil, "MerchReceiptEmail")], [0, 1]],
      ["merchReceiptName", ["SOAP::SOAPString", XSD::QName.new(nil, "MerchReceiptName")], [0, 1]],
      ["details", ["TransactionDetail", XSD::QName.new(nil, "Details")]],
      ["ignoreDuplicate", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "IgnoreDuplicate")], [0, 1]],
      ["isRecurring", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "isRecurring")], [0, 1]],
      ["lineItems", ["LineItemArray", XSD::QName.new(nil, "LineItems")], [0, 1]],
      ["software", ["SOAP::SOAPString", XSD::QName.new(nil, "Software")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FieldValue,
    :schema_type => XSD::QName.new(NsUsaepay, "FieldValue"),
    :schema_element => [
      ["field", ["SOAP::SOAPString", XSD::QName.new(nil, "Field")]],
      ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "Value")]]
    ]
  )

  LiteralRegistry.register(
    :class => LineItem,
    :schema_type => XSD::QName.new(NsUsaepay, "LineItem"),
    :schema_element => [
      ["productRefNum", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductRefNum")], [0, 1]],
      ["sKU", ["SOAP::SOAPString", XSD::QName.new(nil, "SKU")], [0, 1]],
      ["productName", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductName")], [0, 1]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "Description")], [0, 1]],
      ["unitPrice", ["SOAP::SOAPString", XSD::QName.new(nil, "UnitPrice")]],
      ["qty", ["SOAP::SOAPString", XSD::QName.new(nil, "Qty")]],
      ["taxable", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "Taxable")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => PaymentMethod,
    :schema_type => XSD::QName.new(NsUsaepay, "PaymentMethod"),
    :schema_element => [
      ["methodType", ["SOAP::SOAPString", XSD::QName.new(nil, "MethodType")], [0, 1]],
      ["methodID", ["SOAP::SOAPInteger", XSD::QName.new(nil, "MethodID")], [0, 1]],
      ["methodName", ["SOAP::SOAPString", XSD::QName.new(nil, "MethodName")]],
      ["secondarySort", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SecondarySort")]],
      ["created", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Created")], [0, 1]],
      ["modified", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Modified")], [0, 1]],
      ["account", ["SOAP::SOAPString", XSD::QName.new(nil, "Account")], [0, 1]],
      ["accountType", ["SOAP::SOAPString", XSD::QName.new(nil, "AccountType")], [0, 1]],
      ["driversLicense", ["SOAP::SOAPString", XSD::QName.new(nil, "DriversLicense")], [0, 1]],
      ["driversLicenseState", ["SOAP::SOAPString", XSD::QName.new(nil, "DriversLicenseState")], [0, 1]],
      ["recordType", ["SOAP::SOAPString", XSD::QName.new(nil, "RecordType")], [0, 1]],
      ["routing", ["SOAP::SOAPString", XSD::QName.new(nil, "Routing")], [0, 1]],
      ["avsStreet", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsStreet")], [0, 1]],
      ["avsZip", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsZip")], [0, 1]],
      ["cardCode", ["SOAP::SOAPString", XSD::QName.new(nil, "CardCode")], [0, 1]],
      ["cardExpiration", ["SOAP::SOAPString", XSD::QName.new(nil, "CardExpiration")], [0, 1]],
      ["cardNumber", ["SOAP::SOAPString", XSD::QName.new(nil, "CardNumber")], [0, 1]],
      ["cardType", ["SOAP::SOAPString", XSD::QName.new(nil, "CardType")], [0, 1]],
      ["balance", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Balance")], [0, 1]],
      ["maxBalance", ["SOAP::SOAPDouble", XSD::QName.new(nil, "MaxBalance")], [0, 1]],
      ["autoReload", ["SOAP::SOAPString", XSD::QName.new(nil, "AutoReload")], [0, 1]],
      ["reloadSchedule", ["SOAP::SOAPString", XSD::QName.new(nil, "ReloadSchedule")], [0, 1]],
      ["reloadThreshold", ["SOAP::SOAPString", XSD::QName.new(nil, "ReloadThreshold")], [0, 1]],
      ["reloadAmount", ["SOAP::SOAPString", XSD::QName.new(nil, "ReloadAmount")], [0, 1]],
      ["reloadMethodID", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ReloadMethodID")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => PriceTier,
    :schema_type => XSD::QName.new(NsUsaepay, "PriceTier"),
    :schema_element => [
      ["qty", ["SOAP::SOAPString", XSD::QName.new(nil, "Qty")]],
      ["price", ["SOAP::SOAPString", XSD::QName.new(nil, "Price")]],
      ["customerTier", ["SOAP::SOAPString", XSD::QName.new(nil, "CustomerTier")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => Product,
    :schema_type => XSD::QName.new(NsUsaepay, "Product"),
    :schema_element => [
      ["productRefNum", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductRefNum")], [0, 1]],
      ["productID", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductID")]],
      ["sKU", ["SOAP::SOAPString", XSD::QName.new(nil, "SKU")], [0, 1]],
      ["uPC", ["SOAP::SOAPString", XSD::QName.new(nil, "UPC")], [0, 1]],
      ["category", ["SOAP::SOAPString", XSD::QName.new(nil, "Category")]],
      ["enabled", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "Enabled")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "Name")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "Description")], [0, 1]],
      ["model", ["SOAP::SOAPString", XSD::QName.new(nil, "Model")], [0, 1]],
      ["weight", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Weight")], [0, 1]],
      ["shipWeight", ["SOAP::SOAPDouble", XSD::QName.new(nil, "ShipWeight")], [0, 1]],
      ["price", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Price")]],
      ["wholesalePrice", ["SOAP::SOAPDouble", XSD::QName.new(nil, "WholesalePrice")], [0, 1]],
      ["listPrice", ["SOAP::SOAPDouble", XSD::QName.new(nil, "ListPrice")], [0, 1]],
      ["dateAvailable", ["SOAP::SOAPString", XSD::QName.new(nil, "DateAvailable")], [0, 1]],
      ["manufacturer", ["SOAP::SOAPString", XSD::QName.new(nil, "Manufacturer")], [0, 1]],
      ["physicalGood", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "PhysicalGood")], [0, 1]],
      ["taxClass", ["SOAP::SOAPString", XSD::QName.new(nil, "TaxClass")], [0, 1]],
      ["minQuantity", ["SOAP::SOAPInteger", XSD::QName.new(nil, "MinQuantity")], [0, 1]],
      ["imageURL", ["SOAP::SOAPString", XSD::QName.new(nil, "ImageURL")], [0, 1]],
      ["uRL", ["SOAP::SOAPString", XSD::QName.new(nil, "URL")], [0, 1]],
      ["created", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Created")], [0, 1]],
      ["modified", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Modified")], [0, 1]],
      ["inventory", ["ProductInventoryArray", XSD::QName.new(nil, "Inventory")], [0, 1]],
      ["priceTiers", ["PriceTierArray", XSD::QName.new(nil, "PriceTiers")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => ProductCategory,
    :schema_type => XSD::QName.new(NsUsaepay, "ProductCategory"),
    :schema_element => [
      ["productCategoryRefNum", ["SOAP::SOAPString", XSD::QName.new(nil, "ProductCategoryRefNum")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "Name")]],
      ["created", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Created")], [0, 1]],
      ["modified", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "Modified")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => ProductInventory,
    :schema_type => XSD::QName.new(NsUsaepay, "ProductInventory"),
    :schema_element => [
      ["inventoryLocation", ["SOAP::SOAPString", XSD::QName.new(nil, "InventoryLocation")], [0, 1]],
      ["qtyOnHand", ["SOAP::SOAPString", XSD::QName.new(nil, "QtyOnHand")]],
      ["qtyOnOrder", ["SOAP::SOAPString", XSD::QName.new(nil, "QtyOnOrder")], [0, 1]],
      ["dateAvailable", ["SOAP::SOAPString", XSD::QName.new(nil, "DateAvailable")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => ProductSearchResult,
    :schema_type => XSD::QName.new(NsUsaepay, "ProductSearchResult"),
    :schema_element => [
      ["products", ["ProductArray", XSD::QName.new(nil, "Products")]],
      ["productsMatched", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ProductsMatched")]],
      ["productsReturned", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ProductsReturned")]],
      ["limit", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Limit")]],
      ["startIndex", ["SOAP::SOAPInteger", XSD::QName.new(nil, "StartIndex")]]
    ]
  )

  LiteralRegistry.register(
    :class => Receipt,
    :schema_type => XSD::QName.new(NsUsaepay, "Receipt"),
    :schema_element => [
      ["receiptRefNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ReceiptRefNum")], [0, 1]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "Name")]],
      ["subject", ["SOAP::SOAPString", XSD::QName.new(nil, "Subject")], [0, 1]],
      ["fromEmail", ["SOAP::SOAPString", XSD::QName.new(nil, "FromEmail")], [0, 1]],
      ["target", ["SOAP::SOAPString", XSD::QName.new(nil, "Target")]],
      ["contentType", ["SOAP::SOAPString", XSD::QName.new(nil, "ContentType")]],
      ["templateHTML", ["SOAP::SOAPString", XSD::QName.new(nil, "TemplateHTML")], [0, 1]],
      ["templateText", ["SOAP::SOAPString", XSD::QName.new(nil, "TemplateText")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => RecurringBilling,
    :schema_type => XSD::QName.new(NsUsaepay, "RecurringBilling"),
    :schema_element => [
      ["amount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Amount")]],
      ["enabled", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "Enabled")]],
      ["expire", ["SOAP::SOAPString", XSD::QName.new(nil, "Expire")], [0, 1]],
      ["v_next", ["SOAP::SOAPString", XSD::QName.new(nil, "Next")]],
      ["numLeft", ["SOAP::SOAPInteger", XSD::QName.new(nil, "NumLeft")]],
      ["schedule", ["SOAP::SOAPString", XSD::QName.new(nil, "Schedule")]]
    ]
  )

  LiteralRegistry.register(
    :class => SearchParam,
    :schema_type => XSD::QName.new(NsUsaepay, "SearchParam"),
    :schema_element => [
      ["field", ["SOAP::SOAPString", XSD::QName.new(nil, "Field")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "Type")]],
      ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "Value")]]
    ]
  )

  LiteralRegistry.register(
    :class => SyncLog,
    :schema_type => XSD::QName.new(NsUsaepay, "SyncLog"),
    :schema_element => [
      ["syncPosition", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SyncPosition")]],
      ["objectName", ["SOAP::SOAPString", XSD::QName.new(nil, "ObjectName")]],
      ["refNum", ["SOAP::SOAPString", XSD::QName.new(nil, "RefNum")]],
      ["changeDate", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "ChangeDate")]],
      ["action", ["SOAP::SOAPString", XSD::QName.new(nil, "Action")]]
    ]
  )

  LiteralRegistry.register(
    :class => SystemInfo,
    :schema_type => XSD::QName.new(NsUsaepay, "SystemInfo"),
    :schema_element => [
      ["apiVersion", ["SOAP::SOAPString", XSD::QName.new(nil, "ApiVersion")]],
      ["environment", ["SOAP::SOAPString", XSD::QName.new(nil, "Environment")]],
      ["datacenter", ["SOAP::SOAPString", XSD::QName.new(nil, "Datacenter")]],
      ["time", ["SOAP::SOAPString", XSD::QName.new(nil, "Time")]]
    ]
  )

  LiteralRegistry.register(
    :class => TransactionDetail,
    :schema_type => XSD::QName.new(NsUsaepay, "TransactionDetail"),
    :schema_element => [
      ["allowPartialAuth", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "AllowPartialAuth")], [0, 1]],
      ["amount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Amount")], [0, 1]],
      ["clerk", ["SOAP::SOAPString", XSD::QName.new(nil, "Clerk")], [0, 1]],
      ["currency", ["SOAP::SOAPString", XSD::QName.new(nil, "Currency")], [0, 1]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "Description")], [0, 1]],
      ["comments", ["SOAP::SOAPString", XSD::QName.new(nil, "Comments")], [0, 1]],
      ["discount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Discount")], [0, 1]],
      ["invoice", ["SOAP::SOAPString", XSD::QName.new(nil, "Invoice")], [0, 1]],
      ["nonTax", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "NonTax")], [0, 1]],
      ["orderID", ["SOAP::SOAPString", XSD::QName.new(nil, "OrderID")], [0, 1]],
      ["pONum", ["SOAP::SOAPString", XSD::QName.new(nil, "PONum")], [0, 1]],
      ["shipping", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Shipping")], [0, 1]],
      ["subtotal", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Subtotal")], [0, 1]],
      ["table", ["SOAP::SOAPString", XSD::QName.new(nil, "Table")], [0, 1]],
      ["tax", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Tax")], [0, 1]],
      ["terminal", ["SOAP::SOAPString", XSD::QName.new(nil, "Terminal")], [0, 1]],
      ["tip", ["SOAP::SOAPDouble", XSD::QName.new(nil, "Tip")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => TransactionObject,
    :schema_type => XSD::QName.new(NsUsaepay, "TransactionObject"),
    :schema_element => [
      ["accountHolder", ["SOAP::SOAPString", XSD::QName.new(nil, "AccountHolder")]],
      ["billingAddress", ["Address", XSD::QName.new(nil, "BillingAddress")]],
      ["checkData", ["CheckData", XSD::QName.new(nil, "CheckData")]],
      ["checkTrace", ["CheckTrace", XSD::QName.new(nil, "CheckTrace")]],
      ["clientIP", ["SOAP::SOAPString", XSD::QName.new(nil, "ClientIP")]],
      ["creditCardData", ["CreditCardData", XSD::QName.new(nil, "CreditCardData")]],
      ["customerID", ["SOAP::SOAPString", XSD::QName.new(nil, "CustomerID")]],
      ["customFields", ["FieldValueArray", XSD::QName.new(nil, "CustomFields")]],
      ["dateTime", ["SOAP::SOAPString", XSD::QName.new(nil, "DateTime")]],
      ["details", ["TransactionDetail", XSD::QName.new(nil, "Details")]],
      ["lineItems", ["LineItemArray", XSD::QName.new(nil, "LineItems")], [0, 1]],
      ["response", ["TransactionResponse", XSD::QName.new(nil, "Response")]],
      ["serverIP", ["SOAP::SOAPString", XSD::QName.new(nil, "ServerIP")]],
      ["shippingAddress", ["Address", XSD::QName.new(nil, "ShippingAddress")]],
      ["source", ["SOAP::SOAPString", XSD::QName.new(nil, "Source")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "Status")]],
      ["transactionType", ["SOAP::SOAPString", XSD::QName.new(nil, "TransactionType")]],
      ["user", ["SOAP::SOAPString", XSD::QName.new(nil, "User")]]
    ]
  )

  LiteralRegistry.register(
    :class => TransactionRequestObject,
    :schema_type => XSD::QName.new(NsUsaepay, "TransactionRequestObject"),
    :schema_element => [
      ["accountHolder", ["SOAP::SOAPString", XSD::QName.new(nil, "AccountHolder")], [0, 1]],
      ["authCode", ["SOAP::SOAPString", XSD::QName.new(nil, "AuthCode")], [0, 1]],
      ["billingAddress", ["Address", XSD::QName.new(nil, "BillingAddress")], [0, 1]],
      ["checkData", ["CheckData", XSD::QName.new(nil, "CheckData")], [0, 1]],
      ["clientIP", ["SOAP::SOAPString", XSD::QName.new(nil, "ClientIP")], [0, 1]],
      ["command", ["SOAP::SOAPString", XSD::QName.new(nil, "Command")], [0, 1]],
      ["creditCardData", ["CreditCardData", XSD::QName.new(nil, "CreditCardData")], [0, 1]],
      ["customerID", ["SOAP::SOAPString", XSD::QName.new(nil, "CustomerID")], [0, 1]],
      ["customFields", ["FieldValueArray", XSD::QName.new(nil, "CustomFields")], [0, 1]],
      ["custReceipt", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "CustReceipt")], [0, 1]],
      ["custReceiptName", ["SOAP::SOAPString", XSD::QName.new(nil, "CustReceiptName")], [0, 1]],
      ["details", ["TransactionDetail", XSD::QName.new(nil, "Details")]],
      ["ignoreDuplicate", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "IgnoreDuplicate")], [0, 1]],
      ["lineItems", ["LineItemArray", XSD::QName.new(nil, "LineItems")], [0, 1]],
      ["recurringBilling", ["RecurringBilling", XSD::QName.new(nil, "RecurringBilling")], [0, 1]],
      ["refNum", ["SOAP::SOAPString", XSD::QName.new(nil, "RefNum")], [0, 1]],
      ["shippingAddress", ["Address", XSD::QName.new(nil, "ShippingAddress")], [0, 1]],
      ["software", ["SOAP::SOAPString", XSD::QName.new(nil, "Software")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => TransactionResponse,
    :schema_type => XSD::QName.new(NsUsaepay, "TransactionResponse"),
    :schema_element => [
      ["acsUrl", ["SOAP::SOAPString", XSD::QName.new(nil, "AcsUrl")]],
      ["authAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "AuthAmount")]],
      ["authCode", ["SOAP::SOAPString", XSD::QName.new(nil, "AuthCode")]],
      ["avsResult", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsResult")]],
      ["avsResultCode", ["SOAP::SOAPString", XSD::QName.new(nil, "AvsResultCode")]],
      ["batchNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "BatchNum")]],
      ["batchRefNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "BatchRefNum")]],
      ["cardCodeResult", ["SOAP::SOAPString", XSD::QName.new(nil, "CardCodeResult")]],
      ["cardCodeResultCode", ["SOAP::SOAPString", XSD::QName.new(nil, "CardCodeResultCode")]],
      ["cardLevelResult", ["SOAP::SOAPString", XSD::QName.new(nil, "CardLevelResult")]],
      ["cardLevelResultCode", ["SOAP::SOAPString", XSD::QName.new(nil, "CardLevelResultCode")]],
      ["conversionRate", ["SOAP::SOAPDouble", XSD::QName.new(nil, "ConversionRate")]],
      ["convertedAmount", ["SOAP::SOAPDouble", XSD::QName.new(nil, "ConvertedAmount")]],
      ["convertedAmountCurrency", ["SOAP::SOAPString", XSD::QName.new(nil, "ConvertedAmountCurrency")]],
      ["custNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CustNum")]],
      ["error", ["SOAP::SOAPString", XSD::QName.new(nil, "Error")]],
      ["errorCode", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ErrorCode")]],
      ["isDuplicate", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "isDuplicate")]],
      ["payload", ["SOAP::SOAPString", XSD::QName.new(nil, "Payload")]],
      ["refNum", ["SOAP::SOAPInteger", XSD::QName.new(nil, "RefNum")]],
      ["remainingBalance", ["SOAP::SOAPDouble", XSD::QName.new(nil, "RemainingBalance")], [0, 1]],
      ["result", ["SOAP::SOAPString", XSD::QName.new(nil, "Result")]],
      ["resultCode", ["SOAP::SOAPString", XSD::QName.new(nil, "ResultCode")]],
      ["status", ["SOAP::SOAPString", XSD::QName.new(nil, "Status")]],
      ["statusCode", ["SOAP::SOAPString", XSD::QName.new(nil, "StatusCode")]],
      ["vpasResultCode", ["SOAP::SOAPString", XSD::QName.new(nil, "VpasResultCode")]]
    ]
  )

  LiteralRegistry.register(
    :class => TransactionSearchResult,
    :schema_type => XSD::QName.new(NsUsaepay, "TransactionSearchResult"),
    :schema_element => [
      ["authOnlyAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "AuthOnlyAmount")]],
      ["authOnlyCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "AuthOnlyCount")]],
      ["creditsAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "CreditsAmount")]],
      ["creditsCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "CreditsCount")]],
      ["declinesAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "DeclinesAmount")]],
      ["declinesCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "DeclinesCount")]],
      ["errorsAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "ErrorsAmount")]],
      ["errorsCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "ErrorsCount")]],
      ["limit", ["SOAP::SOAPInteger", XSD::QName.new(nil, "Limit")]],
      ["salesAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "SalesAmount")]],
      ["salesCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "SalesCount")]],
      ["startIndex", ["SOAP::SOAPInteger", XSD::QName.new(nil, "StartIndex")]],
      ["transactions", ["TransactionObjectArray", XSD::QName.new(nil, "Transactions")]],
      ["transactionsMatched", ["SOAP::SOAPInteger", XSD::QName.new(nil, "TransactionsMatched")]],
      ["transactionsReturned", ["SOAP::SOAPInteger", XSD::QName.new(nil, "TransactionsReturned")]],
      ["voidsAmount", ["SOAP::SOAPFloat", XSD::QName.new(nil, "VoidsAmount")]],
      ["voidsCount", ["SOAP::SOAPInteger", XSD::QName.new(nil, "VoidsCount")]]
    ]
  )

  LiteralRegistry.register(
    :class => UeHash,
    :schema_type => XSD::QName.new(NsUsaepay, "ueHash"),
    :schema_element => [
      ["hashValue", ["SOAP::SOAPString", XSD::QName.new(nil, "HashValue")]],
      ["seed", ["SOAP::SOAPString", XSD::QName.new(nil, "Seed")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "Type")]]
    ]
  )

  LiteralRegistry.register(
    :class => UeSecurityToken,
    :schema_type => XSD::QName.new(NsUsaepay, "ueSecurityToken"),
    :schema_element => [
      ["clientIP", ["SOAP::SOAPString", XSD::QName.new(nil, "ClientIP")]],
      ["pinHash", ["UeHash", XSD::QName.new(nil, "PinHash")]],
      ["sourceKey", ["SOAP::SOAPString", XSD::QName.new(nil, "SourceKey")]]
    ]
  )
end
