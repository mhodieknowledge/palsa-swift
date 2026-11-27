# SendingDomainsAPI

All URIs are relative to *https://api.palsa.co.zw*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addSendingDomain**](SendingDomainsAPI.md#addsendingdomain) | **POST** /v1/sending-domains | Add a sending domain
[**checkSendingDomain**](SendingDomainsAPI.md#checksendingdomain) | **POST** /v1/sending-domains/{id}/check | Check a sending domain now
[**getSendingDomain**](SendingDomainsAPI.md#getsendingdomain) | **GET** /v1/sending-domains/{id} | Get a sending domain
[**listSendingDomains**](SendingDomainsAPI.md#listsendingdomains) | **GET** /v1/sending-domains | List sending domains
[**removeSendingDomain**](SendingDomainsAPI.md#removesendingdomain) | **DELETE** /v1/sending-domains/{id} | Remove a sending domain


# **addSendingDomain**
```swift
    open class func addSendingDomain(addSendingDomainRequest: AddSendingDomainRequest, completion: @escaping (_ data: AddSendingDomain201Response?, _ error: Error?) -> Void)
```

Add a sending domain

Registers the domain with Amazon SES under this workspace's own tenant and returns the DNS records to publish: three DKIM CNAMEs, and an MX and SPF TXT for the custom MAIL FROM `bounce.<domain>`. Palsa checks automatically and the domain becomes `verified` once SES finds them. A domain another workspace holds is refused. Requires the `domains.write` scope.  Until email sending is live the domain is stored as `awaiting_provider` with no records; they appear as soon as it is. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let addSendingDomainRequest = addSendingDomain_request(domain: "domain_example") // AddSendingDomainRequest | 

// Add a sending domain
SendingDomainsAPI.addSendingDomain(addSendingDomainRequest: addSendingDomainRequest) { (response, error) in
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
 **addSendingDomainRequest** | [**AddSendingDomainRequest**](AddSendingDomainRequest.md) |  | 

### Return type

[**AddSendingDomain201Response**](AddSendingDomain201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkSendingDomain**
```swift
    open class func checkSendingDomain(id: String, completion: @escaping (_ data: AddSendingDomain201Response?, _ error: Error?) -> Void)
```

Check a sending domain now

Asks SES straight away rather than waiting for the next automatic check. Up to twelve times an hour per domain. Requires the `domains.write` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 

// Check a sending domain now
SendingDomainsAPI.checkSendingDomain(id: id) { (response, error) in
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

### Return type

[**AddSendingDomain201Response**](AddSendingDomain201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSendingDomain**
```swift
    open class func getSendingDomain(id: String, completion: @escaping (_ data: AddSendingDomain201Response?, _ error: Error?) -> Void)
```

Get a sending domain

Requires the `domains.read` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 

// Get a sending domain
SendingDomainsAPI.getSendingDomain(id: id) { (response, error) in
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

### Return type

[**AddSendingDomain201Response**](AddSendingDomain201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSendingDomains**
```swift
    open class func listSendingDomains(completion: @escaping (_ data: ListSendingDomains200Response?, _ error: Error?) -> Void)
```

List sending domains

Every domain this workspace sends email from, with its verification state and the DNS records to publish. Requires the `domains.read` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi


// List sending domains
SendingDomainsAPI.listSendingDomains() { (response, error) in
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

[**ListSendingDomains200Response**](ListSendingDomains200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeSendingDomain**
```swift
    open class func removeSendingDomain(id: String, completion: @escaping (_ data: RemoveSendingDomain200Response?, _ error: Error?) -> Void)
```

Remove a sending domain

Removes the domain from Amazon SES and stops every address on it. Requires the `domains.write` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 

// Remove a sending domain
SendingDomainsAPI.removeSendingDomain(id: id) { (response, error) in
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

### Return type

[**RemoveSendingDomain200Response**](RemoveSendingDomain200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

