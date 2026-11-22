# VerificationAPI

All URIs are relative to *https://palsa.mhodieknowledge.workers.dev*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkVerification**](VerificationAPI.md#checkverification) | **POST** /v1/verifications/{id}/check | Check a code
[**startVerification**](VerificationAPI.md#startverification) | **POST** /v1/verifications | Send a one-time code


# **checkVerification**
```swift
    open class func checkVerification(id: String, checkVerificationRequest: CheckVerificationRequest, completion: @escaping (_ data: CheckVerification200Response?, _ error: Error?) -> Void)
```

Check a code

Wrong guesses are counted and the challenge locks after too many, so do not guess. Requires the `verifications.write` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 
let checkVerificationRequest = checkVerification_request(code: "code_example") // CheckVerificationRequest | 

// Check a code
VerificationAPI.checkVerification(id: id, checkVerificationRequest: checkVerificationRequest) { (response, error) in
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

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String** |  | 
 **checkVerificationRequest** | [**CheckVerificationRequest**](CheckVerificationRequest.md) |  | 

### Return type

[**CheckVerification200Response**](CheckVerification200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startVerification**
```swift
    open class func startVerification(verificationRequest: VerificationRequest, completion: @escaping (_ data: StartVerification201Response?, _ error: Error?) -> Void)
```

Send a one-time code

Palsa generates the code, keeps only a salted hash of it and sends it to the recipient, so nobody else ever sees it. With a sandbox key it comes back as `sandboxCode`, which is what lets you integrate without a handset.  At most five challenges per address every fifteen minutes. A code counts as a transactional send, so quiet hours do not hold it. Requires the `verifications.write` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let verificationRequest = VerificationRequest(channel: "channel_example", to: "to_example", length: 123, expiresInSeconds: 123, template: "template_example", flow: "flow_example") // VerificationRequest | 

// Send a one-time code
VerificationAPI.startVerification(verificationRequest: verificationRequest) { (response, error) in
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

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verificationRequest** | [**VerificationRequest**](VerificationRequest.md) |  | 

### Return type

[**StartVerification201Response**](StartVerification201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

