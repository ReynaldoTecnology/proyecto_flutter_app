<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of ReporteBean
 *
 * @author soporte
 */
class ReporteBean {
 
    public $id_reporte;
    public $nombre;
    public $apellido;
    public $direccion;
    public $descripcion;
    
    public function getId_reporte() {
        return $this->id_reporte;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function getApellido() {
        return $this->apellido;
    }

    public function getDireccion() {
        return $this->direccion;
    }

    public function getDescripcion() {
        return $this->descripcion;
    }

    public function setId_reporte($id_reporte) {
        $this->id_reporte = $id_reporte;
        return $this;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
        return $this;
    }

    public function setApellido($apellido) {
        $this->apellido = $apellido;
        return $this;
    }

    public function setDireccion($direccion) {
        $this->direccion = $direccion;
        return $this;
    }

    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
        return $this;
    }


    
}
