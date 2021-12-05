<?php


class Usuario extends CI_Controller{


public function todo(){
    //Hay acceso?
    if($this->acceso()){
        //OK obtenemos los usuarios que hay en la bd
        $data = $this->db->get("usuario");
        echo json_encode($data->result());
    }
}

 
public function get($id = null){
    //Hay acceso?
    if($this->acceso()){
        if($id==null){
            $this->output->set_status_header(404, "No se encontro el recurso solicitado");
            echo  json_encode(array("code"=>404, "message"=> "Hace Falta definir un id"));
        } 
        else{
            //Cargamos la base de datos
            $this->load->database();
            //consulta
            $this->db->where("id",$id);
            //recibimos la consulta y la guardamos en query
            $query=$this->db->get("usuario");
            //numero de filas mayor que 0?
            if($query->num_rows()>0){
                //imprimimos en json encode lo obtenido
                echo json_encode($query->row()); 
                
            }
            else{
                //en caso de que sea = a 0 se imprimo que no se ha encontrado ningun usuario
                $this->output->set_status_header(401, "No se encontro el recurso solicitado");
                echo  json_encode(array("code"=>401, "message"=>"No se ha encontrado ningun usuario o se ha eliminado"));
                
            } 
           
        }
    }
}   


public function add(){
    if($this->acceso()){
       $datoForm= $this->input->post();
       $this->load->database();
       $this->db->insert("usuario", $datoForm);
       $las_insert_id=$this->db->insert_id();
       $datoForm["id"]=$las_insert_id;
       echo json_encode($datoForm);
    }
}

public function update($id=null){
    if($this->acceso()){
        if($id==null){
            $this->output->set_status_header(404, "No se encontro el recurso solicitado");
            echo  json_encode(array("code"=>404, "message"=>"Hace Falta definir un id"));
        }else{
            $datoForm = $this->input->post();
            $this->load->database();
            $this->db->where("id",$id);
            $this->db->update("usuario", $datoForm);
            $this->get($id);
        }
        }
}
public function delete($id=null){
    if($this->acceso()){
        if($id==null){
            $this->output->set_status_header(404, "No se encontro el recurso solicitado");
            echo  json_encode(array("code"=>404, "message"=> "Hace Falta definir un id"));
        }else{
            
            $this->load->database();
            $this->db->where("id",$id);
            $this->db->delete("usuario");
            
            if($this->get($id)){
                echo  json_encode(array("code"=>203, "message"=> "Al parecer no se pudo eliminar este usuario"));
            }
        }
        }
    }


// Acesso Para la app recibimos un header lo guardamos, comparamos si existe en la bd y devuelve el numero de filas

public function acceso(){

    $headers = $this->input->request_headers();
    if(array_key_exists("LLAVE", $headers)){
        $token = $headers["LLAVE"];
        //cargamos bases de datos
        $this->load->database();
        //where token = $toke
        $this->db->where("token", $token);
        //select * from app where token = $token
        $query = $this->db->get("app");
        //numero de filas que hay en la columna
       if($query->num_rows()>0){
           return true;
       } 
       else{
           echo json_encode(array("code"=>505, "message"=> "SIN ACCESO A LA BASE DE DATOS"));
       }
    }    
}

}