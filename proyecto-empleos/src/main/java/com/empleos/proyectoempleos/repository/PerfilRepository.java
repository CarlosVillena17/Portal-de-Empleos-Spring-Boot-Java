package com.empleos.proyectoempleos.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.empleos.proyectoempleos.model.Perfil;



public interface PerfilRepository extends JpaRepository<Perfil, Integer> {
	
}
