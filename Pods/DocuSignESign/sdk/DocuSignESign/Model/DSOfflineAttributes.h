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




@protocol DSOfflineAttributes
@end

@interface DSOfflineAttributes : DSObject

/* A GUID identifying the account associated with the consumer disclosure [optional]
 */
@property(nonatomic) NSString* accountEsignId;
/* A string containing information about the model of the device used for offline signing. [optional]
 */
@property(nonatomic) NSString* deviceModel;
/* A string containing information about the type of device used for offline signing. [optional]
 */
@property(nonatomic) NSString* deviceName;
/* A string containing the latitude of the device location at the time of signing. [optional]
 */
@property(nonatomic) NSString* gpsLatitude;
/* A string containing the longitude of the device location at the time of signing. [optional]
 */
@property(nonatomic) NSString* gpsLongitude;
/*  [optional]
 */
@property(nonatomic) NSString* offlineSigningHash;

@end
