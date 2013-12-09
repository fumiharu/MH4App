//
//  RootDetailCell.h
//  MH4wiki
//
//  Created by fumiharu on 2013/09/03.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"

@interface RootDetailCell : UITableViewCell
<NADViewDelegate>
//  ------Arms------
    @property (weak, nonatomic) IBOutlet UILabel *ArmsName;
    @property (weak, nonatomic) IBOutlet UILabel *ArmsPrice;
    @property (weak, nonatomic) IBOutlet UILabel *ArmsPower;
    @property (weak, nonatomic) IBOutlet UILabel *ArmsSlot;
    @property (weak, nonatomic) IBOutlet UILabel *ArmsSpecific;
    @property (weak, nonatomic) IBOutlet UILabel *ArmsMaterial0;
    @property (weak, nonatomic) IBOutlet UILabel *ArmsMaterial1;
    @property (weak, nonatomic) IBOutlet UILabel *ArmsGreatDamage;
    @property (weak, nonatomic) IBOutlet UIImageView *ArmsSharpnessImage;

//  ------WeakPointOfMonster------
    @property (weak, nonatomic) IBOutlet UILabel *MonsterNameLabel;
    @property (weak, nonatomic) IBOutlet UILabel *WeakPointOfMonsterLabel;
    @property (weak, nonatomic) IBOutlet UIImageView *WeakPointOfMonsterImage;
//  ------MixedItem------
    @property (weak, nonatomic) IBOutlet UILabel *MixedItemResultSuccess;
    @property (weak, nonatomic) IBOutlet UILabel *MixedItemResultUp;
    @property (weak, nonatomic) IBOutlet UILabel *MixedItemResultDataInSection;
    @property (weak, nonatomic) IBOutlet UILabel *MixedItemDataInSection;
//  ------Skill------
    @property (weak, nonatomic) IBOutlet UILabel *SkillDetailDataTitle;
    @property (weak, nonatomic) IBOutlet UILabel *SkillName0;
    @property (weak, nonatomic) IBOutlet UILabel *SkillName1;
    @property (weak, nonatomic) IBOutlet UILabel *SkillName2;
    @property (weak, nonatomic) IBOutlet UILabel *SkillName3;
    @property (weak, nonatomic) IBOutlet UILabel *SkillName4;
    @property (weak, nonatomic) IBOutlet UILabel *SkillName5;
    @property (weak, nonatomic) IBOutlet UILabel *TriggeredPointOfSkill0;
    @property (weak, nonatomic) IBOutlet UILabel *TriggeredPointOfSkill1;
    @property (weak, nonatomic) IBOutlet UILabel *TriggeredPointOfSkill2;
    @property (weak, nonatomic) IBOutlet UILabel *TriggeredPointOfSkill3;
    @property (weak, nonatomic) IBOutlet UILabel *TriggeredPointOfSkill4;
    @property (weak, nonatomic) IBOutlet UILabel *TriggeredPointOfSkill5;
    @property (weak, nonatomic) IBOutlet UILabel *EffectiveSkill0;
    @property (weak, nonatomic) IBOutlet UILabel *EffectiveSkill1;
    @property (weak, nonatomic) IBOutlet UILabel *EffectiveSkill2;
    @property (weak, nonatomic) IBOutlet UILabel *EffectiveSkill3;
    @property (weak, nonatomic) IBOutlet UILabel *EffectiveSkill4;
    @property (weak, nonatomic) IBOutlet UILabel *EffectiveSkill5;
//  ------Adornment------
    @property (weak, nonatomic) IBOutlet UILabel *AdornmentName;
    @property (weak, nonatomic) IBOutlet UILabel *AdornmentEffect;
    @property (weak, nonatomic) IBOutlet UILabel *AdornmentSlot;
    @property (weak, nonatomic) IBOutlet UILabel *AdornmentMaterial0;
    @property (weak, nonatomic) IBOutlet UILabel *AdornmentMaterial1;

    @property (retain, nonatomic)NADView *nadView;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;    
@end
