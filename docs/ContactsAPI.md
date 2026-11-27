# ContactsAPI

All URIs are relative to *https://api.palsa.co.zw*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createContact**](ContactsAPI.md#createcontact) | **POST** /v1/contacts | Save a contact
[**deleteContact**](ContactsAPI.md#deletecontact) | **DELETE** /v1/contacts/{id} | Erase a contact
[**listContacts**](ContactsAPI.md#listcontacts) | **GET** /v1/contacts | List contacts
[**registerDevice**](ContactsAPI.md#registerdevice) | **POST** /v1/devices | Register a device for push


# **createContact**
```swift
    open class func createContact(contactCreate: ContactCreate, completion: @escaping (_ data: CreateContact201Response?, _ error: Error?) -> Void)
```

Save a contact

Give an email address or a phone number, or both. `state` is `pending` unless you can show the person consented, and marketing only goes to `consented` contacts. Requires the `contacts.write` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let contactCreate = ContactCreate(name: "name_example", email: "email_example", phone: "phone_example", state: "state_example", consentSource: "consentSource_example", tags: ["tags_example"], fields: "TODO") // ContactCreate | 

// Save a contact
ContactsAPI.createContact(contactCreate: contactCreate) { (response, error) in
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
 **contactCreate** | [**ContactCreate**](ContactCreate.md) |  | 

### Return type

[**CreateContact201Response**](CreateContact201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteContact**
```swift
    open class func deleteContact(id: String, completion: @escaping (_ data: DeleteContact200Response?, _ error: Error?) -> Void)
```

Erase a contact

Requires the `contacts.write` scope.  Here as well as in the console because a deletion request reaches your application at least as often as it reaches your staff.  Their deliveries are kept and their address is removed from them, so the record of what was sent and charged survives without saying who it went to. A suppression for that address is also kept: dropping it would mean the same person, imported again later, is sent to after asking not to be. Their devices and audience memberships go with them. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let id = "id_example" // String | 

// Erase a contact
ContactsAPI.deleteContact(id: id) { (response, error) in
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

[**DeleteContact200Response**](DeleteContact200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listContacts**
```swift
    open class func listContacts(limit: Int? = nil, completion: @escaping (_ data: ListContacts200Response?, _ error: Error?) -> Void)
```

List contacts

Newest first. Requires the `contacts.read` scope.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let limit = 987 // Int |  (optional) (default to 50)

// List contacts
ContactsAPI.listContacts(limit: limit) { (response, error) in
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
 **limit** | **Int** |  | [optional] [default to 50]

### Return type

[**ListContacts200Response**](ListContacts200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerDevice**
```swift
    open class func registerDevice(deviceRegister: DeviceRegister, completion: @escaping (_ data: RegisterDevice201Response?, _ error: Error?) -> Void)
```

Register a device for push

Registering the same token again updates it rather than adding another, and revives one that had been invalidated. Requires the `contacts.write` scope. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import PalsaApi

let deviceRegister = DeviceRegister(token: "token_example", platform: "platform_example", contactId: "contactId_example", appVersion: "appVersion_example", locale: "locale_example") // DeviceRegister | 

// Register a device for push
ContactsAPI.registerDevice(deviceRegister: deviceRegister) { (response, error) in
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
 **deviceRegister** | [**DeviceRegister**](DeviceRegister.md) |  | 

### Return type

[**RegisterDevice201Response**](RegisterDevice201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

