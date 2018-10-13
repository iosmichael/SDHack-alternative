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




@protocol DSAddressInformation
@end

@interface DSAddressInformation : DSObject

/* The city associated with the address. [optional]
 */
@property(nonatomic) NSString* city;
/* Specifies the country associated with the address. [optional]
 */
@property(nonatomic) NSString* country;
/* A Fax number associated with the address if one is available. [optional]
 */
@property(nonatomic) NSString* fax;
/* A phone number associated with the address. [optional]
 */
@property(nonatomic) NSString* phone;
/* The state or province associated with the address. [optional]
 */
@property(nonatomic) NSString* state;
/* The first line of the address. [optional]
 */
@property(nonatomic) NSString* street1;
/* The second line of the address (optional). [optional]
 */
@property(nonatomic) NSString* street2;
/* The zip or postal code associated with the address. [optional]
 */
@property(nonatomic) NSString* zip;

@end
