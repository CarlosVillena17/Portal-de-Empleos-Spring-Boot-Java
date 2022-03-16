package com.empleos.proyectoempleos.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.empleos.proyectoempleos.model.Categoria;



//public interface CategoriasRepository extends CrudRepository<Categoria, Integer>
public interface CategoriasRepository extends JpaRepository<Categoria, Integer> {
	//Estos metodos en tiempo se ejecucion se ejecutan 
}
