# ContactCreate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** |  | [optional] [default to ""]
**email** | **String** |  | [optional] 
**phone** | **String** |  | [optional] 
**state** | **String** | Only &#x60;consented&#x60; contacts receive marketing. Say &#x60;consented&#x60; only if you can show they did. | [optional] [default to .pending]
**consentSource** | **String** | Where consent came from. Worth recording. | [optional] 
**tags** | **[String]** |  | [optional] 
**fields** | **[String: String]** | Your own fields, usable as &#x60;{{ variables }}&#x60; in a body. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


