# SendResult

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**status** | **String** | &#x60;running&#x60;, &#x60;scheduled&#x60; when held or scheduled, or &#x60;pending_approval&#x60;. | 
**mode** | **String** |  | 
**recipients** | **Int** |  | 
**units** | **[String: Int]** | Billable units, per channel. | 
**skipped** | **Int** | How many recipients were left out. The quote says why. | 
**warnings** | [Blocker] | Things that did not stop the send. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


