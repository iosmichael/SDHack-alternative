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


#import "DSAccountMinimumPasswordLength.h"
#import "DSAccountPasswordExpirePasswordDays.h"
#import "DSAccountPasswordLockoutDurationMinutes.h"
#import "DSAccountPasswordLockoutDurationType.h"
#import "DSAccountPasswordMinimumPasswordAgeDays.h"
#import "DSAccountPasswordQuestionsRequired.h"
#import "DSAccountPasswordStrengthType.h"


@protocol DSAccountPasswordRules
@end

@interface DSAccountPasswordRules : DSObject

/*  [optional]
 */
@property(nonatomic) NSString* expirePassword;
/*  [optional]
 */
@property(nonatomic) NSString* expirePasswordDays;

@property(nonatomic) DSAccountPasswordExpirePasswordDays* expirePasswordDaysMetadata;
/*  [optional]
 */
@property(nonatomic) NSString* lockoutDurationMinutes;

@property(nonatomic) DSAccountPasswordLockoutDurationMinutes* lockoutDurationMinutesMetadata;
/*  [optional]
 */
@property(nonatomic) NSString* lockoutDurationType;

@property(nonatomic) DSAccountPasswordLockoutDurationType* lockoutDurationTypeMetadata;
/*  [optional]
 */
@property(nonatomic) NSString* minimumPasswordAgeDays;

@property(nonatomic) DSAccountPasswordMinimumPasswordAgeDays* minimumPasswordAgeDaysMetadata;
/*  [optional]
 */
@property(nonatomic) NSString* minimumPasswordLength;

@property(nonatomic) DSAccountMinimumPasswordLength* minimumPasswordLengthMetadata;
/*  [optional]
 */
@property(nonatomic) NSString* passwordIncludeDigit;
/*  [optional]
 */
@property(nonatomic) NSString* passwordIncludeDigitOrSpecialCharacter;
/*  [optional]
 */
@property(nonatomic) NSString* passwordIncludeLowerCase;
/*  [optional]
 */
@property(nonatomic) NSString* passwordIncludeSpecialCharacter;
/*  [optional]
 */
@property(nonatomic) NSString* passwordIncludeUpperCase;
/*  [optional]
 */
@property(nonatomic) NSString* passwordStrengthType;

@property(nonatomic) DSAccountPasswordStrengthType* passwordStrengthTypeMetadata;
/*  [optional]
 */
@property(nonatomic) NSString* questionsRequired;

@property(nonatomic) DSAccountPasswordQuestionsRequired* questionsRequiredMetadata;

@end
