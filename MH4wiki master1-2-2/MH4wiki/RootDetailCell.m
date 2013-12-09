//
//  RootDetailCell.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/03.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "RootDetailCell.h"
#import "IIViewDeckController.h"
@implementation RootDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.nextResponder touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
    
    [self.nadView removeFromSuperview];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self.view addSubview:self.nadView];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
