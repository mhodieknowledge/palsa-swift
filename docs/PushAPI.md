# PushAPI

All URIs are relative to *https://api.palsa.co.zw*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addPushApp**](PushAPI.md#addpushapp) | **POST** /v1/push-apps | Connect an app&#39;s Firebase project
[**checkPushApp**](PushAPI.md#checkpushapp) | **POST** /v1/push-apps/{id}/check | Check a push app&#39;s access again
[**confirmPushAppOwnership**](PushAPI.md#confirmpushappownership) | **POST** /v1/push-apps/{id}/ownership | Confirm the code, verifying a delegated app
[**getPushApp**](PushAPI.md#getpushapp) | **GET** /v1/push-apps/{id} | Get a push app
[**listPushApps**](PushAPI.md#listpushapps) | **GET** /v1/push-apps | List push apps
[**listPushTopics**](PushAPI.md#listpushtopics) | **GET** /v1/push-topics | List topics and how many devices each has
[**removePushApp**](PushAPI.md#removepushapp) | **DELETE** /v1/push-apps/{id} | Remove a push app
[**replacePushAppKey**](PushAPI.md#replacepushappkey) | **PUT** /v1/push-apps/{id}/key | Replace a push app&#39;s service-account key
[**sendPushAppOwnershipCode**](PushAPI.md#sendpushappownershipcode) | **POST** /v1/push-apps/{id}/ownership-code | Push a six-digit code to one of your devices
[**subscribeToPushTopic**](PushAPI.md#subscribetopushtopic) | **POST** /v1/push-topics/{topic}/subscribe | Subscribe devices to a topic
[**unsubscribeFromPushTopic**](PushAPI.md#unsubscribefrompushtopic) | **POST** /v1/push-topics/{topic}/unsubscribe | Unsubscribe devices from a topic
[**updatePushApp**](PushAPI.md#updatepushapp) | **PATCH** /v1/push-apps/{id} | Rename a push app or make it the default


# **addPushApp**
```swift
    open class func addPushApp(pushAppCreate: PushAppCreate, completion: @escaping (_ data: InlineObject1?, _ error: Error?) -> Void)
```

Connect an app's Firebase project

With `service_account`, the key is checked with Firebase (a validate-only message, which sends nothing) and the app is verified at once. With `delegated`, grant `grantTo` the Firebase Cloud Messaging API Admin role on the project, then prove ownership with a code sent to one of your devices. Requires the `push.write` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let pushAppCreate = PushAppCreate(name: "name_example", authMode: "authMode_example", projectId: "projectId_example", serviceAccount: "serviceAccount_example", androidPackage: "androidPackage_example", iosBundleId: "iosBundleId_example", webOrigin: "webOrigin_example") // PushAppCreate | 

// Connect an app's Firebase project
PushAPI.addPushApp(pushAppCreate: pushAppCreate) { (response, error) in
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
 **pushAppCreate** | [**PushAppCreate**](PushAppCreate.md) |  | 

### Return type

[**InlineObject1**](InlineObject1.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkPushApp**
```swift
    open class func checkPushApp(id: String, completion: @escaping (_ data: InlineObject1?, _ error: Error?) -> Void)
```

Check a push app's access again

Requires the `push.write` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 

// Check a push app's access again
PushAPI.checkPushApp(id: id) { (response, error) in
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

[**InlineObject1**](InlineObject1.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **confirmPushAppOwnership**
```swift
    open class func confirmPushAppOwnership(id: String, confirmPushAppOwnershipRequest: ConfirmPushAppOwnershipRequest, completion: @escaping (_ data: InlineObject1?, _ error: Error?) -> Void)
```

Confirm the code, verifying a delegated app

Five wrong codes and a new one must be sent. Requires the `push.write` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 
let confirmPushAppOwnershipRequest = confirmPushAppOwnership_request(code: "code_example") // ConfirmPushAppOwnershipRequest | 

// Confirm the code, verifying a delegated app
PushAPI.confirmPushAppOwnership(id: id, confirmPushAppOwnershipRequest: confirmPushAppOwnershipRequest) { (response, error) in
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
 **confirmPushAppOwnershipRequest** | [**ConfirmPushAppOwnershipRequest**](ConfirmPushAppOwnershipRequest.md) |  | 

### Return type

[**InlineObject1**](InlineObject1.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPushApp**
```swift
    open class func getPushApp(id: String, completion: @escaping (_ data: InlineObject1?, _ error: Error?) -> Void)
```

Get a push app

Requires the `push.read` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 

// Get a push app
PushAPI.getPushApp(id: id) { (response, error) in
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

[**InlineObject1**](InlineObject1.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPushApps**
```swift
    open class func listPushApps(completion: @escaping (_ data: ListPushApps200Response?, _ error: Error?) -> Void)
```

List push apps

Requires the `push.read` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi


// List push apps
PushAPI.listPushApps() { (response, error) in
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

[**ListPushApps200Response**](ListPushApps200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPushTopics**
```swift
    open class func listPushTopics(completion: @escaping (_ data: ListPushTopics200Response?, _ error: Error?) -> Void)
```

List topics and how many devices each has

Requires the `push.read` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi


// List topics and how many devices each has
PushAPI.listPushTopics() { (response, error) in
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

[**ListPushTopics200Response**](ListPushTopics200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removePushApp**
```swift
    open class func removePushApp(id: String, completion: @escaping (_ data: InlineObject?, _ error: Error?) -> Void)
```

Remove a push app

Its key is deleted and its devices stop receiving push. Requires the `push.write` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 

// Remove a push app
PushAPI.removePushApp(id: id) { (response, error) in
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

[**InlineObject**](InlineObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **replacePushAppKey**
```swift
    open class func replacePushAppKey(id: String, replacePushAppKeyRequest: ReplacePushAppKeyRequest, completion: @escaping (_ data: InlineObject1?, _ error: Error?) -> Void)
```

Replace a push app's service-account key

For rotating a key. The new one must be for the same project. Requires the `push.write` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 
let replacePushAppKeyRequest = replacePushAppKey_request(serviceAccount: "serviceAccount_example") // ReplacePushAppKeyRequest | 

// Replace a push app's service-account key
PushAPI.replacePushAppKey(id: id, replacePushAppKeyRequest: replacePushAppKeyRequest) { (response, error) in
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
 **replacePushAppKeyRequest** | [**ReplacePushAppKeyRequest**](ReplacePushAppKeyRequest.md) |  | 

### Return type

[**InlineObject1**](InlineObject1.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendPushAppOwnershipCode**
```swift
    open class func sendPushAppOwnershipCode(id: String, sendPushAppOwnershipCodeRequest: SendPushAppOwnershipCodeRequest, completion: @escaping (_ data: InlineObject?, _ error: Error?) -> Void)
```

Push a six-digit code to one of your devices

Delegated apps only. The code arrives as a notification and as the `palsa_verification_code` data key, and lasts 15 minutes. Requires the `push.write` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 
let sendPushAppOwnershipCodeRequest = sendPushAppOwnershipCode_request(deviceToken: "deviceToken_example") // SendPushAppOwnershipCodeRequest | 

// Push a six-digit code to one of your devices
PushAPI.sendPushAppOwnershipCode(id: id, sendPushAppOwnershipCodeRequest: sendPushAppOwnershipCodeRequest) { (response, error) in
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
 **sendPushAppOwnershipCodeRequest** | [**SendPushAppOwnershipCodeRequest**](SendPushAppOwnershipCodeRequest.md) |  | 

### Return type

[**InlineObject**](InlineObject.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subscribeToPushTopic**
```swift
    open class func subscribeToPushTopic(topic: String, deviceTargets: DeviceTargets, completion: @escaping (_ data: InlineObject2?, _ error: Error?) -> Void)
```

Subscribe devices to a topic

Through each device's own app. A token Firebase no longer knows is invalidated. A device whose token is later refreshed through `previousToken` is subscribed again automatically. Requires the `push.write` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let topic = "topic_example" // String | 
let deviceTargets = DeviceTargets(deviceIds: ["deviceIds_example"], tokens: ["tokens_example"], contactIds: ["contactIds_example"]) // DeviceTargets | 

// Subscribe devices to a topic
PushAPI.subscribeToPushTopic(topic: topic, deviceTargets: deviceTargets) { (response, error) in
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
 **topic** | **String** |  | 
 **deviceTargets** | [**DeviceTargets**](DeviceTargets.md) |  | 

### Return type

[**InlineObject2**](InlineObject2.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unsubscribeFromPushTopic**
```swift
    open class func unsubscribeFromPushTopic(topic: String, deviceTargets: DeviceTargets, completion: @escaping (_ data: InlineObject2?, _ error: Error?) -> Void)
```

Unsubscribe devices from a topic

Requires the `push.write` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let topic = "topic_example" // String | 
let deviceTargets = DeviceTargets(deviceIds: ["deviceIds_example"], tokens: ["tokens_example"], contactIds: ["contactIds_example"]) // DeviceTargets | 

// Unsubscribe devices from a topic
PushAPI.unsubscribeFromPushTopic(topic: topic, deviceTargets: deviceTargets) { (response, error) in
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
 **topic** | **String** |  | 
 **deviceTargets** | [**DeviceTargets**](DeviceTargets.md) |  | 

### Return type

[**InlineObject2**](InlineObject2.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePushApp**
```swift
    open class func updatePushApp(id: String, updatePushAppRequest: UpdatePushAppRequest, completion: @escaping (_ data: InlineObject1?, _ error: Error?) -> Void)
```

Rename a push app or make it the default

Requires the `push.write` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 
let updatePushAppRequest = updatePushApp_request(name: "name_example", isDefault: false, androidPackage: "androidPackage_example", iosBundleId: "iosBundleId_example", webOrigin: "webOrigin_example") // UpdatePushAppRequest | 

// Rename a push app or make it the default
PushAPI.updatePushApp(id: id, updatePushAppRequest: updatePushAppRequest) { (response, error) in
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
 **updatePushAppRequest** | [**UpdatePushAppRequest**](UpdatePushAppRequest.md) |  | 

### Return type

[**InlineObject1**](InlineObject1.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

