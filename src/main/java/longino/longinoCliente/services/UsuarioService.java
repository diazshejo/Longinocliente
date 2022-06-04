package longino.longinoCliente.services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import longino.longinoCliente.modeles.usuarioModel;
import longino.longinoCliente.repositories.UsuarioRepository;

@Service
public class UsuarioService {
    @Autowired
    UsuarioRepository usuarioRepository;


    public ArrayList<usuarioModel> obtnerUsuario(){
        return (ArrayList<usuarioModel>)usuarioRepository.findAll();
    }


    public usuarioModel GuardarUsuario(usuarioModel usuario){
        return usuarioRepository.save(usuario);
    }

    public Optional<usuarioModel> obtenerPorId(Long id){
        return usuarioRepository.findById(id);
    }

    public ArrayList<usuarioModel> obtenerPorTelefono(Integer telefono){
        return usuarioRepository.findBytelefono(telefono);
    }


    public boolean eliminarUsuario(Long id){
        try{
            usuarioRepository.deleteById(id);
            return true;
        } catch(Exception err){
            return false;
        }
    }
  
}
