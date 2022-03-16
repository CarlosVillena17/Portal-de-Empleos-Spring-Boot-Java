package com.empleos.proyectoempleos.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.empleos.proyectoempleos.model.Vacante;




public interface VacantesRepository extends JpaRepository<Vacante, Integer> {
	List<Vacante> findByEstatus(String estatus);
	//Metodos por dos campos 
	List<Vacante> findByDestacadoAndEstatusOrderByIdAsc(int destacado, String estatus);
	List<Vacante> findBySalarioBetween(double s1, double s2); 
	List<Vacante> findByEstatusIn(String  [] estatus);
	List<Vacante> findByDestacado(Integer destacado);
}
