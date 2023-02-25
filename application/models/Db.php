<?php
    /**
     * 基于CI封装数据库基础类
     * @package CodeIgniter
     * @author  Hu You Qiang
     * @since   Version 1.0.0
     * @filesource
     */
        
    class Db extends CI_Model {

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
         * 用户是否存在
         * @param   int  $userId  用户id
         * @return  int
         */
        public function issetUser($userId){ 
            $this->load->database();

            $issetUser=$this->db
                            ->from('ge_u_m_user_info')
                            ->where("id='{$userId}'")
                            ->count_all_results();
            if($issetUser>0){
                return true;
            }
            else{
                return false;
            }
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 用户信息
         * @param   int  $userId  用户id
         * @return  int
         */
        public function userInfo($userId){ 
            $this->load->database();

            $userInfo=$this->db
                           ->from('ge_u_m_user_info')
                           ->where("id='{$userId}'")
                           ->get()
                           ->row_array();

            return $userInfo;
            
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 积分商品是否存在
         * @param   int  $commodityId  积分商品id
         * @return  int
         */
        public function issetCommodity($commodityId){ 
            $this->load->database();

            $issetCommodity=$this->db
                            ->from('ge_u_m_Integral_commodity')
                            ->where("id='{$commodityId}'")
                            ->count_all_results();
            if($issetCommodity>0){
                return true;
            }
            else{
                return false;
            }
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 用户剩余积分
         * @param   int  $userId  用户id
         * @return  int
         */
        public function residualIntegral($userId){ 
            $this->load->database();

            $integralSum=$this->db
                              ->select("sum(Integral_value) as integralSum")
                              ->from('ge_u_m_Integral_reward')
                              ->where("user_id='{$userId}'")
                              ->get()
                              ->row_array();
            $return['integralSum']=$integralSum['integralSum'];

            $integralUsed=$this->db
                               ->select("sum(use_integral) as integralUsed")
                               ->from('ge_u_m_exchange')
                               ->where("user_id='{$userId}'")
                               ->get()
                               ->row_array();
            $return['integralUsed']=$integralUsed['integralUsed'];

            $return['integralSurplus']=(int) $integralSum['integralSum']-(int) $integralUsed['integralUsed'];

            return $return['integralSurplus'];
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 积分商品信息
         * @param   int  $commodityId  积分商品id
         * @return  array
         */
        public function commodityInfo($commodityId){ 
            $this->load->database();

            $commodityInfo=$this->db
                                ->select()
                                ->from('ge_u_m_Integral_commodity')
                                ->where("id='{$commodityId}'")
                                ->get()
                                ->row_array();

            return $commodityInfo;
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 音频信息
         * @param   int  $audioId  音频id
         * @return  array
         */
        public function audioInfo($audioId){ 
            $this->load->database();

            $audioInfo=$this->db
                            ->select()
                            ->from('ge_u_m_audio_story')
                            ->where("id='{$audioId}'")
                            ->get()
                            ->row_array();

            return $audioInfo;
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 增加用户积分
         * @param   int  $userId         用户id
         * @param   int  $integralType   积分类型
         * @param   int  $integralValue  积分数值
         * @return  bool
         */
        public function addUserIntegral($userId,$integralType,$integralValue,$invitingUsersId=""){ 
            $this->load->database();

            $data = array(
                    'create_time'           => time(), 
                    'user_id'               => $userId, 
                    'Integral_type'         => $integralType,
                    'Integral_value'        => $integralValue,
                    'Inviting_users_id'    =>  $invitingUsersId,
                    );
            $insertRes=$this->db->insert('ge_u_m_Integral_reward', $data);
            if($insertRes){
                return true;
            }
            else{
                return false;
            }
 
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 连续签到天数-递归
         * @param   array  $signArr   签到数组
         * @param   array  $dateArr   日期字典
         * @return  array
         */
        public function continuitySignDays($signArr,$dateArr){ 
            $this->load->database();
            $return=array();

            if(!empty($signArr) && !empty($dateArr)){

                foreach ($signArr as $key => $value) {
                    if( date('Y-m-d',$value['create_time'])==$dateArr[$key] ){
                        $return[$key]=date('Y-m-d',$value['create_time']);
                        if(sizeof($return)>7){
                            $return=$this->continuitySignDays( array_slice($signArr,$key),array_slice($dateArr,array_search(date('Y-m-d',$value['create_time']),$dateArr)) );
                            return $return;
                        }
                    }
                    else{
                        $return=$this->continuitySignDays( array_slice($signArr,$key),array_slice($dateArr,array_search(date('Y-m-d',$value['create_time']),$dateArr)) );
                        return $return;
                    }
                }
            }
            else{
                return false;
            }

            if(sizeof($return)==7){
                return array();
            }

            return $return;
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 今日是否签到
         * @param   array  $userId   用户id
         * @return  bool
         */
        public function isSignToday($userId){ 
            $this->load->database();

            $isSignToday=$this->db
                              ->select()
                              ->from('ge_u_m_user_sign')
                              ->where("user_id='{$userId}' and FROM_UNIXTIME(create_time,'%Y-%m-%d')=DATE_FORMAT(NOW(),'%Y-%m-%d')")
                              ->count_all_results();
            if($isSignToday>0){
                return true;
            }
            else{
                return false;
            }
                                     
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 积分商品剩余数量
         * @return  int
         */
        public function commodityResidualQuantity(){ 
            $this->load->database();

            $commodityResidualQuantity=$this->db
                                            ->select(" ( c.commodity_total-(select count(e.id) from ge_u_m_exchange e where e.commodity_id=c.id) ) as commodityResidualQuantity")
                                            ->from('ge_u_m_Integral_commodity c')
                                            ->order_by("c.create_time desc")
                                            ->get()
                                            ->row_array();
            
            return (int) $commodityResidualQuantity['commodityResidualQuantity'];
                                     
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 添加页面访问记录
         * @return  int
         */
        public function addPageAccessRecord($userId,$pageName){ 
            $this->load->database();

            $data = array(
                    'create_time'           => time(), 
                    'userId'                => $userId, 
                    'pageName'              => $pageName,
                    );
            $insertRes=$this->db->insert('ge_u_m_page_access_record', $data);
            if($insertRes){
                return true;
            }
            else{
                return false;
            }
                                     
        }

        //-----------------------------------------------------------------------------------------------------------------------//

        /**
         * 今日是否添加过积分
         * @param   int     $userId         用户id
         * @param   string  $integralType   积分类型
         * @return  bool
         */
        public function isAddedIntegralToday($userId,$integralType){ 
            $this->load->database();

            $isAddedIntegralToday=$this->db
                                       ->select()
                                       ->from('ge_u_m_Integral_reward')
                                       ->where("user_id='{$userId}' and user_id<>'' and Integral_type='{$integralType}' and FROM_UNIXTIME(create_time,'%Y-%m-%d')=DATE_FORMAT(NOW(),'%Y-%m-%d')")
                                       ->count_all_results();
            if($isAddedIntegralToday>0){
                return true;
            }
            else{
                return false;
            }
                                     
        }

        //-----------------------------------------------------------------------------------------------------------------------//


    }

?>