import {httpRequest} from '../http/HttpCore';
import {LoginDTO,LoginParams, StoryTodayRecDTO, StoryTodayRecParams} from '../model/HttpModel'
import {RequestEnum} from '../http/HttpEnum'

enum Api {
  Login = "/boss/user/validlogin", //登录
  StoryToday = "/story/index",//今日推荐故事
}

export const LoginService = (params: LoginParams) => {
  return httpRequest<LoginDTO,LoginParams>({
    method:RequestEnum.GET,
    url:Api.Login,
    params
  });
};


export const StoryTodayRecService = (params: StoryTodayRecParams) => {
  return httpRequest<StoryTodayRecDTO,StoryTodayRecParams>({
    method:RequestEnum.GET,
    url:Api.Login,
    params
  });
};
