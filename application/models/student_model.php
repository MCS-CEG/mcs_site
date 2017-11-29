
<?php
class Student_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
		$this->db->db_debug = FALSE;
		//$this->load->model('orders_model');
	}

	public function student_insert_model($data)
	{

		$fname=$data['firstname'];
		$lname=$data['lastname'];
		$dob=$data['dob'];
		$mob_no=$data['mobile_no'];
		$hometown=$data['hometown'];
		$Pincode=$data['pincode'];
		$Address=$data['address'];
		$Blood_Group=$data['blood_group'];
		$Hobby=$data['hobby'];
		$gender=$data['gender'];
		$current_batch=$data['current_batch'];
		$percentage_10=(float)$data['percentage_10'];
		$med_10=$data['10thMedium_of_Instruction'];
		$board_10=$data['10thBoard'];
		$percentage_12=(float)$data['percentage_12'];
		$med_12=$data['12thMedium_of_Instruction'];
		$board_12=$data['12thBoard'];
		$Branch=$data['Branch'];
		$Sem=(int)$data['Sem'];

		$query = "CALL usp_insert_student('2013242019','".$fname."','".$lname."','".$dob."','pressi@gmail.com','".$mob_no."','".$hometown."','".$Pincode."','".$Address."','".$Blood_Group."','".$Hobby."','".$gender."','".$current_batch."','".$Branch."',".$Sem.",".$percentage_10.",'".$med_10."','".$board_10."',".$percentage_12.",'".$med_12."','".$board_12."')";
		
		$mysqli = new mysqli("localhost","root","HostelStore12345","mcs");
		$mysqli->begin_transaction();

		if ($mysqli->multi_query($query)) {
    	
    		do {
   	
   	        	if ($result = $mysqli->store_result()) {
           
            		$result->free();
        		}

        		if($mysqli->more_results())
        		{

        		}

        		
    		} while ($mysqli->more_results() && $mysqli->next_result());
    		$mysqli->commit();
    		$mysqli->close();
    		return 1;
		}
		else
		{
			$mysqli->rollback();
			$mysqli->close();

			return 0;
		}

	}



	public function generate_fund_details()
	{

		$query = "SELECT event_name,event_desc,event_date,total_cost from fund_mgmt order by event_date desc";
		$this->db->trans_start();
		$fundDetails = $this->db->query($query);
		$this->db->trans_complete();

		$output['event_name'] = array();
		$output['event_desc'] = array();
		$output['event_date'] = array();
		$output['total_cost'] = array();

		foreach($fundDetails->result() as $row)
		{
			array_push($output['event_name'],$row->event_name);
            array_push($output['event_date'],date('d-m-Y',strtotime($row->event_date)));
			array_push($output['event_desc'],$row->event_desc);
			array_push($output['total_cost'],$row->total_cost);
		}
		return $output;
	}


	public function generate_alumni_event_list()
	{

		$query = "SELECT * from alumni_event order by exp_end_date desc";
		$this->db->trans_start();
		$fundDetails = $this->db->query($query);
		$this->db->trans_complete();
		$output['event_id'] = array();
		$output['event_name'] = array();
		$output['event_desc'] = array();
		$output['exp_start_date'] = array();
		$output['exp_end_date'] = array();
		$output['event_type'] = array();
		$output['event_for'] = array();

		foreach($fundDetails->result() as $row)
		{
			array_push($output['event_id'],$row->event_id);
			array_push($output['event_name'],$row->event_name);
            array_push($output['exp_start_date'],date('d-m-y',strtotime($row->exp_start_date)));
            array_push($output['exp_end_date'],date('d-m-y',strtotime($row->exp_end_date)));
			array_push($output['event_desc'],$row->event_desc);
			array_push($output['event_type'],$row->event_type);
			array_push($output['event_for'],$row->event_for);
		}
		return $output;
	}

	public function alumni_event_insert_model($data)
	{
		$query = "INSERT into alumni_event(event_name,event_desc,exp_start_date,exp_end_date,event_type,event_for)values( '".$data['event_name']."','".$data['event_desc']."','".$data['exp_start_date']."','".$data['exp_end_date']."','".$data['event_type']."','".$data['event_for']."')";

		$this->db->trans_start();
		if(!($this->db->query($query)))
		{
			$error=$this->db->error();
			$this->db->trans_complete();
			return $error['message'];
		}
		$this->db->trans_complete();
		return 1;


	}

	public function fund_insert_model($data)
	{
		$query = "INSERT into fund_mgmt(event_name,event_desc,event_date,total_cost)values( '".$data['event_name']."','".$data['event_desc']."','".$data['event_date']."',".$data['total_cost'].")";

		$this->db->trans_start();
		if(!($this->db->query($query)))
		{
			$error=$this->db->error();
			$this->db->trans_complete();
			return $error['message'];
		}
		$this->db->trans_complete();
		return 1;


	}




}