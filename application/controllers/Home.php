<?php
class Home extends CI_Controller {

    public function index(){
        //cargar la configuarcion e la base de datos
        $this->load->database();
        //Obtenemos la base de datos, tabla app
       $data = $this->db->get("usuario");
       //convertido la variable a un json
        echo json_encode($data->result());
    }

    public function addU(){
        $post = $this->input->post();
        echo json_encode($post);
    }
    
}
