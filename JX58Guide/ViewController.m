//
//  ViewController.m
//  JX58Guide
//
//  Created by yuezuo on 16/5/10.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *personImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sunImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载滚动视图
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIImage * image = [UIImage imageNamed:@"520_userguid_bg"];
    scrollView.contentSize = image.size;
    UIImageView * bgImageView = [[UIImageView alloc] initWithImage:image];
    CGRect rect = bgImageView.frame;
    rect.size.height = self.view.frame.size.height;
    bgImageView.frame = rect;
    [scrollView addSubview:bgImageView];
    
    UIImage * image2 = [UIImage imageNamed:@"520_userguid_cg"];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image2];
    imageView.frame = rect;
    [scrollView addSubview:imageView];
    // 设置代理
    scrollView.delegate = self;
    // 设置减速距离
    scrollView.decelerationRate = 0.1;
    
    [self.view insertSubview:scrollView atIndex:0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 取出偏移角度
    CGFloat offsetX = scrollView.contentOffset.x;
    int intOffsetX = (int)offsetX;
    NSString * string = [NSString stringWithFormat:@"520_userguid_person_taitou_%d",(intOffsetX % 2 + 1)];
    UIImage * image = [UIImage imageNamed:string];
    self.personImageView.image = image;
    self.sunImageView.transform = CGAffineTransformRotate(self.sunImageView.transform, (5 * 180)/ M_PI);
}
@end
