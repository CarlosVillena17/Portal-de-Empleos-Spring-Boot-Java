package com.empleos.proyectoempleos.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.jboss.jandex.TypeTarget.Usage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.empleos.proyectoempleos.model.*;
import com.empleos.proyectoempleos.service.*;

@Controller
public class HomeController {
	
	@Autowired
	private IvacanteService serviceVacantes;
	
	@Autowired
	private IUsuarioService serviceUsuario; 
	
	@Autowired
	private ICategoriasService serviceCategorias; 
	
	@GetMapping("/tabla")
	public String mostrarTabla(Model model) throws ParseException {
		List<Vacante> vacantes=serviceVacantes.buscarTodas();
		model.addAttribute("vacantes", vacantes); 

		return "tabla"; 
	}
	
	@GetMapping("/detalle")
	public String mostrarDetalle(Model model) {
		Vacante vacante=new Vacante(); 
		vacante.setId(1); 
		vacante.setNombre("Ingeniero Software"); 
		vacante.setDescripcion("Se solicita ingeniero para dar soporte"); 
		vacante.setFecha(new Date()); 
		vacante.setSalario(2000D);
		model.addAttribute("vacante", vacante);
		return "detalle";
	}
	
	
	@GetMapping("/listado")
	public String mostrarLista(Model model) {
		List<String> lista=new LinkedList<>(); 
		lista.add("ingeniero de Sistemas"); 
		lista.add("Ingeniero de Software"); 
		lista.add("Programador UX"); 
		lista.add("Programador UI");
		model.addAttribute("empleos", lista); 
		return "listar";
	}
	
	@GetMapping("/index")
	public String mostrarHome(Model model) {
		return "home";
	}
	
	//Podemos agregar al modelo todos los atriburos que queramos
	
	
	@GetMapping("/signup")
	public String registrarse(Usuario usuario) {
		return "formRegistro";
	}
	
	@PostMapping("/signup")
	public String registrarse(Usuario usuario, Model model, RedirectAttributes flash) {
		usuario.setFechaRegistro(new Date()); 
		usuario.setEstatus(1);
		Perfil perfil=new Perfil();
		perfil.setId(1);  
		usuario.agregar(perfil); 
		serviceUsuario.guardar(usuario); 
		flash.addAttribute("msg", "Usuario agregado correctamente");
		return "redirect:/usuarios/index";
	}
	
	@ModelAttribute()
	public void setGenericos(Model model) {
		Vacante vacanteSearch=new Vacante(); 
		vacanteSearch.reset();
		model.addAttribute("vacantes", serviceVacantes.buscarDestacada()); 
		model.addAttribute("categorias", serviceCategorias.buscarTodas());
		model.addAttribute("search", vacanteSearch); 
	}
	
	/**
	 Init Binder para String si los detecta vacios en el Data Binding los settea Null 
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}
	
	@GetMapping("/search")
	public String buscar(@ModelAttribute("search") Vacante vacante, Model model) {
		System.out.println("Vacante: "+vacante);
		//USA LA PALABRA LIKE 
		//where descripcion like "%?%"
		ExampleMatcher martcher=ExampleMatcher.matching().withMatcher("descripcion", 
				ExampleMatcher.GenericPropertyMatchers.contains()); 
		Example<Vacante> example=Example.of(vacante, martcher); 
		List<Vacante> lista=serviceVacantes.buscarByExample(example); 
		model.addAttribute("vacantes", lista);
		return "home";
	}
	
	
}
