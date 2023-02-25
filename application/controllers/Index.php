<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	class Index extends CI_Controller {

		//-----------------------------------------------------------------------------------------------------------------------//

		/**
		 * 添加场景使用记录
		 * @param	string	$_POST['user_id']     用户id
		 * @param	string	$_POST['user_name']   用户名称
		 * @param	string	$_POST['scene_type']  场景类型
		 * @param	string	$_POST['scene_name']  场景名称
		 * @param	string	$_POST['time_length'] 使用时间
		 * @return	json
		 */
		public function addSceneRecord()
		{
		    $post=$this->input->post();
		    $this->load->model('Base');
		    $this->load->database();
		    
		    if(!empty($post['time_length'])){
		    	$data = array(
			    	'create_time' => time(), 
			    	'user_id' => $post['user_id'], 
			    	'user_name' => $post['user_name'],
			    	'scene_type' => $post['scene_type'],
			    	'scene_name' => $post['scene_name'],
			    	'time_length' => $post['time_length'],
			    	);
				$insertRes=$this->db->insert('ge_u_m_scene_record', $data);
		    }
		    
			if($insertRes){
				$this->Base->dataFormat(1,"添加场景使用记录-成功",array());
			}
			else{
				$this->Base->dataFormat(0,"添加场景使用记录-失败",array());
			}
		    die();  
		}

		//-----------------------------------------------------------------------------------------------------------------------//

		/**
		 * 用户当前时间常用场景-待修改
		 * @param	string	$_POST['user_id'] 用户id
		 * @return	json
		 */
		public function userScene()
		{
		    $post=$this->input->post();
		    $this->load->model('Base');
		    $this->load->database();
		    $data=array();

		    $issetUser=$this->db
		    	      		->from('ge_u_m_user_info')
		    	      		->where("id='{$post['user_id']}' and id <>''")
		    	      		->count_all_results();

		    $issetScene=$this->db
		    	      		 ->from('ge_u_m_scene_record')
		    	      		 ->where("user_id='{$post['user_id']}' and user_id <>''")
		    	      		 ->count_all_results();

		   	if(empty($issetUser) || empty($issetScene)){
		   		$this->Base->dataFormat(0,"用户没有常用场景",array());
		   		die();
		   	}

		    $isMorning=$this->Base->get_curr_time_section("06:00:00","09:00:00");
		    $isDaily=$this->Base->get_curr_time_section("09:00:00","19:00:00");
		    $isSleep=$this->Base->get_curr_time_section("19:00:00","24:00:00");
		    $isDawn=$this->Base->get_curr_time_section("00:00:00","06:00:00");

		    if($isMorning){
		    	$timeSection=array("timeBegin"=>"06:00:00","timeEnd"=>"09:00:00");
		    }
		    else if($isDaily){
		    	$timeSection=array("timeBegin"=>"09:00:00","timeEnd"=>"19:00:00");
		    }
		    else if($isSleep || $isDawn){
		    	$timeSection=array("timeBegin"=>"19:00:00","timeEnd"=>"06:00:00");
		    }

		    $sql=" and (FROM_UNIXTIME(create_time,'%H:%i:%s')>'{$timeSection['timeBegin']}' and FROM_UNIXTIME(create_time,'%H:%i:%s')<'{$timeSection['timeEnd']}') ";

		    if($timeSection['timeBegin']=="19:00:00" && $timeSection['timeEnd']=="06:00:00"){
		    	$sql=" and ( (FROM_UNIXTIME(create_time,'%H:%i:%s')>'19:00:00' and FROM_UNIXTIME(create_time,'%H:%i:%s')<'24:00:00') or (FROM_UNIXTIME(create_time,'%H:%i:%s')>'00:00:00' and FROM_UNIXTIME(create_time,'%H:%i:%s')<'06:00:00') ) ";
		    }
		    
		    $data=$this->db
    	               ->select("count(id) as sceneTotal,scene_type,time_length as lastSettime")
    	               ->from('ge_u_m_scene_record')
    	               ->where("user_id='{$post['user_id']}' {$sql}")
    	               ->group_by(array("scene_type", "time_length"))
    	               ->order_by("sceneTotal desc")
    	               ->get()
    	               ->row_array();

    	    $userInfo=$this->db
    	               	   ->select()
    	                   ->from('ge_u_m_user_info')
    	                   ->where("id='{$post['user_id']}'")
    	                   ->get()
    	                   ->row_array();
    	    $guideAnimation=json_decode($userInfo['guide_animation'],true);
			
			if(!empty($data['scene_type']) && $data['sceneTotal']>10){
				$lastSettime=$this->db
			    	              ->select("time_length")
			    	              ->from('ge_u_m_scene_record')
			    	              ->where("user_id='{$post['user_id']}' and ( (FROM_UNIXTIME(create_time,'%H:%i:%s')>'19:00:00' and FROM_UNIXTIME(create_time,'%H:%i:%s')<'24:00:00') or (FROM_UNIXTIME(create_time,'%H:%i:%s')>'00:00:00' and FROM_UNIXTIME(create_time,'%H:%i:%s')<'06:00:00') ) ")
			    	              ->order_by("id desc")
			    	              ->get()
			    	              ->row_array();
			   	$data['lastSettime']=(string) $lastSettime['time_length'];
			   	$data['guide_animation']=(int) $guideAnimation[0]['isShow'];
			   	$data['sleepScene']=(int) $guideAnimation[1]['isShow'];
			   	$data['earlyScene']=(int) $guideAnimation[2]['isShow'];
			   	$data['dayScene']=(int) $guideAnimation[3]['isShow'];

				$this->Base->dataFormat(1,"用户当前时间常用场景",$data);
			}
			else{
				$lastSettime=$this->db
			    	              ->select("time_length")
			    	              ->from('ge_u_m_scene_record')
			    	              ->where("user_id='{$post['user_id']}'")
			    	              ->order_by("id desc")
			    	              ->get()
			    	              ->row_array();
				$res['lastSettime']=(string) $lastSettime['time_length'];
				$res['lastSettime']=(string) $lastSettime['time_length'];
			   	$res['guide_animation']=(int) $guideAnimation[0]['isShow'];
			   	$res['sleepScene']=(int) $guideAnimation[1]['isShow'];
			   	$res['earlyScene']=(int) $guideAnimation[2]['isShow'];
			   	$res['dayScene']=(int) $guideAnimation[3]['isShow'];
				$this->Base->dataFormat(1,"用户当前时间常用场景",$res);
			}
		    die();  
		}

		//-----------------------------------------------------------------------------------------------------------------------//

	}

?>
