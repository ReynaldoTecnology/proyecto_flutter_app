class Usuario {
  String usuario;
  String contrasenia;

  Usuario({required this.usuario, required this.contrasenia});

  bool   validarUsuario( usuario, contrasenia)
  {
    bool estado=false;
    if(usuario=='Reynaldo' &&  contrasenia=='upn')
    {
      estado=true;
    }
    return estado;
    }


}