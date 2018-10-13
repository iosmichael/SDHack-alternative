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


#import "DSExpirations.h"
#import "DSReminders.h"


@protocol DSNotification
@end

@interface DSNotification : DSObject


@property(nonatomic) DSExpirations* expirations;

@property(nonatomic) DSReminders* reminders;
/* When set to **true**, the account default notification settings are used for the envelope. [optional]
 */
@property(nonatomic) NSString* useAccountDefaults;

@end
