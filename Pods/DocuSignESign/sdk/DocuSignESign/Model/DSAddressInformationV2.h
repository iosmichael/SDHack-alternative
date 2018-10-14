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




@protocol DSAddressInformationV2
@end

@interface DSAddressInformationV2 : DSObject

/* First Line of the address. Maximum length: 100 characters. [optional]
 */
@property(nonatomic) NSString* address1;
/* Second Line of the address. Maximum length: 100 characters. [optional]
 */
@property(nonatomic) NSString* address2;
/*  [optional]
 */
@property(nonatomic) NSString* city;
/* Specifies the country associated with the address. [optional]
 */
@property(nonatomic) NSString* country;
/*  [optional]
 */
@property(nonatomic) NSString* fax;
/*  [optional]
 */
@property(nonatomic) NSString* phone;
/*  [optional]
 */
@property(nonatomic) NSString* postalCode;
/* The state or province associated with the address. [optional]
 */
@property(nonatomic) NSString* stateOrProvince;

@end