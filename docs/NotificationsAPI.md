# NotificationsAPI

All URIs are relative to *https://api.palsa.co.zw*

Method | HTTP request | Description
------------- | ------------- | -------------
[**describeMcp**](NotificationsAPI.md#describemcp) | **GET** /v1/mcp | What the MCP endpoint is
[**getNotification**](NotificationsAPI.md#getnotification) | **GET** /v1/notifications/{id} | One send
[**listNotifications**](NotificationsAPI.md#listnotifications) | **GET** /v1/notifications | List sends
[**quoteSend**](NotificationsAPI.md#quotesend) | **POST** /v1/quotes | Price a send without making it
[**sendNotification**](NotificationsAPI.md#sendnotification) | **POST** /v1/notifications | Send a notification


# **describeMcp**
```swift
    open class func describeMcp(completion: @escaping (_ data: DescribeMcp200Response?, _ error: Error?) -> Void)
```

What the MCP endpoint is

Palsa speaks the Model Context Protocol at this address, as JSON-RPC 2.0 over HTTP POST. It is deliberately **not** modelled as typed operations here: a generated method per JSON-RPC call would describe the transport rather than the protocol, and an agent should reach it through an MCP client, not a Palsa SDK.  Requires the `notifications.read` scope.  An agent gets exactly the scopes and the mode of the key it is given. A sandbox key is the one to give it first. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi


// What the MCP endpoint is
NotificationsAPI.describeMcp() { (response, error) in
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

[**DescribeMcp200Response**](DescribeMcp200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNotification**
```swift
    open class func getNotification(id: String, completion: @escaping (_ data: GetNotification200Response?, _ error: Error?) -> Void)
```

One send

Requires the `notifications.read` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 

// One send
NotificationsAPI.getNotification(id: id) { (response, error) in
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

[**GetNotification200Response**](GetNotification200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listNotifications**
```swift
    open class func listNotifications(status: String? = nil, limit: Int? = nil, cursor: String? = nil, completion: @escaping (_ data: ListNotifications200Response?, _ error: Error?) -> Void)
```

List sends

Newest first, paginated by cursor rather than offset, because an offset drifts while new sends arrive. Requires the `notifications.read` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let status = "status_example" // String | Only sends in this state. (optional)
let limit = 987 // Int |  (optional) (default to 25)
let cursor = "cursor_example" // String | The `nextCursor` from a previous page. (optional)

// List sends
NotificationsAPI.listNotifications(status: status, limit: limit, cursor: cursor) { (response, error) in
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
 **status** | **String** | Only sends in this state. | [optional] 
 **limit** | **Int** |  | [optional] [default to 25]
 **cursor** | **String** | The &#x60;nextCursor&#x60; from a previous page. | [optional] 

### Return type

[**ListNotifications200Response**](ListNotifications200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **quoteSend**
```swift
    open class func quoteSend(sendRequest: SendRequest, completion: @escaping (_ data: QuoteSend200Response?, _ error: Error?) -> Void)
```

Price a send without making it

The same calculation the send itself uses: what it would cost, who would be left out and why, and anything that would stop it. Reserves nothing and sends nothing.  Note the size of the answer. `recipients` carries a row per recipient per channel, including their address, so quoting a fifty-thousand-contact audience returns fifty thousand rows. Read `recipientCount` and `units` unless you need the rows themselves.  Requires the `notifications.send` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let sendRequest = SendRequest(channels: [Channel()], to: Recipients(contactIds: ["contactIds_example"], addresses: ["addresses_example"], audienceId: "audienceId_example", topic: "topic_example"), body: "body_example", subject: "subject_example", templateId: "templateId_example", variables: "TODO", purpose: "purpose_example", routing: "routing_example", fallbackOn: "fallbackOn_example", fallbackWaitSeconds: 123, variantBody: "variantBody_example", variantSubject: "variantSubject_example", splitPercent: 123, trackLinks: false, quietStart: "quietStart_example", quietEnd: "quietEnd_example", timezone: "timezone_example", attachmentIds: ["attachmentIds_example"], deepLink: "deepLink_example", ttlSeconds: 123, priority: "priority_example", badge: 123, imageUrl: "imageUrl_example", appId: "appId_example", sound: "sound_example", collapseKey: "collapseKey_example", data: "TODO", silent: false, android: AndroidPushOptions(channelId: "channelId_example", tag: "tag_example", color: "color_example"), ios: IosPushOptions(threadId: "threadId_example", category: "category_example", interruptionLevel: "interruptionLevel_example"), web: WebPushOptions(icon: "icon_example", requireInteraction: false), scheduledAt: "scheduledAt_example", callbackUrl: "callbackUrl_example", metadata: "TODO", name: "name_example") // SendRequest | 

// Price a send without making it
NotificationsAPI.quoteSend(sendRequest: sendRequest) { (response, error) in
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
 **sendRequest** | [**SendRequest**](SendRequest.md) |  | 

### Return type

[**QuoteSend200Response**](QuoteSend200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendNotification**
```swift
    open class func sendNotification(sendRequest: SendRequest, idempotencyKey: String? = nil, completion: @escaping (_ data: SendNotification202Response?, _ error: Error?) -> Void)
```

Send a notification

Reserves credit, then sends. A key beginning `pk_test_` is a sandbox key: the send is accepted, costs nothing and reaches nobody.  Pass `Idempotency-Key` for anything that must not go twice. A repeat with the same key returns the first answer and sends nothing more, which is what makes retrying after a timeout safe.  Requires the `notifications.send` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let sendRequest = SendRequest(channels: [Channel()], to: Recipients(contactIds: ["contactIds_example"], addresses: ["addresses_example"], audienceId: "audienceId_example", topic: "topic_example"), body: "body_example", subject: "subject_example", templateId: "templateId_example", variables: "TODO", purpose: "purpose_example", routing: "routing_example", fallbackOn: "fallbackOn_example", fallbackWaitSeconds: 123, variantBody: "variantBody_example", variantSubject: "variantSubject_example", splitPercent: 123, trackLinks: false, quietStart: "quietStart_example", quietEnd: "quietEnd_example", timezone: "timezone_example", attachmentIds: ["attachmentIds_example"], deepLink: "deepLink_example", ttlSeconds: 123, priority: "priority_example", badge: 123, imageUrl: "imageUrl_example", appId: "appId_example", sound: "sound_example", collapseKey: "collapseKey_example", data: "TODO", silent: false, android: AndroidPushOptions(channelId: "channelId_example", tag: "tag_example", color: "color_example"), ios: IosPushOptions(threadId: "threadId_example", category: "category_example", interruptionLevel: "interruptionLevel_example"), web: WebPushOptions(icon: "icon_example", requireInteraction: false), scheduledAt: "scheduledAt_example", callbackUrl: "callbackUrl_example", metadata: "TODO", name: "name_example") // SendRequest | 
let idempotencyKey = "idempotencyKey_example" // String | A repeat with the same key returns the first answer and sends nothing more. (optional)

// Send a notification
NotificationsAPI.sendNotification(sendRequest: sendRequest, idempotencyKey: idempotencyKey) { (response, error) in
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
 **sendRequest** | [**SendRequest**](SendRequest.md) |  | 
 **idempotencyKey** | **String** | A repeat with the same key returns the first answer and sends nothing more. | [optional] 

### Return type

[**SendNotification202Response**](SendNotification202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

