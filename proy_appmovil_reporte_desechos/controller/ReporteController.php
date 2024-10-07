<?php

header('Access-Control-Allow-Origin: *');
require_once "../dao/ReporteDAO.php";
require_once "../bean/ReporteBean.php";



$op=$_GET["op"];
$objReporteDao=new ReporteDAO();



switch ($op) {
    
    case 1:{
        $nombre=$_GET["nombre"];
        $apellido=$_GET["apellido"];     
        $direccion=$_GET["direccion"];
        $descripcion=$_GET["descripcion"];
     
        $objReporteBean=new ReporteBean();
        $objReporteBean->setNombre($nombre);
        $objReporteBean->setApellido($apellido);
        $objReporteBean->setDireccion($direccion);
        $objReporteBean->setDescripcion($descripcion);
        $res=$objReporteDao->AgregarReporte($objReporteBean);
       
        if ($res==1) {
            $men="Registro insertado correctamente";
        }
        else {
            $men="Error al registrar";
        }
        $response["state"]=$men;
        echo json_encode($response);
        break;
    }
    
    
    case 2:{
        $list=$objReporteDao->ListAdmin();
        echo json_encode($list);
        break;
    }
    
    
    
    
}



?>