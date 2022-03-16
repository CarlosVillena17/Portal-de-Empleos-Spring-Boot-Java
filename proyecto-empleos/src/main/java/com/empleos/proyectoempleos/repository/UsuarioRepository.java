package com.empleos.proyectoempleos.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.empleos.proyectoempleos.model.Usuario;


public interface UsuarioRepository  extends JpaRepository<Usuario, Integer>{

}
