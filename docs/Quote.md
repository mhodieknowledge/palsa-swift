# Quote

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**channels** | [Channel] |  | 
**recipients** | [String: [QuotedRecipient]] | A row per recipient per channel. Large: quoting a fifty-thousand-contact audience returns fifty thousand rows, so read &#x60;recipientCount&#x60; unless you need the rows.  | 
**units** | **[String: Int]** | Billable units, per channel. | 
**recipientCount** | **Int** |  | 
**skipped** | [SkippedRecipient] |  | 
**blockers** | [Blocker] | Everything standing in the way. Those with &#x60;skippable: false&#x60; stop the send. | 
**sms** | [**QuoteSms**](QuoteSms.md) |  | 
**variants** | [**QuoteVariants**](QuoteVariants.md) |  | 
**trackedLinks** | **[String]** | The links that will be rewritten. Empty when tracking is off or nothing can be tracked. | 
**heldUntil** | [**QuoteHeldUntil**](QuoteHeldUntil.md) |  | 
**estimateMinor** | **Int** | What the units would cost at the published top-up rate | 
**currency** | **String** |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


