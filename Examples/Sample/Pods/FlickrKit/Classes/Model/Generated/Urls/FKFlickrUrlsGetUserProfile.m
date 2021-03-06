//
//  FKFlickrUrlsGetUserProfile.m
//  FlickrKit
//
//  Generated by FKAPIBuilder on 12 Jun, 2013 at 17:19.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrUrlsGetUserProfile.h" 

@implementation FKFlickrUrlsGetUserProfile

- (BOOL) needsLogin {
    return NO;
}

- (BOOL) needsSigning {
    return NO;
}

- (FKPermission) requiredPerms {
    return -1;
}

- (NSString *) name {
    return @"flickr.urls.getUserProfile";
}

- (BOOL) isValid:(NSError **)error {
    BOOL valid = YES;
	NSMutableString *errorDescription = [[NSMutableString alloc] initWithString:@"You are missing required params: "];

	if(error != NULL) {
		if(!valid) {	
			NSDictionary *userInfo = @{NSLocalizedDescriptionKey: errorDescription};
			*error = [NSError errorWithDomain:FKFlickrKitErrorDomain code:FKErrorInvalidArgs userInfo:userInfo];
		}
	}
    return valid;
}

- (NSDictionary *) args {
    NSMutableDictionary *args = [NSMutableDictionary dictionary];
	if(self.user_id) {
		[args setValue:self.user_id forKey:@"user_id"];
	}

    return [args copy];
}

- (NSString *) descriptionForError:(NSInteger)error {
    switch(error) {
		case FKFlickrUrlsGetUserProfileError_UserNotFound:
			return @"User not found";
		case FKFlickrUrlsGetUserProfileError_NoUserSpecified:
			return @"No user specified";
		case FKFlickrUrlsGetUserProfileError_InvalidAPIKey:
			return @"Invalid API Key";
		case FKFlickrUrlsGetUserProfileError_ServiceCurrentlyUnavailable:
			return @"Service currently unavailable";
		case FKFlickrUrlsGetUserProfileError_FormatXXXNotFound:
			return @"Format \"xxx\" not found";
		case FKFlickrUrlsGetUserProfileError_MethodXXXNotFound:
			return @"Method \"xxx\" not found";
		case FKFlickrUrlsGetUserProfileError_InvalidSOAPEnvelope:
			return @"Invalid SOAP envelope";
		case FKFlickrUrlsGetUserProfileError_InvalidXMLRPCMethodCall:
			return @"Invalid XML-RPC Method Call";
		case FKFlickrUrlsGetUserProfileError_BadURLFound:
			return @"Bad URL found";
  
		default:
			return @"Unknown error code";
    }
}

@end
