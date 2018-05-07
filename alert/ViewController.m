

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *labelValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _btn.frame = CGRectMake(100, 100, 100, 100);
    [_btn setTitle:@"点我" forState:(UIControlStateNormal)];
    [_btn addTarget:self action:@selector(ClickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_btn];
}


- (void)ClickAction:(UIButton *)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleAlert];
    //以下方法就可以实现在提示框中输入文本；
    
    //在AlertView中添加一个输入框
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"请输入BUTTON名称";
    }];
    
    //添加一个确定按钮 并获取AlertView中的第一个输入框 将其文本赋值给BUTTON的title
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *envirnmentNameTextField = alertController.textFields.firstObject;
        
        //将 BUTTON 的名称设置为输入的内容
      //  [self.btn setTitle:envirnmentNameTextField.text forState:(UIControlStateNormal)];
        
        self.labelValue.text =envirnmentNameTextField.text;
        //输出 检查是否正确无误
        NSLog(@"你输入的文本%@",envirnmentNameTextField.text);
        
    }]];
    
    //添加一个取消按钮
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    
    //present出AlertView
    [self presentViewController:alertController animated:true completion:nil];
}


@end


