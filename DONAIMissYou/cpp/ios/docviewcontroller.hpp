/*For iOS sharing
  Header for C-Obj files
  From @ekkescorner
*/


#ifndef DOCVIEWCONTROLLER_HPP
#define DOCVIEWCONTROLLER_HPP

#import <UIKit/UIKit.h>
#import <cpp/ios/iosshareutils.hpp>

@interface DocViewController : UIViewController <UIDocumentInteractionControllerDelegate>

@property int requestId;

@property IosShareUtils *mIosShareUtils;

@end



#endif // DOCVIEWCONTROLLER_HPP
