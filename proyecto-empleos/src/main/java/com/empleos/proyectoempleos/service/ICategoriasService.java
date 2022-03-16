package com.empleos.proyectoempleos.service;

import java.util.List;

import com.empleos.proyectoempleos.model.*;

public interface ICategoriasService {
	void guardar(Categoria categoria); 
	List<Categoria> buscarTodas(); 
	Categoria buscarPorId(Integer idCategoria); 
	void eliminar(Integer idCategoria); 
}
