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




@protocol DSReferralInformation
@end

@interface DSReferralInformation : DSObject

/* A complex type that contains the following information for entering referral and discount information. The following items are included in the referral information (all string content): enableSupport, includedSeats, saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, saleDiscountSeatPriceOverride, planStartMonth, referralCode, referrerName, advertisementId, publisherId, shopperId, promoCode, groupMemberId, idType, and industry.  ###### Note: saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, and saleDiscountSeatPriceOverride are reserved for DoucSign use only.   [optional]
 */
@property(nonatomic) NSString* advertisementId;
/* When set to **true**, then customer support is provided as part of the account plan. [optional]
 */
@property(nonatomic) NSString* enableSupport;
/*  [optional]
 */
@property(nonatomic) NSString* externalOrgId;
/*  [optional]
 */
@property(nonatomic) NSString* groupMemberId;
/*  [optional]
 */
@property(nonatomic) NSString* idType;
/* The number of seats (users) included. [optional]
 */
@property(nonatomic) NSString* includedSeats;
/*  [optional]
 */
@property(nonatomic) NSString* industry;
/*  [optional]
 */
@property(nonatomic) NSString* planStartMonth;
/*  [optional]
 */
@property(nonatomic) NSString* promoCode;
/*  [optional]
 */
@property(nonatomic) NSString* publisherId;
/*  [optional]
 */
@property(nonatomic) NSString* referralCode;
/*  [optional]
 */
@property(nonatomic) NSString* referrerName;
/* Reserved for DocuSign use only. [optional]
 */
@property(nonatomic) NSString* saleDiscountAmount;
/* Reserved for DocuSign use only. [optional]
 */
@property(nonatomic) NSString* saleDiscountFixedAmount;
/* Reserved for DocuSign use only. [optional]
 */
@property(nonatomic) NSString* saleDiscountPercent;
/* Reserved for DocuSign use only. [optional]
 */
@property(nonatomic) NSString* saleDiscountPeriods;
/* Reserved for DocuSign use only. [optional]
 */
@property(nonatomic) NSString* saleDiscountSeatPriceOverride;
/*  [optional]
 */
@property(nonatomic) NSString* shopperId;

@end
