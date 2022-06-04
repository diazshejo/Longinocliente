package longino.longinoCliente.repositories;

import longino.longinoCliente.modeles.usuarioModel;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface UsuarioRepository extends CrudRepository<usuarioModel,Long> {
    public abstract ArrayList<usuarioModel> findBytelefono(Integer telefono);
    public abstract ArrayList<usuarioModel> findByNombres(String nombres);
}
