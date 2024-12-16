/**
 * Common constants for all features.
 */
export class CommonConstants {

  static readonly API_KEY:string = '9f6954dbc6105e136fbe2c98425f3212'
  /**
   * Breakpoint sm.
   */
  static readonly BREAKPOINTS_SM_NAME: string = 'sm';

  static readonly PREFERENCES_NAME: string = 'login.db';
  static readonly MILLISECONDS_TO_SECONDS: number = 1;
  static readonly PROMPT_BOTTOM: string = '80vp';

  /**
   * Logger tag.
   */
  static readonly TAG: string = '[WanziStory]';
  /**
   * Breakpoint md.
   */
  static readonly BREAKPOINTS_MD_NAME: string = 'md';

  /**
   * Breakpoint lg.
   */
  static readonly BREAKPOINTS_LG_NAME: string = 'lg';

  /**
   * Breakpoint xl.
   */
  static readonly BREAKPOINTS_XL_NAME: string = 'xl';

  /**
   * The break point value of sm device.
   */
  static readonly BREAKPOINTS_SM_SIZE: number = 0;

  /**
   * The break point value of md device.
   */
  static readonly BREAKPOINTS_MD_SIZE: number = 600;

  /**
   * The break point value of lg device.
   */
  static readonly BREAKPOINTS_LG_SIZE: number = 840;

  /**
   * The break point value of xl device.
   */
  static readonly BREAKPOINTS_XL_SIZE: number = 1320;

  /**
   * Initialize device breakpoints.
   */
  static readonly BREAKPOINTS_INITIALIZE_NAME: string = 'md';

  /**
   * Initialize device breakpoint Id.
   */
  static readonly BREAKPOINT_ID_INITIALIZE_NAME: string = 'unknown';



  /**
   * The value of tab vertical in sm device.
   */
  static readonly TAB_SM_VERTICAL: boolean = false;

  /**
   * The value of tab vertical in md device.
   */
  static readonly TAB_MD_VERTICAL: boolean = false;

  /**
   * The value of tab vertical in lg device.
   */
  static readonly TAB_LG_VERTICAL: boolean = true;

  /**
   * The value of tab vertical in xl device.
   */
  static readonly TAB_XL_VERTICAL: boolean = true;

  /**
   * The percentage of width of tab bar in sm device.
   */
  static readonly TAB_SM_BAR_WIDTH: string = '100%';

  /**
   * The percentage of width of tab bar in md device.
   */
  static readonly TAB_MD_BAR_WIDTH: string = '100%';

  /**
   * The width of tab bar in lg device.
   */
  static readonly TAB_LG_BAR_WIDTH: string = '96vp';

  /**
   * The width of tab bar in xl device.
   */
  static readonly TAB_XL_BAR_WIDTH: string = '96vp';

  /**
   * The height of tab bar in sm device.
   */
  static readonly TAB_SM_BAR_HEIGHT: string = '56vp';

  /**
   * The height of tab bar in md device.
   */
  static readonly TAB_MD_BAR_HEIGHT: string = '56vp';

  /**
   * The percentage of height tab bar in lg device.
   */
  static readonly TAB_LG_BAR_HEIGHT: string = '60%';

  /**
   * The percentage of height tab bar in xl device.
   */
  static readonly TAB_XL_BAR_HEIGHT: string = '60%';

  /**
   * The percentage of width of tab content.
   */
  static readonly TAB_CONTENT_WIDTH: string = '100%';

  /**
   * The percentage of height of tab content.
   */
  static readonly TAB_CONTENT_HEIGHT: string = '100%';

  /**
   * The percentage of width of flex component.
   */
  static readonly FLEX_TAB_BAR_WIDTH: string = '100%';

  /**
   * The percentage of height of flex component.
   */
  static readonly FLEX_TAB_BAR_HEIGHT: string = '100%';

  /**
   * The percentage of height in row component.
   */
  static readonly FIRST_TAB_CHOOSE_INDEX: number = 0;

  /**
   * The percentage of height in row component.
   */
  static readonly COLUMN_HEIGHT: string = '100%';

  /**
   * The number of tab component.
   */
  static readonly TAB_SIZE: number = 3;

  /**
   * The number of grid item.
   */
  static readonly GRID_SIZE: number = 8;

  /**
   * Initialize device breakpoints.
   */

  /**
   *  The value of aspect ratio in column component.
   */
  static readonly COLUMN_ASPECT_RATIO: number = 16 / 9;

  /**
   * Font weight of text component.
   */
  static readonly COLUMN_TEXT_FONT_WEIGHT: number = 400;

  /**
   *  The percentage of width of row component.
   */
  static readonly ROW_WIDTH: string = '100%';

  /**
   * The value of  attribute of columnsTemplate in sm device.
   */
  static readonly SM_COL_TEMPLATE: string = '1fr 1fr';

  /**
   * The value of  attribute of columnsTemplate in md device.
   */
  static readonly MD_COL_TEMPLATE: string = '1fr 1fr 1fr';

  /**
   * The value of  attribute of columnsTemplate in lg device.
   */
  static readonly LG_COL_TEMPLATE: string = '1fr 1fr 1fr 1fr';

  /**
   * The value of  attribute of columnsTemplate in xl device.
   */
  static readonly XL_COL_TEMPLATE: string = '1fr 1fr 1fr 1fr';

  /**
   * Initialization of attribute columnsTemplate.
   */
  static readonly INITIALIZE_TEMPLATE: string = '1fr 1fr';

  /**
   * Breakpoint name.
   */
  static readonly BREAKPOINT_SYSTEM_NAME: string = 'mainBreakpoint';


  static STORY_TYPE_CY :number = 1  //成语类型

  static STORY_TYPE_SQ :number = 2  //睡前类型

  static STORY_TYPE_TH :number = 3  //童话类型

  static STORY_TYPE_YY :number = 4  //寓言类型


  /**
   * Input length of the account.
   */
  static readonly INPUT_ACCOUNT_LENGTH: number = 11;

  /**
   * Input length of the password.
   */
  static readonly INPUT_PASSWORD_LENGTH: number = 8;

  /**
   * Left padding of the input box.
   */
  static readonly INPUT_PADDING_LEFT: number = 0;

  /**
   * Delay time of simulated login.
   */
  static readonly LOGIN_DELAY_TIME: number = 2000;

  /**
   * Common Spacing of Components.
   */
  static readonly COMMON_SPACE: number = 12;

  /**
   * Spacing of other login methods.
   */
  static readonly LOGIN_METHODS_SPACE: number = 44;

  /**
   * Prompt duration.
   */
  static readonly PROMPT_DURATION: number = 2000;

  /**
   * User authentication dialog.
   */
  static readonly PROMPT_AUTH_DURATION: number = 1000;

  /**
   * Home tab index.
   */
  static readonly HOME_TAB_INDEX: number = 0;

  /**
   * Mine tab index.
   */
  static readonly MINE_TAB_INDEX: number = 1;



  /**
   * Grid columns template.
   */
  static readonly HOME_COLUMNS_TEMPLATE: string = '1fr 1fr 1fr 1fr';

  /**
   * Grid rows template.
   */
  static readonly HOME_ROWS_TEMPLATE: string = '1fr 1fr';

  /**
   * Grid columns template.
   */
  static readonly SECOND_COLUMNS_TEMPLATE: string = '1fr 1fr';

  /**
   * Grid rows template.
   */
  static readonly SECOND_ROWS_TEMPLATE: string = '1fr 1fr';


  /**
   * Key storage field.
   */
  static readonly KEY: string = 'key';

  /**
   * Password storage field.
   */
  static readonly CRYPTO_PASSWORD: string = 'cryptoPassword';

  /**
   * UserName storage field.
   */
  static readonly USER_NAME: string = 'userName';

  /**
   * Keys alias storage field.
   */
  static readonly LOGIN_KEYS: string = 'loginKeys'

  /**
   * Display face authentication.
   */
  static readonly IS_SHOW_FACE: string = 'isShowFace';

  /**
   * Display fingerprint authentication.
   */
  static readonly IS_SHOW_FINGERPRINT: string = 'isShowFingerprint';

  /**
   * Login page url.
   */
  static readonly ROUTER_LOGIN_URL: string = 'pages/LoginPage';

  /**
   * Register page url.
   */
  static readonly ROUTER_REGISTER_URL: string = 'pages/RegisterPage';

  /**
   * Main page url.
   */
  static readonly ROUTER_MAIN_URL: string = 'pages/MainPage';


  /**
   * The width or height of the component is spread across the parent component.
   */
  static readonly FULL_PARENT: string = '100%';

  /**
   * The width of button.
   */
  static readonly BUTTON_WIDTH: string = '90%';

  static STORY_BG :Array<string> = ["https://img2.baidu.com/it/u=896694470,3452642518&fm=253&fmt=auto&app=138&f=JPEG"
    ,"https://book.img.zhangyue01.com/group61/M00/67/1D/CmQUOVxrzI-EaxiuAAAAAHZKGhc875091349.jpg"
    ,"https://img0.baidu.com/it/u=252242681,3292465043&fm=253&fmt=auto&app=138&f=JPEG"
  ,"https://img0.baidu.com/it/u=252242681,3292465043&fm=253&fmt=auto&app=138&f=JPEG"
  ,"https://img0.baidu.com/it/u=2251194715,1299085997&fm=253&fmt=auto&app=138&f=JPEG"
    , "https://img2.baidu.com/it/u=438633042,1365053656&fm=253&fmt=auto&app=138&f=JPEG"
    ,"https://p3.itc.cn/q_70/images03/20200605/84f12ccecd8b44c0a336fde7fdcb3614.jpeg"
    ,"https://img1.baidu.com/it/u=1045589089,2938224748&fm=253&fmt=auto&app=138&f=JPEG"
    ,"https://img0.baidu.com/it/u=1421255062,1027460934&fm=253&fmt=auto&app=138&f=JPEG"
    ,"https://img1.baidu.com/it/u=843235339,2878653287&fm=253&fmt=auto&app=138&f=JPEG"
  ]


}