package com.empleos.proyectoempleos.service.db;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.empleos.proyectoempleos.model.Categoria;
import com.empleos.proyectoempleos.repository.CategoriasRepository;
import com.empleos.proyectoempleos.service.ICategoriasService;


@Service
@Primary
public class CategoriaServiceJpa implements ICategoriasService {
	
	@Autowired
	private CategoriasRepository categoriaRepo; 
	
	@Override
	public void guardar(Categoria categoria) {
		categoriaRepo.save(categoria); 

	}

	@Override
	public List<Categoria> buscarTodas() {
		// TODO Auto-generated method stub
		return categoriaRepo.findAll();
	}

	@Override
	public Categoria buscarPorId(Integer idCategoria) {
		Optional<Categoria> optional= categoriaRepo.findById(idCategoria); 
		if(optional.isPresent()) {
			return optional.get();
		}
		return null; 
		
	}

	@Override
	public void eliminar(Integer idCategoria) {
		categoriaRepo.deleteById(idCategoria);
		
	}

}
