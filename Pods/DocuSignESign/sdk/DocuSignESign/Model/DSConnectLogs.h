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


#import "DSConnectLog.h"


@protocol DSConnectLogs
@end

@interface DSConnectLogs : DSObject

/* An array of containing failure information from the Connect failure log. [optional]
 */
@property(nonatomic) NSArray<DSConnectLog>* failures;
/* A complex type containing Connect log information. It is divided into two sections, one for regular logs and one for Connect failures.  [optional]
 */
@property(nonatomic) NSArray<DSConnectLog>* logs;
/*  [optional]
 */
@property(nonatomic) NSString* totalRecords;
/*  [optional]
 */
@property(nonatomic) NSString* type;

@end