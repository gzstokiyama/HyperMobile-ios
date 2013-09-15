<?php
class UserController extends Base_Controller {
	
	 public function init() {//初始化函数

        if ($this->getRequest()->isXmlHttpRequest()) {
            //如果是Ajax请求, 关闭自动渲染, 由我们手工返回Json响应
            Yaf_Dispatcher::getInstance()->disableView();
        }

   }
	
  public function generateToken(){
     $hour=intval(date("H"));
     $minute = intval(date("i"));
     $day=intval(date("j"));
     $month=intval(date("n"));
     $year=intval(date("Y"));
     $tokenkey1=3;//需要小于4 *(hour+4)
     $tokenkey2=17;//需要小于等于39 +minute
     $tokenkey3=74;//third
     $tokenkey4=7;
    
    
     $gtoken1=($minute+$tokenkey2)%8;//数据范围 0-7
     $gtoken2=(($hour+4)*$tokenkey1)%($gtoken1+2);//数据范围  0-8
     $gtoken3=($gtoken1+$gtoken2+1)%9+1;//数据范围  2-9

     $altoken1=$tokenkey3-($gtoken1*$tokenkey1*3);//数据范围   11-74
     $altoken2=($gtoken2+$tokenkey2+$minute)-$tokenkey4;//10-99
     $altoken3=($hour+$minute)+$tokenkey4+3;//10-94
    
     $token=$altoken1*10000+$altoken2*100+$altoken3+($day*10)+($month*17)+($year*5);
     return $token;
  }





   public function loginAction() {//默认Action
      if (isset($_POST['submit'])) {
          $userarray=Yaf_Registry::get("config")->application->hm->toArray();
          $token=$this->generateToken();
          if ($token!=$_POST['password2']) {
            die("动态口令不对");
          }
          if ($_POST['username']==$userarray['adminname']&&$_POST['password']==$userarray['adminpwd']) {
            $_SESSION['is_login']=1;
            $_SESSION['username']=$userarray['adminname'];
            header("Location:http://hm.cmcc.in/project/index");
          }else{
            die("帐号或者密码不对");
          }


      }
   		 
   }

   public function logoutAction(){
      session_destroy();
      header("Location:http://hm.cmcc.in/");
      die();
   }

   
   
}
?>