CREATE DATABASE BD_REPORTDESECHO;
USE BD_REPORTDESECHO;


CREATE TABLE reporte (
    idReporte INT(10) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    PRIMARY KEY (idReporte)
) AUTO_INCREMENT=5;

/*AGREGMAOS LOS DATOS */
INSERT INTO `reporte` (`idReporte`, `nombre`, `apellido`, `direccion`, `descripcion`) VALUES
(1, 'Juan', 'Rodriguez', 'Av los heroes 530 - SJM', 'Desmonte amontonado y quemda de basura en esquina de avenida'),
(2, 'Juan', 'Rodriguez', 'Av los heroes 530 - SJM', 'Desmonte amontonado y quemda de basura en esquina de avenida'),
(3, 'Juan', 'Rodriguez', 'Av los heroes 530 - SJM', 'Desmonte amontonado y quemda de basura en esquina de avenida'),
(4, 'Juan', 'Rodriguez', 'Av los heroes 530 - SJM', 'Desmonte amontonado y quemda de basura en esquina de avenida')
;


SELECT * FROM REPORTE;

