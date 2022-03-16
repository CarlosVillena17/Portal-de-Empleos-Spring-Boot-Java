package com.empleos.proyectoempleos.service.db;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.empleos.proyectoempleos.model.Usuario;
import com.empleos.proyectoempleos.repository.UsuarioRepository;
import com.empleos.proyectoempleos.service.IUsuarioService;

@Service
public class UsuarioServiceJpa implements IUsuarioService{
	
	@Autowired
	private UsuarioRepository usuarioRepository; 
	
	@Override
	public void guardar(Usuario usuario) {
		usuarioRepository.save(usuario); 
		
	}

	@Override
	public void eliminar(Integer idUsuario) {
		usuarioRepository.deleteById(idUsuario);
		
	}

	@Override
	public List<Usuario> buscarTodos() {
		List<Usuario> lista=usuarioRepository.findAll(); 
		return lista;
	}

}
