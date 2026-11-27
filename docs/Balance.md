# Balance

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**channel** | [**Channel**](Channel.md) |  | 
**included** | **Int** | The plan&#39;s allowance for this period. | 
**purchased** | **Int** | Credit bought separately | 
**reservedIncluded** | **Int** | Included units promised to sends in flight. | 
**reservedPurchased** | **Int** | Purchased units promised to sends in flight. | 
**usedIncluded** | **Int** |  | 
**usedPurchased** | **Int** |  | 
**available** | **Int** | &#x60;included + purchased - reserved&#x60;, and what a send is actually checked against. It cannot go below nothing.  | 
**periodEnd** | **String** | When the included allowance expires. Purchased units are unaffected by it. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


