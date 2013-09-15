<?php
class ProjectController extends Base_Controller {
	
	 public function init() {//初始化函数

        if ($this->getRequest()->isXmlHttpRequest()) {
            //如果是Ajax请求, 关闭自动渲染, 由我们手工返回Json响应
            Yaf_Dispatcher::getInstance()->disableView();
        }
        if (!isset($_SESSION['is_login'])) {
          header("Location:http://hm.cmcc.in/");die();
        }

   }
	
   public function indexAction(){
     //index page
   }

   public function templateAction(){
    //模板浏览器
    $path=empty($_GET['path'])?"":$_GET['path'];
    if (substr($path, 0,1)=="/") {
      $path=substr($path,1,strlen($path)-1);
    }
    if (substr($path,0,2)=='..'||strpos($path,'..')) {
      throw new Yaf_Exception("ILLEGAL FILE PATH");
    }
    $mbdir=APPLICATION_PATH."/conf/template/";
    $fullpath=$mbdir.$path;
    $mbbundlename="htest";
    //判断是否存在
    if (!file_exists($fullpath)) {
      throw new Yaf_Exception("FILE NOT EXISTS");
    }
    $path_array=explode("/", $path);
    $this->assign("path_array",$path_array);
    
    //判断路径是文件夹还是文件
    if (is_dir($fullpath)) {
      //路径是文件夹
      $dir=scandir($fullpath,0);
      $this->assign("render","folder");
      $this->assign("path",$path);
      $this->assign("fullpath",$fullpath);
    }elseif (is_file($fullpath)) {
      //路径是文件名
      $dir=scandir(dirname($fullpath),0);
      $this->assign("render","file");
      $this->assign("path",$path);
      $this->assign("fullpath",$fullpath);
    }else{
      throw new Yaf_Exception("FILE IS NOT DIR EITHER FILE");
    }
    foreach ($dir as $key => $value) {
      if ($value=="."||$value=="..") {
        unset($dir[$key]);
      }
    }
    $this->assign("dir",$dir);



   }

   public function listsAction(){
    $path=empty($_GET['path'])?"":$_GET['path'];
    if (substr($path, 0,1)=="/") {
      $path=substr($path,1,strlen($path)-1);
    }
    if (substr($path,0,2)=='..'||strpos($path,'..')) {
      throw new Yaf_Exception("ILLEGAL FILE PATH");
    }
    $mbdir=APPLICATION_PATH."/conf/applists/";
    $fullpath=$mbdir.$path;
    // $mbbundlename="htest";
    //判断是否存在
    if (!file_exists($fullpath)) {
      throw new Yaf_Exception("FILE NOT EXISTS");
    }
    $path_array=explode("/", $path);
    $this->assign("path_array",$path_array);
    
    //判断路径是文件夹还是文件
    if (is_dir($fullpath)) {
      //路径是文件夹
      $dir=scandir($fullpath,0);
      $this->assign("render","folder");
      $this->assign("path",$path);
      $this->assign("fullpath",$fullpath);
    }elseif (is_file($fullpath)) {
      //路径是文件名
      $dir=scandir(dirname($fullpath),0);
      $this->assign("render","file");
      $this->assign("path",$path);
      $this->assign("fullpath",$fullpath);
    }else{
      throw new Yaf_Exception("FILE IS NOT DIR EITHER FILE");
    }
    foreach ($dir as $key => $value) {
      if ($value=="."||$value=="..") {
        unset($dir[$key]);
      }
    }
    $this->assign("dir",$dir);


   }

   public function mkdirAction(){
    if (isset($_POST['submit'])&&!empty($_POST['folder'])) {
      if (file_exists(APPLICATION_PATH."/conf/applists/".$_POST['folder'])) {
        $this->ajax(0,"file or folder exists","error");
      }else{
        mkdir(APPLICATION_PATH."/conf/applists/".$_POST['folder']);
        recurse_copy(APPLICATION_PATH."/conf/template",APPLICATION_PATH."/conf/applists/".$_POST['folder']);
        $this->ajax(1,"folder create succes","");
      }
    }
   }

   public function renameAction(){
    if (isset($_POST['submit'])&&!empty($_POST['folder'])) {
      if (!file_exists(APPLICATION_PATH."/conf/applists/".$_POST['folder'])) {
        $this->ajax(0,"project folder not exist when trying the rename action","error");
      }else{
        //先重命名文件夹 然后 文件
        $base_dir=APPLICATION_PATH."/conf/applists/".$_POST['folder'];
        if (rename($base_dir."/htest",$base_dir."/".$_POST['bundleid'])&&rename($base_dir."/htest.xcodeproj",$base_dir."/".$_POST['bundleid'].".xcodeproj")) {
          //然后重命名文件
          $base_dir_file=$base_dir."/".$_POST['bundleid'];
          if (rename($base_dir_file."/htest-Info.plist", $base_dir_file."/".$_POST['bundleid']."-Info.plist")&&rename($base_dir_file."/htest-Prefix.pch",$base_dir_file."/".$_POST['bundleid']."-Prefix.pch")) {
            $this->ajax(1,"success","");
          }else{
            $this->ajax(0,"project file rename failed  when trying the rename action","error");
          }
        }else{
          $this->ajax(0,"project folder rename failed  when trying the rename action","error");
        }
      }
    }
   }

   public function replaceAction(){//修改文件夹中关键词
    if (isset($_POST['submit'])&&!empty($_POST['folder'])) {
      if (!file_exists(APPLICATION_PATH."/conf/applists/".$_POST['folder'])) {
        $this->ajax(0,"project folder not exist when trying the replace action","error");
      }else{
        $base_dir=APPLICATION_PATH."/conf/applists/".$_POST['folder'];
        $pbfile_contents=file_get_contents($base_dir."/".$_POST['bundleid'].".xcodeproj/project.pbxproj");
        $pbfile_contents_new=str_replace("htest",$_POST['bundleid'],$pbfile_contents);
        if(file_put_contents($base_dir."/".$_POST['bundleid'].".xcodeproj/project.pbxproj", $pbfile_contents_new)!==false){
          $info_plist_contents=file_get_contents($base_dir."/".$_POST['bundleid']."/".$_POST['bundleid']."-Info.plist");
          $temp=str_replace("<string>htest.displayname</string>","<string>".$_POST['displayname']."</string>",$info_plist_contents);
          $info_plist_contents=str_replace('<string>com.imshenqi.${PRODUCT_NAME:rfc1034identifier}</string>',"<string>com.imshenqi.".$_POST['bundleid']."</string>", $temp);
          if (file_put_contents($base_dir."/".$_POST['bundleid']."/".$_POST['bundleid']."-Info.plist",$info_plist_contents)) {
            $this->ajax(1,"succes","");
          }else{
            $this->ajax(0,"file write fail:-info.plist","error");
          }
        }else{
          $this->ajax(0,"file write fail:project.pbxproj","error");
        }
        
      }
    }

   }

   public function deleteAction(){
      if (isset($_GET['type'])&&isset($_POST['path'])) {
         if ($_GET['type']=="folder") {
           $result=deldir(APPLICATION_PATH."/conf/applists/".$_POST['path']);
         }elseif ($_GET['type']=='file') {
           $result=unlink(APPLICATION_PATH."/conf/applists/".$_POST['path']);
         }else{
          $this->ajax(0,"unknown error",'');
         }
         if ($result) {
           $this->ajax(1,"delete success",'');
         }else{
           $this->ajax(0,"delete fail",'');
         }
      }
   }


   public function anaAction(){
    Yaf_Dispatcher::getInstance()->disableView();

    try {
      $aa=PbxEdit::getInstance(APPLICATION_PATH."/conf/applists/project.pbxproj");
       $aaaaa=$aa->addaclass('testclass','newgroup/htest');
       var_dump($aaaaa);
    } catch (Yaf_Exception $e) {
      echo $e->getMessage();
    }
       
       
    }
  

   
}
?>