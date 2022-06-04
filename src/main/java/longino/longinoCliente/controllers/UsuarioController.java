package longino.longinoCliente.controllers;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import longino.longinoCliente.modeles.usuarioModel;
import longino.longinoCliente.services.UsuarioService;

@RestController
@RequestMapping("/usuario")
public class UsuarioController {
    @Autowired
    UsuarioService usuarioService;

    @GetMapping()
    public ArrayList<usuarioModel> obtenerUsuarios() {
        return usuarioService.obtnerUsuario();
    }

    @PostMapping
    public usuarioModel Guardarusuario(@RequestBody usuarioModel usuario) {
        return this.usuarioService.GuardarUsuario(usuario);
    }

    @GetMapping( path = "/{id}")
    public Optional<usuarioModel> obtenerUsuarioPorId(@PathVariable("id") Long id){
        return this.usuarioService.obtenerPorId(id);
    }

    @GetMapping("/query")
    public ArrayList<usuarioModel> obtenerPorTelefono(@RequestParam("telefono")Integer telefono){
        return this.usuarioService.obtenerPorTelefono(telefono);
    }

    @DeleteMapping(path = "/{id}")
    public String eliminarPorId(@PathVariable("id")long id){
        boolean ok = this.usuarioService.eliminarUsuario((id));

        if (ok){
            return "Se elimino el usuarip " + id;
        }
        else {
            return "No se pudo eliminar el usuario " + id;
        }
         

    }

}
