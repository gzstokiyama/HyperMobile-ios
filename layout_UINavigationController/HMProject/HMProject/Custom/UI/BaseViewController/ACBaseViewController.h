//
//  ACBaseViewController.h
//


#import <UIKit/UIKit.h>


/** ViewController 的 加载方式 */
enum EM_BaseVC_LoadType
{
    BVLT_PushType           = 333127,
    BVLT_ModalType          = 333128
};


@interface ACBaseViewController : UIViewController

/** 用于界面之间通信的 键值对 */
@property (strong, nonatomic) NSDictionary *communicationDictionary;


/** 视图控制器加载类型 */
@property (nonatomic) NSInteger loadType;

/** 是否需要自定义返回按钮 */
@property (nonatomic) BOOL customBackButton;


/**
 * 导航栏返回按钮事件
 * @return 无
 * @param sender UIButton *
 */
- (void)backBtnPressed:(id)sender;


@end
