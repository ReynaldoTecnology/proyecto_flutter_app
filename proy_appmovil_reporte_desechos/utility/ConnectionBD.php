<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of ConnectionBD
 *
 * @author soporte
 */
class ConnectionBD {
   
    const server="localhost";
    const user="root";
    const password="123456789";
    const bd="BD_REPORTDESECHO";
    private $cn=null;

    public function getConnectionBD(){
        try {
            $this->cn=mysqli_connect(self::server,self::user,self::password,self::bd);
        } catch (Exception $e) {
            
        }
        return $this->cn;
    }
    
    
}

?>