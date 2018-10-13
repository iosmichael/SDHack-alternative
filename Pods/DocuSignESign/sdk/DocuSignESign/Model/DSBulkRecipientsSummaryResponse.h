#import <Foundation/Foundation.h>
#import "DSObject.h"

/**
* DocuSign REST API
* The DocuSign REST API provides you with a powerful, convenient, and simple Web services API for interacting with DocuSign.
*
* OpenAPI spec version: v2
* 
*
* NOTE: This class is auto generated by the swagger code generator program.
* https://github.com/swagger-api/swagger-codegen.git
* Do not edit the class manually.
*/


#import "DSBulkRecipient.h"
#import "DSErrorDetails.h"


@protocol DSBulkRecipientsSummaryResponse
@end

@interface DSBulkRecipientsSummaryResponse : DSObject

/* A complex type containing information about the bulk recipients in the response. [optional]
 */
@property(nonatomic) NSArray<DSBulkRecipient>* bulkRecipients;
/* The number of items returned in this response. [optional]
 */
@property(nonatomic) NSString* bulkRecipientsCount;
/* Contains a URI for an endpoint that allows you to easily retrieve bulk recipient information. [optional]
 */
@property(nonatomic) NSString* bulkRecipientsUri;
/* Array or errors. [optional]
 */
@property(nonatomic) NSArray<DSErrorDetails>* errorDetails;

@end