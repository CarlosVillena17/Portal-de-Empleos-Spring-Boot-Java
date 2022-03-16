package com.empleos.proyectoempleos.controller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.empleos.proyectoempleos.service.*;
import com.empleos.proyectoempleos.model.*;
import com.empleos.proyectoempleos.util.*;





@Controller
@RequestMapping("/categorias")
public class CategoriasController {
	
	@Autowired
	@Qualifier("categoriaServiceJpa")
	private ICategoriasService categoriasService; 
	
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String mostrarIndex(Model model) {
		List<Categoria> lista=categoriasService.buscarTodas(); 
		model.addAttribute("categorias", lista);
		return "categorias/listCategoria";
	}
	
	//LE TENEMOS QUE PASAR EL OBJETO categoria 
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String crear(Categoria categoria) {
		return "categorias/formCategoria";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public String guardar(Categoria categoria, BindingResult binding, RedirectAttributes flash) {
		if(binding.hasErrors()) {
			return "categorias/formCategoria";
		}
		categoriasService.guardar(categoria);
		flash.addFlashAttribute("msg", "Agregado correctamemte"); 
		return "redirect:/categorias/index";
	}
	
	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable("id") int idCategoria, RedirectAttributes attributes) {		
		// Eliminamos la categoria.
		categoriasService.eliminar(idCategoria);			
		attributes.addFlashAttribute("msg", "La categoría fue eliminada!.");
		return "redirect:/categorias/index";
	}
	@GetMapping("/edit/{id}")
	public String editar(@PathVariable("id") int variable, Model model) {
		Categoria categoria=categoriasService.buscarPorId(variable); 
		model.addAttribute("categoria", categoria);
		return "categorias/formCategoria";
	}
	
}
