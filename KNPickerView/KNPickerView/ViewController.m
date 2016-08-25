//
//  ViewController.m
//  KNPickerView
//
//  Created by 柯南 on 16/8/25.
//  Copyright © 2016年 柯南. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, copy) UIButton *pickerBtn;
@property (nonatomic, strong) NSArray *dataList;

@property (nonatomic, strong) NSArray *proTimeList;
@property (nonatomic, strong) NSArray *proTitleList;

@property (nonatomic, strong) NSString *proNameStr;
@property (nonatomic, strong) NSString *proTimeStr;

@property (nonatomic, copy) UIPickerView *pickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _proTimeList = [[NSArray alloc]initWithObjects:@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"9",@"10",nil];
    _proTitleList = [[NSArray alloc]initWithObjects:@"1元",@"2元",@"3元",@"4元",@"5元",nil];
    _pickerBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _pickerBtn.frame=CGRectMake(10, 100, self.view.bounds.size.width-20, 50);
    _pickerBtn.backgroundColor=[UIColor yellowColor];
    [_pickerBtn addTarget:self action:@selector(dataPicker) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pickerBtn];
}

-(void)dataPicker
{
    // 选择框
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-162, self.view.bounds.size.width, 162)];
//    _pickerView.layer.masksToBounds=YES;
//    _pickerView.layer.borderWidth=1;
//    _pickerView.layer.cornerRadius=10;
    // 显示选中框
    _pickerView.backgroundColor=[UIColor lightGrayColor];
    _pickerView.showsSelectionIndicator=YES;
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    [self.view addSubview:_pickerView];
}

// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [_proTitleList count];
    }
    
    return [_proTimeList count];
}

// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    if (component == 1) {
        return 40;
    }
    return 180;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _proNameStr = [_proTitleList objectAtIndex:row];
        NSLog(@"11row:%ld",(long)row);
        [_pickerBtn setTitle:_proNameStr forState:UIControlStateNormal];
        [_pickerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
        _proTimeStr = [_proTimeList objectAtIndex:row];
        NSLog(@"22row:%ld",(long)row);

    }
    
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [_proTitleList objectAtIndex:row];
    } else {
        return [_proTimeList objectAtIndex:row];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
