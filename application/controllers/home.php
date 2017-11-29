<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */


	public function __construct()
      {
         parent::__construct();
        // $this->load->model('items_model');

         //$this->load->model('mess_model');
         $this->load->model('student_model');
         $this->load->helper('form');
         $this->load->helper('url');
         //$this->load->library('session');
        // $this->load->library('form_validation');
        // $this->load->helper('date');
        // $this->load->library('ion_auth');

      }


	public function student_reg()
	{
		$this->load->view('welcome_message');

	}

	public function alumni_event()
	{
		$this->load->view('alumni_event');
	}


  public function alumni_event_insert()
    {
      if(isset($_POST['submit']))
            {
                $data['event_name'] = $this->input->post('event_name');
                $data['event_desc'] = $this->input->post('event_desc');
                $data['event_type'] = $this->input->post('event_type');
                $data['exp_start_date'] = $this->input->post('exp_start_date');
                $data['exp_end_date'] = $this->input->post('exp_end_date');
                $year="";
                if(!empty($this->input->post('event_year'))) {
                  foreach($this->input->post('event_year') as $check) {
                        $year.=$check.",";

                  }
                  $year[strlen($year)-1]='';

                }
                $data['event_for'] = $year;
                $data['status'] = $this->student_model->alumni_event_insert_model($data);
                $this->load->view('status',$data);

            }
    }

    public function fund_management()
    {
        $data = $this->student_model->generate_fund_details();
        $this->load->view('fund_management',$data); 

    }

    public function alumni_event_list()
    {
        $data = $this->student_model->generate_alumni_event_list();
        $this->load->view('alumni_event_list',$data); 

    }

    public function fund_insert()
    {
      if(isset($_POST['submit']))
            {
                $data['event_name'] = $this->input->post('event_name');
                $data['event_desc'] = $this->input->post('event_desc');
                $data['event_date'] = $this->input->post('event_date');
                $data['total_cost'] = (double)$this->input->post('total_cost');
                $data['status'] = $this->student_model->fund_insert_model($data);
                $this->load->view('status',$data);

            }
    }

    public function fund_admin()
    {
        $this->load->view('fund_admin'); 

    }


	public function student_insert()
   { 

            if(isset($_POST['submit']))
            {
                $data['firstname'] = $this->input->post('firstname');
                $data['lastname'] = $this->input->post('lastname');
                $data['dob'] = $this->input->post('dob');
                $data['mobile_no'] = $this->input->post('mobile_no');
                $data['hometown'] = $this->input->post('hometown');
                $data['pincode'] = $this->input->post('pincode');
                $data['address'] = $this->input->post('address');
                $data['blood_group'] = $this->input->post('blood_group');
                $data['hobby'] = $this->input->post('hobby');
                $data['gender'] = $this->input->post('gender');
                $data['current_batch'] = $this->input->post('current_batch');
                $data['percentage_10'] = $this->input->post('percentage_10');
                $data['10thMedium_of_Instruction'] = $this->input->post('10thMedium_of_Instruction');
                $data['10thBoard'] = $this->input->post('10thBoard');
                $data['percentage_12'] = $this->input->post('percentage_12');
                $data['12thMedium_of_Instruction'] = $this->input->post('12thMedium_of_Instruction');
                $data['12thBoard'] = $this->input->post('12thBoard');
                $data['Branch'] = $this->input->post('Branch');
                $data['Sem'] = $this->input->post('Sem');
                $data['status'] = $this->student_model->student_insert_model($data);
                $this->load->view('status',$data);

            }
   }


   public function demo_controller()
   {
      $this->load->view('demo_model');
   }
}
