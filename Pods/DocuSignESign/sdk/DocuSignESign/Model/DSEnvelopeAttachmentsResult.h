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


#import "DSEnvelopeAttachment.h"


@protocol DSEnvelopeAttachmentsResult
@end

@interface DSEnvelopeAttachmentsResult : DSObject

/*  [optional]
 */
@property(nonatomic) NSArray<DSEnvelopeAttachment>* attachments;

@end
