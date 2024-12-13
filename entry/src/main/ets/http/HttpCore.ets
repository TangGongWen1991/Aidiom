import axios, { AxiosInstance, AxiosResponse, AxiosError,AxiosRequestConfig } from '@ohos/axios';
import { PreferencesUtil } from '@pura/harmony-utils';
import {ResultEnum,RequestEnum,BASEURL} from './HttpEnum';
let context = getContext(this);

// 定义请求配置接口，支持动态传递 token
interface RequestData<P> {
  url: string; // 请求的 URL
  contentType?: string; // 请求的 Content-Type
  token?: string; // 动态传递的 Token
  params?: P; // 查询参数类型
  method:RequestEnum // 请求方式
}

// 创建 Axios 实例
const instance: AxiosInstance = axios.create({
  baseURL: BASEURL.baseUrl, // 基路径
  timeout: 5000, // 超时时间
});

// 响应拦截器
instance.interceptors.response.use(
  async(response: AxiosResponse) => {
    // 处理响应数据
    if (response.status === ResultEnum.SUCCESS) {
      // token持久化处理
      if(response.data.token){
        PreferencesUtil.put('token',response.data.token,'token_store')
      }
      return response.data; // 返回完整的响应数据
    }
    return Promise.reject(response); // 抛出错误交由 catch 处理
  },
  (error: AxiosError) => {
    return Promise.reject(error);
  }
);

/**
 * GET、POST、PUT、DELETE 请求
 * @param requestData 请求配置
 * @returns 返回 Promise 对象，数据类型由泛型 T 指定
 */
export async function httpRequest<T, P> (requestData: RequestData<P>): Promise<T> {
  // 动态设置 headers 的 Token
  const headers: Record<string, string> = {};
  if (requestData.token) {
    // token处理
    const token =  PreferencesUtil.get('token','','token_store')
    token && (headers.Authorization = String(token));
  }
  // 请求参数格式
  if(requestData.contentType){
    headers['Content-Type'] = requestData.contentType;
  }
  const config:AxiosRequestConfig ={
    url: requestData.url,
    method: requestData.method,
    headers,
  };
  if (requestData.method === RequestEnum.POST || requestData.method === RequestEnum.PUT) {
    config.data = requestData.params; // POST 或 PUT 请求需要将参数放在 data 中
  } else {
    config.params = requestData.params; // GET 或 DELETE 请求需要将参数放在 params 中
  }
  return instance.request(config);
}
