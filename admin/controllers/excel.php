<?php if (!defined('IN_DILICMS')) exit('No direct script access allowed');
/**
 * DiliCMS
 *
 * 一款基于并面向CodeIgniter开发者的开源轻型后端内容管理系统.
 *
 * @package     DiliCMS
 * @author      DiliCMS Team
 * @copyright   Copyright (c) 2011 - 2012, DiliCMS Team.
 * @license     http://www.dilicms.com/license
 * @link        http://www.dilicms.com
 * @since       Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * DiliCMS 内容模型内容管理控制器
 *
 * @package     DiliCMS
 * @subpackage  Controllers
 * @category    Controllers
 * @author      Jeongee
 * @link        http://www.dilicms.com
 */
class excel extends Admin_Controller
{
    /**
     * 构造函数
     *
     * @access  public
     * @return  void
     */
    public function __construct()
    {
        parent::__construct();
    }

    // ------------------------------------------------------------------------

    /**
     * excel导入导出
     *
     * @access  public
     * @return  void
     */
    public function exportExcel()
    {
        $where = $this->input->get('model', TRUE);
        $where = urldecode($where);
        $where = substr($where, 0, -1);
        $where = json_decode($where,true);
        $rs = $where;
        unset($rs['model']);
        $model = 'u_m_'.$where['model'];

        $condition = array();
        foreach ($rs as $key => $v){
            $condition[$model.'.'.$key] = $v;
        }

        $fields = $this->db->select('*')->get($model)->list_fields();

        if (in_array("uid", $fields)) {
            $fields[] = 'createTime';
            $fields[] = 'phone';
            $fields[] = 'nickname';
            $fields[] = 'userprivatedata';
            $query = $this->db->select("$model.*,from_unixtime(ge_$model.create_time) as createTime,u_m_members2.phone,u_m_members2.nickname,u_m_members2.userprivatedata")
                              ->join('u_m_members2', "u_m_members2.id = $model.uid")
                              ->where($condition)
                              ->get($model)
                              ->result();

        }else{
            $query = $this->db->select("$model.*,from_unixtime(ge_$model.create_time) as createTime")
                ->where($condition)
                ->get($model)
                ->result();
        }

        $this->create_xx($query,$fields,$model);

    }


    function create_xls($array)
    {
        // Starting the PHPExcel library
        $this->load->library('PHPExcel');
        $this->load->library('PHPExcel/IOFactory');
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setTitle("export")->setDescription("none");
        $objPHPExcel->getActiveSheet()->fromArray($array);
        $objPHPExcel->getActiveSheet()->setTitle('Sheet1');
        $objPHPExcel->setActiveSheetIndex(0);
        $objWriter = IOFactory::createWriter($objPHPExcel, 'Excel5');
        // Sending headers to force the user to download the file
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="Products_' . date('dMy') . '.xls"');
        header('Cache-Control: max-age=0');

        $objWriter->save('php://output');
    }


    public  function create_xx($query,$fields,$model){


        if(empty($query))
                     return false;

        // Starting the PHPExcel library
        $this->load->library('PHPExcel');
        $this->load->library('PHPExcel/IOFactory');
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setTitle("export")->setDescription("none");

        $objPHPExcel->setActiveSheetIndex(0);

      // Field names in the first row

        $col = 0;
        foreach ($fields as $field)
               {
                     $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, $field);
            $col++;
        }
     // Fetching the table data
      $row = 2;
         foreach($query  as $data)
                  {
                $col = 0;
             foreach ($fields as $field)
                  {
                          $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $data->$field);
             $col++;
            }

             $row++;
         }

         $objPHPExcel->setActiveSheetIndex(0);
         $objWriter = IOFactory::createWriter($objPHPExcel, 'Excel5');

         // Sending headers to force the user to download the file
         header('Content-Type: application/vnd.ms-excel');
         header('Content-Disposition: attachment;filename="Products_'.$model.'.xls"');
         header('Cache-Control: max-age=0');

         $objWriter->save('php://output');
     }



}

/* End of file excel.php */
/* Location: ./admin/controllers/excel.php */
