import { ArrayList, List } from '@kit.ArkTS';

@Entry
@Component
struct Login{
  @State btnColors: ArrayList<[ResourceColor,number]> = new ArrayList();

  build() {
    Column() {
      // 标题
      Text('登录')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({ top: 100 })
      // 用户名输入框
      TextInput({ placeholder: '请输入用户名' })
        .margin({ top: 50 })
        .padding(15)
        .border({ width: 1, color: Color.Gray })

      // 密码输入框
      TextInput({ placeholder: '请输入密码' })
        .margin({ top: 20 })
        .type(InputType.Password)
        .padding(15)
        .border({ width: 1, color: Color.Gray })

      // 登录按钮
      Button('登录')
        .width('160.vp')
        .margin({ top: 50 })
        .borderRadius(8) // 设置圆角半径为 8
        .linearGradient({
          angle: 0, // 渐变角度为 0 度，即从左到右
          colors: [
            [Color.Orange, 0 ], // 起始颜色为橙色，偏移量为 0
            [Color.Red, 1 ] // 结束颜色为红色，偏移量为 1
          ]
        })
        .fontColor(Color.White)
        .onClick(() => {
          // 处理登录逻辑
        })

      // 注册链接
      Text('还没有账号？立即注册')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ top: 20 })
        .onClick(() => {
          // 跳转到注册页面
        })

      Row() {
        Button('微信登录')
          .margin({ right: 20 })
          .onClick(() => {
            // 处理微信登录逻辑
          })

        Button('QQ 登录')
          .onClick(() => {
            // 处理 QQ 登录逻辑
          })
      }
      .margin({ top: 30 })
      .alignSelf(ItemAlign.Center)
    }.padding({left:"40.vp",right:'40.vp'})
  }
}

