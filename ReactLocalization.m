//
// The MIT License (MIT)
//
// Copyright (c) 2015 Stefano Falda (stefano.falda@gmail.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "ReactLocalization.h"

@interface ReactLocalization ()
-(NSString*) getCurrentLanguage;
@end

@implementation ReactLocalization
  RCT_EXPORT_MODULE();
/*
 * Private implementation
 */
-(NSString*) getCurrentLanguage{
    return [[NSLocale preferredLanguages] objectAtIndex:0];
}

/*
 * Method called from javascript with a callback in case of success
 */
RCT_EXPORT_METHOD(getLanguage:(RCTResponseSenderBlock)callback){
    NSString * language =  [self getCurrentLanguage];
    NSLog(@"Language: %@", language);
    callback(@[[NSNull null], language]);
}

/*
 * Expose the language directly to javascript avoiding the callback
 */
- (NSDictionary *)constantsToExport
{
    return @{ @"language": [self getCurrentLanguage]};
}
@end
