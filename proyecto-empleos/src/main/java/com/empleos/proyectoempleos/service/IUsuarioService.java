package com.empleos.proyectoempleos.service;

import java.util.List;

import com.empleos.proyectoempleos.model.Usuario;

public interface IUsuarioService {
	void guardar(Usuario usuario);

	void eliminar(Integer idUsuario);
	List<Usuario> buscarTodos();
}
