#!/usr/bin/env ruby
require 'usaepayDriver.rb'

endpoint_url = ARGV.shift
obj = UeSoapServerPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   addCustomer(token, customerData)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   customerData    CustomerObject - {urn:usaepay}CustomerObject
#
# RETURNS
#   addCustomerReturn C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
token = customerData = nil
puts obj.addCustomer(token, customerData)

# SYNOPSIS
#   addCustomerPaymentMethod(token, custNum, paymentMethod, makeDefault, verify)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   paymentMethod   PaymentMethod - {urn:usaepay}PaymentMethod
#   makeDefault     Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   verify          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
# RETURNS
#   addCustomerPaymentMethodReturn C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
token = custNum = paymentMethod = makeDefault = verify = nil
puts obj.addCustomerPaymentMethod(token, custNum, paymentMethod, makeDefault, verify)

# SYNOPSIS
#   addProduct(token, product)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   product         Product - {urn:usaepay}Product
#
# RETURNS
#   productRefNum   C_String - {http://www.w3.org/2001/XMLSchema}string
#
token = product = nil
puts obj.addProduct(token, product)

# SYNOPSIS
#   addProductCategory(token, productCategory)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   productCategory ProductCategory - {urn:usaepay}ProductCategory
#
# RETURNS
#   productCategoryRefNum C_String - {http://www.w3.org/2001/XMLSchema}string
#
token = productCategory = nil
puts obj.addProductCategory(token, productCategory)

# SYNOPSIS
#   addReceipt(token, receipt)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   receipt         Receipt - {urn:usaepay}Receipt
#
# RETURNS
#   addReceiptResponseReturn C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
token = receipt = nil
puts obj.addReceipt(token, receipt)

# SYNOPSIS
#   adjustInventory(token, productRefNum, inventory)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   productRefNum   C_String - {http://www.w3.org/2001/XMLSchema}string
#   inventory       ProductInventoryArray - {urn:usaepay}ProductInventoryArray
#
# RETURNS
#   adjustInventoryReturn ProductInventoryArray - {urn:usaepay}ProductInventoryArray
#
token = productRefNum = inventory = nil
puts obj.adjustInventory(token, productRefNum, inventory)

# SYNOPSIS
#   bulkCurrencyConversion(token, fromCurrency, toCurrency, amounts)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   fromCurrency    C_String - {http://www.w3.org/2001/XMLSchema}string
#   toCurrency      C_String - {http://www.w3.org/2001/XMLSchema}string
#   amounts         DoubleArray - {urn:usaepay}doubleArray
#
# RETURNS
#   bulkCurrencyConversionReturn CurrencyConversionArray - {urn:usaepay}CurrencyConversionArray
#
token = fromCurrency = toCurrency = amounts = nil
puts obj.bulkCurrencyConversion(token, fromCurrency, toCurrency, amounts)

# SYNOPSIS
#   captureTransaction(token, refNum, amount)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   amount          Double - {http://www.w3.org/2001/XMLSchema}double
#
# RETURNS
#   captureTransactionReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = refNum = amount = nil
puts obj.captureTransaction(token, refNum, amount)

# SYNOPSIS
#   closeBatch(token, batchRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   batchRefNum     C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   closeBatchReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = batchRefNum = nil
puts obj.closeBatch(token, batchRefNum)

# SYNOPSIS
#   convertTranToCust(token, refNum, updateData)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   updateData      FieldValueArray - {urn:usaepay}FieldValueArray
#
# RETURNS
#   convertTranToCustReturn C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
token = refNum = updateData = nil
puts obj.convertTranToCust(token, refNum, updateData)

# SYNOPSIS
#   copyCustomer(copyFromToken, custNum, copyToToken)
#
# ARGS
#   copyFromToken   UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   copyToToken     UeSecurityToken - {urn:usaepay}ueSecurityToken
#
# RETURNS
#   copyCustomerReturn C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
copyFromToken = custNum = copyToToken = nil
puts obj.copyCustomer(copyFromToken, custNum, copyToToken)

# SYNOPSIS
#   createBatchUpload(token, fileName, autoStart, format, encoding, fields, data, overrideDuplicates)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   fileName        C_String - {http://www.w3.org/2001/XMLSchema}string
#   autoStart       Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   format          C_String - {http://www.w3.org/2001/XMLSchema}string
#   encoding        C_String - {http://www.w3.org/2001/XMLSchema}string
#   fields          StringArray - {urn:usaepay}stringArray
#   data            C_String - {http://www.w3.org/2001/XMLSchema}string
#   overrideDuplicates Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
# RETURNS
#   createBatchUploadReturn BatchUploadStatus - {urn:usaepay}BatchUploadStatus
#
token = fileName = autoStart = format = encoding = fields = data = overrideDuplicates = nil
puts obj.createBatchUpload(token, fileName, autoStart, format, encoding, fields, data, overrideDuplicates)

# SYNOPSIS
#   currencyConversion(token, fromCurrency, toCurrency, amount)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   fromCurrency    C_String - {http://www.w3.org/2001/XMLSchema}string
#   toCurrency      C_String - {http://www.w3.org/2001/XMLSchema}string
#   amount          Double - {http://www.w3.org/2001/XMLSchema}double
#
# RETURNS
#   currencyConversionReturn CurrencyConversion - {urn:usaepay}CurrencyConversion
#
token = fromCurrency = toCurrency = amount = nil
puts obj.currencyConversion(token, fromCurrency, toCurrency, amount)

# SYNOPSIS
#   deleteCustomer(token, custNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   deleteCustomerReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = custNum = nil
puts obj.deleteCustomer(token, custNum)

# SYNOPSIS
#   deleteCustomerPaymentMethod(token, custnum, paymentMethodID)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custnum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   paymentMethodID C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   deleteCustomerPaymentMethodReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = custnum = paymentMethodID = nil
puts obj.deleteCustomerPaymentMethod(token, custnum, paymentMethodID)

# SYNOPSIS
#   deleteProduct(token, productRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   productRefNum   C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   deleteProductReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = productRefNum = nil
puts obj.deleteProduct(token, productRefNum)

# SYNOPSIS
#   deleteProductCategory(token, productCategoryRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   productCategoryRefNum C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   deleteProductCategoryReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = productCategoryRefNum = nil
puts obj.deleteProductCategory(token, productCategoryRefNum)

# SYNOPSIS
#   deleteReceipt(token, receiptRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   receiptRefNum   C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   deleteReceiptReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = receiptRefNum = nil
puts obj.deleteReceipt(token, receiptRefNum)

# SYNOPSIS
#   disableCustomer(token, custNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   disableCustomerReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = custNum = nil
puts obj.disableCustomer(token, custNum)

# SYNOPSIS
#   emailTransactionReceipt(token, refNum, receiptRefNum, email)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   receiptRefNum   C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   email           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   emailTransactionReceiptReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = refNum = receiptRefNum = email = nil
puts obj.emailTransactionReceipt(token, refNum, receiptRefNum, email)

# SYNOPSIS
#   emailTransactionReceiptByName(token, refNum, receiptName, email)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   receiptName     C_String - {http://www.w3.org/2001/XMLSchema}string
#   email           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   emailTransactionReceiptByNameReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = refNum = receiptName = email = nil
puts obj.emailTransactionReceiptByName(token, refNum, receiptName, email)

# SYNOPSIS
#   enableCustomer(token, custNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   enableCustomerReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = custNum = nil
puts obj.enableCustomer(token, custNum)

# SYNOPSIS
#   getAccountDetails(token)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#
# RETURNS
#   getAccountDetailsReturn AccountDetails - {urn:usaepay}AccountDetails
#
token = nil
puts obj.getAccountDetails(token)

# SYNOPSIS
#   getBankList(token)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#
# RETURNS
#   getBankListDetailsReturn BankArray - {urn:usaepay}BankArray
#
token = nil
puts obj.getBankList(token)

# SYNOPSIS
#   getBatchStatus(token, batchRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   batchRefNum     C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getBatchStatusReturn BatchStatus - {urn:usaepay}BatchStatus
#
token = batchRefNum = nil
puts obj.getBatchStatus(token, batchRefNum)

# SYNOPSIS
#   getBatchTransactions(token, batchRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   batchRefNum     C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getBatchTransactionsReturn TransactionObjectArray - {urn:usaepay}TransactionObjectArray
#
token = batchRefNum = nil
puts obj.getBatchTransactions(token, batchRefNum)

# SYNOPSIS
#   getBatchUploadStatus(token, uploadRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   uploadRefNum    C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getBatchUploadStatusReturn BatchUploadStatus - {urn:usaepay}BatchUploadStatus
#
token = uploadRefNum = nil
puts obj.getBatchUploadStatus(token, uploadRefNum)

# SYNOPSIS
#   getCheckTrace(token, refNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getCheckTraceReturn CheckTrace - {urn:usaepay}CheckTrace
#
token = refNum = nil
puts obj.getCheckTrace(token, refNum)

# SYNOPSIS
#   getCustomer(token, custNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getCustomerReturn CustomerObject - {urn:usaepay}CustomerObject
#
token = custNum = nil
puts obj.getCustomer(token, custNum)

# SYNOPSIS
#   getCustomerHistory(token, custNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getCustomerHistoryReturn TransactionSearchResult - {urn:usaepay}TransactionSearchResult
#
token = custNum = nil
puts obj.getCustomerHistory(token, custNum)

# SYNOPSIS
#   getCustomerPaymentMethod(token, custNum, methodID)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   methodID        C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getCustomerPaymentMethodReturn PaymentMethod - {urn:usaepay}PaymentMethod
#
token = custNum = methodID = nil
puts obj.getCustomerPaymentMethod(token, custNum, methodID)

# SYNOPSIS
#   getCustomerPaymentMethods(token, custNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getCustomerPaymentMethodsReturn PaymentMethodArray - {urn:usaepay}PaymentMethodArray
#
token = custNum = nil
puts obj.getCustomerPaymentMethods(token, custNum)

# SYNOPSIS
#   getCustomerReport(token, report, options, format)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   report          C_String - {http://www.w3.org/2001/XMLSchema}string
#   options         FieldValueArray - {urn:usaepay}FieldValueArray
#   format          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   getCustomerReportReturn C_String - {http://www.w3.org/2001/XMLSchema}string
#
token = report = options = format = nil
puts obj.getCustomerReport(token, report, options, format)

# SYNOPSIS
#   getCustomFields(token)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#
# RETURNS
#   getCustomFieldsReturn FieldValueArray - {urn:usaepay}FieldValueArray
#
token = nil
puts obj.getCustomFields(token)

# SYNOPSIS
#   getProduct(token, productRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   productRefNum   C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   getProductReturn Product - {urn:usaepay}Product
#
token = productRefNum = nil
puts obj.getProduct(token, productRefNum)

# SYNOPSIS
#   getProductCategory(token, productCategoryRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   productCategoryRefNum C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   getProductCategoryReturn ProductCategory - {urn:usaepay}ProductCategory
#
token = productCategoryRefNum = nil
puts obj.getProductCategory(token, productCategoryRefNum)

# SYNOPSIS
#   getProductCategories(token)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#
# RETURNS
#   getProductCategoriesReturn ProductCategoryArray - {urn:usaepay}ProductCategoryArray
#
token = nil
puts obj.getProductCategories(token)

# SYNOPSIS
#   getProductInventory(token, productRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   productRefNum   C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   getProductInventoryReturn ProductInventoryArray - {urn:usaepay}ProductInventoryArray
#
token = productRefNum = nil
puts obj.getProductInventory(token, productRefNum)

# SYNOPSIS
#   getReceipt(token, receiptRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   receiptRefNum   C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getReceiptReturn Receipt - {urn:usaepay}Receipt
#
token = receiptRefNum = nil
puts obj.getReceipt(token, receiptRefNum)

# SYNOPSIS
#   getReceiptByName(token, name)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   name            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   getReceiptByNameReturn Receipt - {urn:usaepay}Receipt
#
token = name = nil
puts obj.getReceiptByName(token, name)

# SYNOPSIS
#   getReceipts(token, target)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   target          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   getReceiptsReturn ReceiptArray - {urn:usaepay}ReceiptArray
#
token = target = nil
puts obj.getReceipts(token, target)

# SYNOPSIS
#   getReport(token, report, options, format)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   report          C_String - {http://www.w3.org/2001/XMLSchema}string
#   options         FieldValueArray - {urn:usaepay}FieldValueArray
#   format          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   getReportReturn C_String - {http://www.w3.org/2001/XMLSchema}string
#
token = report = options = format = nil
puts obj.getReport(token, report, options, format)

# SYNOPSIS
#   getSupportedCurrencies(token)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#
# RETURNS
#   getSupportedCurrenciesReturn CurrencyObjectArray - {urn:usaepay}CurrencyObjectArray
#
token = nil
puts obj.getSupportedCurrencies(token)

# SYNOPSIS
#   getSyncLog(token, objectName, fromPosition)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   objectName      C_String - {http://www.w3.org/2001/XMLSchema}string
#   fromPosition    C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getSyncLogReturn SyncLogArray - {urn:usaepay}SyncLogArray
#
token = objectName = fromPosition = nil
puts obj.getSyncLog(token, objectName, fromPosition)

# SYNOPSIS
#   getSyncLogCurrentPosition(token, objectName)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   objectName      C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   getSyncLogCurrentPositionReturn C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
token = objectName = nil
puts obj.getSyncLogCurrentPosition(token, objectName)

# SYNOPSIS
#   getSystemInfo(token)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#
# RETURNS
#   getSystemInfoReturn SystemInfo - {urn:usaepay}SystemInfo
#
token = nil
puts obj.getSystemInfo(token)

# SYNOPSIS
#   getTransaction(token, refNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getTransactionReturn TransactionObject - {urn:usaepay}TransactionObject
#
token = refNum = nil
puts obj.getTransaction(token, refNum)

# SYNOPSIS
#   getTransactionCustom(token, refNum, fields)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   fields          StringArray - {urn:usaepay}stringArray
#
# RETURNS
#   getTransactionCustomReturn FieldValueArray - {urn:usaepay}FieldValueArray
#
token = refNum = fields = nil
puts obj.getTransactionCustom(token, refNum, fields)

# SYNOPSIS
#   getTransactionReport(token, startDate, endDate, report, format)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   startDate       C_String - {http://www.w3.org/2001/XMLSchema}string
#   endDate         C_String - {http://www.w3.org/2001/XMLSchema}string
#   report          C_String - {http://www.w3.org/2001/XMLSchema}string
#   format          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   getTransactionReportReturn C_String - {http://www.w3.org/2001/XMLSchema}string
#
token = startDate = endDate = report = format = nil
puts obj.getTransactionReport(token, startDate, endDate, report, format)

# SYNOPSIS
#   getTransactionStatus(token, refNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   getTransactionStatusReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = refNum = nil
puts obj.getTransactionStatus(token, refNum)

# SYNOPSIS
#   moveCustomer(moveFromToken, custNum, moveToToken)
#
# ARGS
#   moveFromToken   UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   moveToToken     UeSecurityToken - {urn:usaepay}ueSecurityToken
#
# RETURNS
#   moveCustomerReturn C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
moveFromToken = custNum = moveToToken = nil
puts obj.moveCustomer(moveFromToken, custNum, moveToToken)

# SYNOPSIS
#   pauseBatchUpload(token, uploadRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   uploadRefNum    C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   pauseBatchUploadReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = uploadRefNum = nil
puts obj.pauseBatchUpload(token, uploadRefNum)

# SYNOPSIS
#   postAuth(token, params)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   params          TransactionRequestObject - {urn:usaepay}TransactionRequestObject
#
# RETURNS
#   postAuthReturn  TransactionResponse - {urn:usaepay}TransactionResponse
#
token = params = nil
puts obj.postAuth(token, params)

# SYNOPSIS
#   quickUpdateCustomer(token, custNum, updateData)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   updateData      FieldValueArray - {urn:usaepay}FieldValueArray
#
# RETURNS
#   quickUpdateCustomerReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = custNum = updateData = nil
puts obj.quickUpdateCustomer(token, custNum, updateData)

# SYNOPSIS
#   quickUpdateProduct(token, productRefNum, updateData)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   productRefNum   C_String - {http://www.w3.org/2001/XMLSchema}string
#   updateData      FieldValueArray - {urn:usaepay}FieldValueArray
#
# RETURNS
#   quickUpdateProductReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = productRefNum = updateData = nil
puts obj.quickUpdateProduct(token, productRefNum, updateData)

# SYNOPSIS
#   refundTransaction(token, refNum, amount)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   amount          Double - {http://www.w3.org/2001/XMLSchema}double
#
# RETURNS
#   refundTransactionReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = refNum = amount = nil
puts obj.refundTransaction(token, refNum, amount)

# SYNOPSIS
#   renderReceipt(token, refNum, receiptRefNum, contentType)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   receiptRefNum   C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   contentType     C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   renderReceiptReturn C_String - {http://www.w3.org/2001/XMLSchema}string
#
token = refNum = receiptRefNum = contentType = nil
puts obj.renderReceipt(token, refNum, receiptRefNum, contentType)

# SYNOPSIS
#   renderReceiptByName(token, refNum, receiptName, contentType)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   receiptName     C_String - {http://www.w3.org/2001/XMLSchema}string
#   contentType     C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   renderReceiptByNameReturn C_String - {http://www.w3.org/2001/XMLSchema}string
#
token = refNum = receiptName = contentType = nil
puts obj.renderReceiptByName(token, refNum, receiptName, contentType)

# SYNOPSIS
#   runBatchUpload(token, uploadRefNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   uploadRefNum    C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   runBatchUploadReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = uploadRefNum = nil
puts obj.runBatchUpload(token, uploadRefNum)

# SYNOPSIS
#   runCredit(token, params)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   params          TransactionRequestObject - {urn:usaepay}TransactionRequestObject
#
# RETURNS
#   runCreditReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = params = nil
puts obj.runCredit(token, params)

# SYNOPSIS
#   runCheckCredit(token, params)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   params          TransactionRequestObject - {urn:usaepay}TransactionRequestObject
#
# RETURNS
#   runCheckCreditReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = params = nil
puts obj.runCheckCredit(token, params)

# SYNOPSIS
#   runCustomerTransaction(token, custNum, paymentMethodID, parameters)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   paymentMethodID C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   parameters      CustomerTransactionRequest - {urn:usaepay}CustomerTransactionRequest
#
# RETURNS
#   runCustomerTransactionReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = custNum = paymentMethodID = parameters = nil
puts obj.runCustomerTransaction(token, custNum, paymentMethodID, parameters)

# SYNOPSIS
#   runQuickSale(token, refNum, details, authOnly)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   details         TransactionDetail - {urn:usaepay}TransactionDetail
#   authOnly        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
# RETURNS
#   runQuickSaleReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = refNum = details = authOnly = nil
puts obj.runQuickSale(token, refNum, details, authOnly)

# SYNOPSIS
#   runQuickCredit(token, refNum, details)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   details         TransactionDetail - {urn:usaepay}TransactionDetail
#
# RETURNS
#   runQuickCreditReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = refNum = details = nil
puts obj.runQuickCredit(token, refNum, details)

# SYNOPSIS
#   runAuthOnly(token, params)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   params          TransactionRequestObject - {urn:usaepay}TransactionRequestObject
#
# RETURNS
#   runAuthOnlyReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = params = nil
puts obj.runAuthOnly(token, params)

# SYNOPSIS
#   runSale(token, params)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   params          TransactionRequestObject - {urn:usaepay}TransactionRequestObject
#
# RETURNS
#   runSaleReturn   TransactionResponse - {urn:usaepay}TransactionResponse
#
token = params = nil
puts obj.runSale(token, params)

# SYNOPSIS
#   runCheckSale(token, params)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   params          TransactionRequestObject - {urn:usaepay}TransactionRequestObject
#
# RETURNS
#   runCheckSaleReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = params = nil
puts obj.runCheckSale(token, params)

# SYNOPSIS
#   runTransaction(token, parameters)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   parameters      TransactionRequestObject - {urn:usaepay}TransactionRequestObject
#
# RETURNS
#   runTransactionReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = parameters = nil
puts obj.runTransaction(token, parameters)

# SYNOPSIS
#   runTransactionAPI(token, parameters)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   parameters      FieldValueArray - {urn:usaepay}FieldValueArray
#
# RETURNS
#   runTransactionAPIReturn TransactionResponse - {urn:usaepay}TransactionResponse
#
token = parameters = nil
puts obj.runTransactionAPI(token, parameters)

# SYNOPSIS
#   searchBatches(token, search, matchAll, start, limit, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchBatchesReturn BatchSearchResult - {urn:usaepay}BatchSearchResult
#
token = search = matchAll = start = limit = sort = nil
puts obj.searchBatches(token, search, matchAll, start, limit, sort)

# SYNOPSIS
#   searchBatchesCount(token, search, matchAll, start, limit, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchBatchesCountReturn BatchSearchResult - {urn:usaepay}BatchSearchResult
#
token = search = matchAll = start = limit = sort = nil
puts obj.searchBatchesCount(token, search, matchAll, start, limit, sort)

# SYNOPSIS
#   searchCustomerID(token, custID)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custID          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchCustomerIDReturn C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
token = custID = nil
puts obj.searchCustomerID(token, custID)

# SYNOPSIS
#   searchCustomers(token, search, matchAll, start, limit, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchCustomersReturn CustomerSearchResult - {urn:usaepay}CustomerSearchResult
#
token = search = matchAll = start = limit = sort = nil
puts obj.searchCustomers(token, search, matchAll, start, limit, sort)

# SYNOPSIS
#   searchCustomersCount(token, search, matchAll, start, limit, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchCustomersCountReturn CustomerSearchResult - {urn:usaepay}CustomerSearchResult
#
token = search = matchAll = start = limit = sort = nil
puts obj.searchCustomersCount(token, search, matchAll, start, limit, sort)

# SYNOPSIS
#   searchProducts(token, search, matchAll, start, limit, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchProductsReturn ProductSearchResult - {urn:usaepay}ProductSearchResult
#
token = search = matchAll = start = limit = sort = nil
puts obj.searchProducts(token, search, matchAll, start, limit, sort)

# SYNOPSIS
#   searchProductsCount(token, search, matchAll, start, limit, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchProductsCountReturn ProductSearchResult - {urn:usaepay}ProductSearchResult
#
token = search = matchAll = start = limit = sort = nil
puts obj.searchProductsCount(token, search, matchAll, start, limit, sort)

# SYNOPSIS
#   searchProductsCustom(token, search, matchAll, start, limit, fieldList, format, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   fieldList       StringArray - {urn:usaepay}stringArray
#   format          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchProductsCustomReturn C_String - {http://www.w3.org/2001/XMLSchema}string
#
token = search = matchAll = start = limit = fieldList = format = sort = nil
puts obj.searchProductsCustom(token, search, matchAll, start, limit, fieldList, format, sort)

# SYNOPSIS
#   searchTransactions(token, search, matchAll, start, limit, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchTransactionsReturn TransactionSearchResult - {urn:usaepay}TransactionSearchResult
#
token = search = matchAll = start = limit = sort = nil
puts obj.searchTransactions(token, search, matchAll, start, limit, sort)

# SYNOPSIS
#   searchTransactionsCount(token, search, matchAll, start, limit, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchTransactionsCountReturn TransactionSearchResult - {urn:usaepay}TransactionSearchResult
#
token = search = matchAll = start = limit = sort = nil
puts obj.searchTransactionsCount(token, search, matchAll, start, limit, sort)

# SYNOPSIS
#   searchTransactionsCustom(token, search, matchAll, start, limit, fieldList, format, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   fieldList       StringArray - {urn:usaepay}stringArray
#   format          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchTransactionsCustomReturn C_String - {http://www.w3.org/2001/XMLSchema}string
#
token = search = matchAll = start = limit = fieldList = format = sort = nil
puts obj.searchTransactionsCustom(token, search, matchAll, start, limit, fieldList, format, sort)

# SYNOPSIS
#   searchCustomersCustom(token, search, matchAll, start, limit, fieldList, format, sort)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   search          SearchParamArray - {urn:usaepay}SearchParamArray
#   matchAll        Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#   start           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   limit           C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   fieldList       StringArray - {urn:usaepay}stringArray
#   format          C_String - {http://www.w3.org/2001/XMLSchema}string
#   sort            C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   searchCustomersCustomReturn C_String - {http://www.w3.org/2001/XMLSchema}string
#
token = search = matchAll = start = limit = fieldList = format = sort = nil
puts obj.searchCustomersCustom(token, search, matchAll, start, limit, fieldList, format, sort)

# SYNOPSIS
#   updateCustomer(token, custNum, customerData)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   custNum         C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   customerData    CustomerObject - {urn:usaepay}CustomerObject
#
# RETURNS
#   updateCustomerReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = custNum = customerData = nil
puts obj.updateCustomer(token, custNum, customerData)

# SYNOPSIS
#   updateCustomerPaymentMethod(token, paymentMethod, verify)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   paymentMethod   PaymentMethod - {urn:usaepay}PaymentMethod
#   verify          Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
# RETURNS
#   updateCustomerPaymentMethodReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = paymentMethod = verify = nil
puts obj.updateCustomerPaymentMethod(token, paymentMethod, verify)

# SYNOPSIS
#   updateProduct(token, productRefNum, product)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   productRefNum   C_String - {http://www.w3.org/2001/XMLSchema}string
#   product         Product - {urn:usaepay}Product
#
# RETURNS
#   updateProductReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = productRefNum = product = nil
puts obj.updateProduct(token, productRefNum, product)

# SYNOPSIS
#   updateProductCategory(token, productCategoryRefNum, productCategory)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   productCategoryRefNum C_String - {http://www.w3.org/2001/XMLSchema}string
#   productCategory ProductCategory - {urn:usaepay}ProductCategory
#
# RETURNS
#   updateProductCategoryReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = productCategoryRefNum = productCategory = nil
puts obj.updateProductCategory(token, productCategoryRefNum, productCategory)

# SYNOPSIS
#   updateReceipt(token, receiptRefNum, receipt)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   receiptRefNum   C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   receipt         Receipt - {urn:usaepay}Receipt
#
# RETURNS
#   updateReceiptResponseReturn C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
token = receiptRefNum = receipt = nil
puts obj.updateReceipt(token, receiptRefNum, receipt)

# SYNOPSIS
#   voidTransaction(token, refNum)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#
# RETURNS
#   voidTransactionReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = refNum = nil
puts obj.voidTransaction(token, refNum)

# SYNOPSIS
#   overrideTransaction(token, refNum, reason)
#
# ARGS
#   token           UeSecurityToken - {urn:usaepay}ueSecurityToken
#   refNum          C_Integer - {http://www.w3.org/2001/XMLSchema}integer
#   reason          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   overrideTransactionReturn Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
token = refNum = reason = nil
puts obj.overrideTransaction(token, refNum, reason)


