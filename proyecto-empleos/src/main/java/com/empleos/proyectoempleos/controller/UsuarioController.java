package com.empleos.proyectoempleos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.empleos.proyectoempleos.service.IUsuarioService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	private IUsuarioService usuarioService; 
	
	@GetMapping("/index")
	public String index(Model model){
		model.addAttribute("usuarios", usuarioService.buscarTodos());
		return "usuario/listUsuarios";
	}
	
	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable("id") int idUsuario, RedirectAttributes flash){
		usuarioService.eliminar(idUsuario);
		flash.addFlashAttribute("msg", "Eliminado correctamente"); 
		return "redirect:/usuarios/index"; 
		
	}
}
