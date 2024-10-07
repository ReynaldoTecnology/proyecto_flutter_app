<?php




require_once "../utility/ConnectionBD.php";
require_once "../bean/ReporteBean.php";

class ReporteDAO {
    
    
    public function ListAdmin(){
        try {
            $sql="SELECT * FROM reporte;";
            $objc=new ConnectionBD();
            $cn=$objc->getConnectionBD();
            $rs=mysqli_query($cn,$sql);
            $list=array();
    
            while($row=mysqli_fetch_assoc($rs)){
                array_push($list,array('idReporte'=>$row['idReporte'],
                'nombre'=>$row['nombre'],'apellido'=>$row['apellido'],
                'direccion'=>$row['direccion'],'descripcion'=>$row['descripcion']));
            }
            mysqli_close($cn);
        } catch (Exception $e) {
    
        }
        return $list;
    }

    
  
    public function AgregarReporte(ReporteBean $objUsers){
        try {
            
            /*
            $sql="INSERT INTO reporte (nombre,apellido,direccion,descripcion) 
                  VALUES('$objUsers->nombre','$objUsers->apellido','$objUsers->direccion','$objUsers->descripcion');";
            */
            
             $sql="INSERT INTO reporte (nombre,apellido,direccion,descripcion) 
                  VALUES('".$objUsers->nombre."','".$objUsers->apellido."', '".$objUsers->direccion."', '".$objUsers->descripcion."')";
            
            
            
            $objc=new ConnectionBD();
            $cn=$objc->getConnectionBD();
            $rs=mysqli_query($cn,$sql);
            mysqli_close($cn);
        } catch (Exception $e) {
    
        }
        return $rs;
    }
    
    
    
    
}
