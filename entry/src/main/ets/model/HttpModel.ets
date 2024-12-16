import { Story } from "../entity/beans";
import { ArrayList } from "@kit.ArkTS";

export interface BasicResult<T>{
  msg:string;
  code:number;
  result:T;
}

export interface LoginParams{
  username:string,
  password:string
}


export interface StoryTodayRecParams{
  key:string,
  num:number
}

export class  Login {
  id?: number;
  username?: string;
  password?: string;
}





export type LoginDTO = BasicResult<Login>


export type StoryTodayRecDTO = BasicResult<ArrayList<Story>>
