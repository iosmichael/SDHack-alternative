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


#import "DSCustomFieldV2.h"


@protocol DSFolderItem
@end

@interface DSFolderItem : DSObject

/* Specifies the date and time this item was completed. [optional]
 */
@property(nonatomic) NSString* completedDateTime;
/* Indicates the date and time the item was created. [optional]
 */
@property(nonatomic) NSString* createdDateTime;
/* An optional array of strings that allows the sender to provide custom data about the recipient. This information is returned in the envelope status but otherwise not used by DocuSign. Each customField string can be a maximum of 100 characters. [optional]
 */
@property(nonatomic) NSArray<DSCustomFieldV2>* customFields;
/*  [optional]
 */
@property(nonatomic) NSString* _description;
/* The envelope ID of the envelope status that failed to post. [optional]
 */
@property(nonatomic) NSString* envelopeId;
/* Contains a URI for an endpoint that you can use to retrieve the envelope or envelopes. [optional]
 */
@property(nonatomic) NSString* envelopeUri;
/* When set to **true**, indicates that this module is enabled on the account. [optional]
 */
@property(nonatomic) NSString* is21CFRPart11;
/*  [optional]
 */
@property(nonatomic) NSString* isSignatureProviderEnvelope;
/*  [optional]
 */
@property(nonatomic) NSString* lastModified;
/*  [optional]
 */
@property(nonatomic) NSString* name;
/* Name of the envelope owner. [optional]
 */
@property(nonatomic) NSString* ownerName;
/*  [optional]
 */
@property(nonatomic) NSNumber* pageCount;
/*  [optional]
 */
@property(nonatomic) NSString* password;
/*  [optional]
 */
@property(nonatomic) NSString* senderEmail;
/* Name of the envelope sender. [optional]
 */
@property(nonatomic) NSString* senderName;
/* The date and time the envelope was sent. [optional]
 */
@property(nonatomic) NSString* sentDateTime;
/* When set to **true**, this custom tab is shared. [optional]
 */
@property(nonatomic) NSString* shared;
/* Indicates the envelope status. Valid values are:  * sent - The envelope is sent to the recipients.  * created - The envelope is saved as a draft and can be modified and sent later. [optional]
 */
@property(nonatomic) NSString* status;
/*  [optional]
 */
@property(nonatomic) NSString* subject;
/* The unique identifier of the template. If this is not provided, DocuSign will generate a value.  [optional]
 */
@property(nonatomic) NSString* templateId;
/*  [optional]
 */
@property(nonatomic) NSString* uri;

@end
