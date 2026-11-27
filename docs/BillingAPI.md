# BillingAPI

All URIs are relative to *https://api.palsa.co.zw*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBalances**](BillingAPI.md#getbalances) | **GET** /v1/balances | Prepaid balances


# **getBalances**
```swift
    open class func getBalances(completion: @escaping (_ data: GetBalances200Response?, _ error: Error?) -> Void)
```

Prepaid balances

What is available now, what is already promised to sends in flight, and what has been used, per channel. Requires the `analytics.read` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi


// Prepaid balances
BillingAPI.getBalances() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetBalances200Response**](GetBalances200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

