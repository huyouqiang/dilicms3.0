<?php
    /**
     * 基于CI封装Base基础类
     * @package CodeIgniter
     * @author  Hu You Qiang
     * @since   Version 1.0.0
     * @filesource
     */
        
    class Base extends CI_Model {

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 构造函数
         */
        public function __construct()
        {
            parent::__construct();
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 根据出生日期计算年龄
         * @param   string  $birthday  出生日期
         * @return  int
         */
        public function birthday($birthday){ 
            $age = strtotime($birthday); 
            if($age === false){ 
                return false; 
            } 
            list($y1,$m1,$d1) = explode("-",date("Y-m-d",$age)); 
            $now = strtotime("now"); 
            list($y2,$m2,$d2) = explode("-",date("Y-m-d",$now)); 
            $age = $y2 - $y1; 
            if((int)($m2.$d2) < (int)($m1.$d1)) 
            $age -= 1; 
            return $age; 
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 判断当前时间在某一个时间段内
         * @param   string  $timeBegin 时间段-开始
         * @param   string  $timeEnd   时间段-结束
         * @return  bool
         */
        public function get_curr_time_section($timeBegin,$timeEnd)
        {
            $checkDayStr = date('Y-m-d ',time());
            $timeBegin1  = strtotime($checkDayStr.$timeBegin);
            $timeEnd1    = strtotime($checkDayStr.$timeEnd);
            $curr_time   = time();
            if($curr_time >= $timeBegin1 && $curr_time <= $timeEnd1)
            {
                return true;
            }
            return false;
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 上传单张图片
         * @param   string  $imgField 上传图片字段
         * @return  array
         */ 
        public function uploadImg($imgField)
        {
            $config=array(
                    "upload_path"=>getcwd().'/upload/img/',
                    "allowed_types"=>"gif|jpg|jpeg|png",
                    "max_size"=>3*1024,
                    "overwrite"=>true
                    // "file_name"=>md5(time()),
                    );
            $this->load->library('upload',$config);
            $uploadRes=$this->upload->do_upload($imgField);
            if ($uploadRes){
                $res = array('upload_data' => $this->upload->data());
            }
            else{
                $res = array('error' => $this->upload->display_errors());
            }
            return $res;
        }
        
        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 上传单首音频
         * @param   string  $imgField 上传音频字段
         * @return  array
         */ 
        public function uploadAudio($audioField)
        {
            $config=array(
                    "upload_path"=>getcwd().'/upload/mp3/',
                    "allowed_types"=>"mp3",
                    "max_size"=>5*1024,
                    "file_name"=>md5(time()),
                    );
            $this->load->library('upload',$config);
            $uploadRes=$this->upload->do_upload($audioField);
            if ($uploadRes){
                $res = array('upload_data' => $this->upload->data());
            }
            else{
                $res = array('error' => $this->upload->display_errors());
            }
            return $res;
        }
        
        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 上传表格
         * @param   string  $imgField 上传表格字段
         * @return  array
         */ 
        public function uploadExcel($excelField)
        {
            $config=array(
                    "upload_path"=>getcwd().'/upload/excel/',
                    "allowed_types"=>"xlsx",
                    "max_size"=>5*1024,
                    "file_name"=>md5(time()),
                    );
            $this->load->library('upload',$config);
            $uploadRes=$this->upload->do_upload($excelField);
            if ($uploadRes){
                $res = array('upload_data' => $this->upload->data());
            }
            else{
                $res = array('error' => $this->upload->display_errors());
            }
            return $res;
        }
        
        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 读取excel数据
         * @param   string  $excelPath  上传excel路径
         * @param   string  $exts       excel后缀
         * @return  array
         */
        public function readExcel($excelPath, $excelType='xlsx'){
            //导入PHPExcel类库，PHPExcel没有用命名空间
            //注意路径                           
            $this->load->library('PHPExcel');           
            //创建PHPExcel对象           
            $PHPExcel=new PHPExcel();
            //如果excel文件后缀名为.xls，导入这个类            
            if($excelType == 'xls'){                
                $this->load->library('PHPExcel/Reader/PHPExcel_Reader_Excel5');                
                $PHPReader=new PHPExcel_Reader_Excel5();            
            }
            //如果excel文件后缀名为.xlsx，导入这个类
            else if($excelType == 'xlsx'){                
                $this->load->library('PHPExcel/Reader/PHPExcel_Reader_Excel2007');                
                $PHPReader=new PHPExcel_Reader_Excel2007();                            
            }                   
            //载入文件            
            $PHPExcel=$PHPReader->load($excelPath);
            //获取表中的第一个工作表，如果要获取第二个，把0改为1，依次类推                        
            $currentSheet=$PHPExcel->getSheet(0);
            //获取总列数            
            $allColumn=$currentSheet->getHighestColumn();
            //获取总行数                        
            $allRow=$currentSheet->getHighestRow();            
            //循环获取表中的数据，$currentRow表示当前行，从哪行开始读取数据，索引值从0开始            
            for($currentRow=2;$currentRow<=$allRow;$currentRow++){
                //从哪列开始，A表示第一列                                
                for($currentColumn='A';$currentColumn<=$allColumn;$currentColumn++){                    
                    //数据坐标                    
                    $address=$currentColumn.$currentRow;
                    //读取到的数据，保存到数组$arr中                                        
                    $data[$currentRow-2][$currentColumn]=$currentSheet->getCell($address)->getValue();                
                }            
            }            
            return $data;
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 数据格式化输出
         * @param   int      $code     返回标识
         * @param   string   $message  返回注解
         * @param   array    $data     返回数组
         * @return  json
         */ 
        public function dataFormat($code,$message,$data)
        {
            $returnArr=array("code"=>$code,"message"=>$message,"data"=>$data);
            $returnJson=json_encode($returnArr,JSON_UNESCAPED_UNICODE);
            print_r(str_replace("null",'""',$returnJson));
            die();
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 手机号判断是否合法
         * @access protected
         * @param  string $number 手机号
         * @return bool
         */
        public function validPhoneNumber($number){
            if(preg_match("/^1[345678][1]\d{9}$/",$number)){
                return true;
            }else{
                return false;
            }
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 生成日期数组
         * @access public
         * @param  date $startTime 开始时间
         * @param  date $endTime   结束时间
         * @return array
         */
        public function dateArr($startTime,$endTime){
            $stime=$startTime;//开始时间
            $etime=$endTime;//结束时间
            $datearr=array();
            $sday=date('d',$startTime);
            $eday=date('d',$endTime);
            while($sday <= $eday){
                $datearr[] = date('Y-m-d',$etime);//得到datearr的日期数组。
                $etime=$etime - 3600*24;
                $eday=$eday-1;
            }

            return array_reverse($datearr);
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 服务器文件地址
         * @access public
         * @param  date $startTime 开始时间
         * @param  date $endTime   结束时间
         * @return array
         */
        public function filePath(){
            
            if($_SERVER['SERVER_NAME']=="j9zuvmtj.qcloud.la"){
                return "";
            }
            else if($_SERVER['SERVER_NAME']=="eick12nm.xyz"){
                return "/ocean/";
            } 
            
        }

        //-----------------------------------------------------------------------------------------------------------------------//

    }

?>