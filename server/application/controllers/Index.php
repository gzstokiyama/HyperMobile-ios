<?php
class IndexController extends Base_Controller {
	
	 public function init() {//初始化函数
        if ($this->getRequest()->isXmlHttpRequest()) {
            //如果是Ajax请求, 关闭自动渲染, 由我们手工返回Json响应
            Yaf_Dispatcher::getInstance()->disableView();
        }

   }
	
   public function indexAction() {//默认Action
      if (isset($_SESSION['is_login'])) {
        header("Location:http://hm.cmcc.in/project/index");
        die();
      }
   		 
   }

   
   
}
?>