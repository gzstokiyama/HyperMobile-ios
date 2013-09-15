<?php
class PbxEdit {

    /**
     * 单例模式实例化对象
     *
     * @var object
     */
    private static $instance;

    private $pbxFilePath;

    private $file_content;

    private $file_name;//新增文件的文件名，不是本文件

    private $section_id;

    private $ref_id;

    private $group_id;

    private $group_name;

    public $err_msg;

    public function addaclass($file_name,$toGroupID){
        //对下面2个方法的封装
        if ($this->adddoth($file_name,$toGroupID)) {
            return $this->adddotm($file_name,$toGroupID);
        }else{
            return false;
        }
    }

    public function adddoth($file_name,$toGroupID){ //不包含  .h  后缀
        if (!$this->findgroup($toGroupID)) {
            return false;
        }
        $refer_id=$this->generateid();
        $tpl="\t\t".$refer_id.' /* '.$file_name.'.h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; path = '.$file_name.'.h; sourceTree = "<group>"; };';
        $this->write_content('/* Begin PBXFileReference section */',$tpl);
        $group_info=$this->analyseGroupPath($toGroupID);
        $groupchildren_identifier='/'.'* GroupNode:'.$group_info['NodeName'].' NodeId:'.$group_info['NodeId'].' */';
        $tpl2="\t\t\t\t".$refer_id.' /* '.$file_name.'.h */,';
        $this->write_content($groupchildren_identifier,$tpl2);
        return true;
    }

    public function adddotm($file_name,$toGroupID){//不包含 .m 后缀
        if (!$this->findgroup($toGroupID)) {
            return false;
        }
        $refer_id=$this->generateid();
        $tpl1="\t\t".$refer_id.' /* '.$file_name.'.m */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.objc; path = '.$file_name.'.m; sourceTree = "<group>"; };';
        $this->write_content('/* Begin PBXFileReference section */',$tpl1);
        $group_info=$this->analyseGroupPath($toGroupID);
        $groupchildren_identifier='/'.'* GroupNode:'.$group_info['NodeName'].' NodeId:'.$group_info['NodeId'].' */';
        $tpl2="\t\t\t\t".$refer_id.' /* '.$file_name.'.m */,';
        $this->write_content($groupchildren_identifier,$tpl2);
        $section_id=$this->generateid();
        $tpl3="\t\t".$section_id.' /* '.$file_name.'.m in Sources */ = {isa = PBXBuildFile; fileRef = '.$refer_id.' /* '.$file_name.'.m */; };';
        $this->write_content('/* Begin PBXBuildFile section */',$tpl3);
        $tpl4="\t\t\t\t".$section_id.' /* '.$file_name.'.m in Sources */,';
        $this->write_content('/* PBXSourcesBuildPhase section files lists */',$tpl4);
        return true;

    }

    public function adddotpng($file_name,$toGroupID){//这里的group是ID,文件名不含 .png 后缀
        if (!$this->findgroup($toGroupID)) {
            return false;
        }
        $refer_id=$this->generateid();
        $tpl1="\t\t".$refer_id.' /* '.$file_name.'.png */ = {isa = PBXFileReference; lastKnownFileType = image.png; path = "'.$file_name.'.png"; sourceTree = "<group>"; };';
        $this->write_content('/* Begin PBXFileReference section */',$tpl1);
        $group_info=$this->analyseGroupPath($toGroupID);
        $groupchildren_identifier='/'.'* GroupNode:'.$group_info['NodeName'].' NodeId:'.$group_info['NodeId'].' */';
        $tpl2="\t\t\t\t".$refer_id.' /* '.$file_name.'.png */,';
        $this->write_content($groupchildren_identifier,$tpl2);
        $section_id=$this->generateid();
        $tpl3="\t\t".$section_id.' /* '.$file_name.'.png in Resources */ = {isa = PBXBuildFile; fileRef = '.$refer_id.' /* '.$file_name.'.png */; };';
        $this->write_content('/* Begin PBXBuildFile section */',$tpl3);
        $tpl4="\t\t\t\t".$section_id.' /* '.$file_name.'.png in Resources */,';
        $this->write_content('/* PBXResourcesBuildPhase section files lists */',$tpl4);
        return true;
    }

    public function findgroup($group_full_name){//封装下面2个方法
        if ($this->is_group_exists($group_full_name)) {
            return true;
        }
        try {
            $this->addgroup($group_full_name);
            return true;
        } catch (Yaf_Exception $e) {
            $this->err_msg=$e->getMessage();
            return false;
        }
    }

    private function addgroup($group_full_name){
        if ($this->is_group_exists($group_full_name)) {
            return true;
        }else{
            $group_info=$this->analyseGroupPath($group_full_name);
            if (!$this->is_group_exists($group_info['ParentNodeId'])) {
                    throw new Yaf_Exception("ParentNodeId not exists: ".$group_info['ParentNodeId']);
            }else{
                $group_id=$this->generateid();
                $this->group_id=$group_id;
                $tpl="\t\t".$group_id.' /* '.$group_info['NodeName'].' */ = {'.
                "\n\t\t\t".'isa = PBXGroup;'.
                "\n\t\t\t".'children = ('.
                "\n\t\t\t\t".'/'."* GroupNode:".$group_info['NodeName']." NodeId:".$group_info['NodeId']." */".
                "\n\t\t\t".');'.    
                "\n\t\t\t"."path = ".$group_info['NodeName'].";".
                "\n\t\t\t".'sourceTree = "<group>";'.
                "\n\t\t".'};';  

                $this->write_content('/* Begin PBXGroup section */',$tpl);
                //然后将其加入其父节点
                $ParentNodeIdentifier='/'.'* GroupNode:'.$group_info['ParentNodeName'].' NodeId:'.$group_info['ParentNodeId'].' */';
                $add_content_to_parent_node="\t\t\t\t".$group_id.' /* '.$group_info['NodeName']." */,";
                $this->write_content($ParentNodeIdentifier,$add_content_to_parent_node);
                return true;
            }
        }
    }

    private function is_group_exists($group_full_name){//判断组是否存在，不存在返回false，存在返回 true
        $group_info=$this->analyseGroupPath($group_full_name);
        $search='/'.'* GroupNode:'.$group_info['NodeName'].' NodeId:'.$group_full_name.' *'.'/';
        $search_result=strpos($this->file_content,$search);
        if ($search_result===false) {
            return false;
        }else{
            return true;
        }
    }

    private function write_content($resource_identifier,$content){
        $content_array=explode($resource_identifier,$this->file_content);
        if (count($content_array)!=2) {
            // throw new Yaf_Exception(count($content_array));
            throw new Yaf_Exception("resource_identifier:$resource_identifier is not unique");
        }
        $this->file_content=$content_array[0].$resource_identifier."\n".$content.$content_array[1];
        return true;
    }

    private function generateid(){
        $preifx='57';
        $backfix=rand_string(22,1,"ABCDEF");
        return $preifx.$backfix;
    }

    private function analyseGroupInfo($group_full_name){
        //e.g /* GroupNode:classes NodeId:classes/MBProgressHUD/UI/ThirdParty/htest */
        $idstring=trim(str_replace(array('/*','*/'),"",$group_full_name));
        $nodeidpos=strpos($idstring," NodeId:");
        $result['NodeName']=substr($idstring,10,$nodeidpos-10);
        $result['NodeId']=substr($idstring,$nodeidpos+8,strlen($idstring)-$nodeidpos-8);
        if (strpos($result['NodeId'],"/")===false) {
            $result['ParentNodeId']=null;
            $result['ParentNodeName']=null;
            
        }else{
        $result['ParentNodeId']=str_replace($result['NodeName']."/","",$result['NodeId']);
        $result['ParentNodeName']=substr($result['ParentNodeId'],0,strpos($result['ParentNodeId'],"/"));
        }
        if (empty($result['ParentNodeName'])) {
            $result['ParentNodeName']=$result['ParentNodeId'];
        }
        return $result;
    }

    private function analyseGroupPath($group_full_Path){
        //e.g classes/MBProgressHUD/UI/ThirdParty/htest 
        if (strpos($group_full_Path,"/")===false) {
            $result['NodeName']=$group_full_Path;
            $result['NodeId']=$group_full_Path;
            $result['ParentNodeId']=null;
            $result['ParentNodeName']=null;
            return $result;
        }
        
        $result['NodeName']=substr($group_full_Path,0,strpos($group_full_Path,"/"));
        $result['NodeId']=$group_full_Path;
        $result['ParentNodeId']=str_replace($result['NodeName']."/","",$result['NodeId']);
        $result['ParentNodeName']=substr($result['ParentNodeId'],0,strpos($result['ParentNodeId'],"/"));
        if (empty($result['ParentNodeName'])) {
            $result['ParentNodeName']=$result['ParentNodeId'];
        }
        return $result;
    }



    /**
     * 构造函数
     *
     * 用于初始化运行环境,或对基本变量进行赋值
     * @access private
     * @param array $params 数据库连接参数,如主机名,数据库用户名,密码等
     * @return boolean
     */
    private function __construct($pbxFilePath) {
        $data=file_get_contents($pbxFilePath);
        if ($data===false) {
            throw new Yaf_Exception("can't open $pbxFilePath when trying to overwrite settings");   
        }else{
            $this->file_content=$data;
            $this->pbxFilePath=$pbxFilePath;
        }
        return true;
    }


    /**
     * 析构函数
     *
     * @access public
     * @return void
     */
    public function __destruct() {
        $result=file_put_contents($this->pbxFilePath, $this->file_content);
        if ($result===false) {
            throw new Yaf_Exception("can't write data to path:$this->pbxFilePath");
        }
    }

    /**
     * 单例模式
     *
     * @access public
     * @param file location
     * @return object
     */
    public static function getInstance($pbxFilePath = '') {

        if (!self::$instance) {
            self::$instance = new self($pbxFilePath);
        }

        return self::$instance;
    }
}