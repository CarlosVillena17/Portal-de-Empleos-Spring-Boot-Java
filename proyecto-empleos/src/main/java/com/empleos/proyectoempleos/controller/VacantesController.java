package com.empleos.proyectoempleos.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.empleos.proyectoempleos.service.*;
import com.empleos.proyectoempleos.model.*;
import com.empleos.proyectoempleos.util.*;


@Controller
@RequestMapping("/vacantes")
public class VacantesController {
	
	//@Value("${empleosapp.ruta.imagenes}")
	private String ruta; 
	
	@Autowired
	private IvacanteService serviceVacantes;
	
	@Autowired
	@Qualifier("categoriaServiceJpa")
	private ICategoriasService serviceCategoria; 
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	@GetMapping("/index")
	public String mostrarIndex(Model model) {
		List<Vacante> lista=serviceVacantes.buscarTodas(); 
		model.addAttribute("vacantes", lista); 
		return "vacante/listVacantes";
	}
	
	@GetMapping("/create")
	public String crear(Vacante vacante, Model model) {
		
		return "vacante/formVacante";
	}
	
	@PostMapping("/save")
	public String guardar(Vacante vacante, BindingResult result, RedirectAttributes atrAttributes
			, @RequestParam("archivoImagen") MultipartFile multiPart) {
		
		if(result.hasErrors()) {
			for (ObjectError error: result.getAllErrors()){
				System.out.println("Ocurrio un error: " + error.getDefaultMessage());
				}

			return "vacante/formVacante";
		}
		
		if (!multiPart.isEmpty()) {
			//String ruta = "/empleos/img-vacantes/"; // Linux/MAC
			String ruta = "c:/empleos/img-vacantes/"; // Windows
			String nombreImagen = Utileria.guardarArchivo(multiPart, ruta);
			if (nombreImagen != null){ // La imagen si se subio
			// Procesamos la variable nombreImagen
			vacante.setImagen(nombreImagen); 
			}
			}

		
		
		serviceVacantes.guardar(vacante); 
		atrAttributes.addFlashAttribute("msg", "Registro Guardado");
		System.out.print(vacante); 
		//redirect hace una peticion HTTP
		return "redirect:/vacantes/index";
	}
	 
	
	/*
	@PostMapping("/save")
	public String guardar(@RequestParam("nombre") String nombre
			, @RequestParam("descripcion")  String descripcion, @RequestParam("estatus") String categoria
			, @RequestParam("fecha") String fecha, @RequestParam("destacado") int destacado
			, @RequestParam("salario") double salario, @RequestParam("detalles") String detalle) {
		
		return "vacante/listVacantes";
	}
	*/
	
	
	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable("id") int idVacante, Model model, RedirectAttributes atrAttributes) {
		System.out.print("El id es : "+idVacante); 
		serviceVacantes.eliminar(idVacante); 
		atrAttributes.addFlashAttribute("msg", "La vacante fue eliminada"); 
		return "redirect:/vacantes/index"; 
	}
	
	@GetMapping("/view/{id}")
	public String verDetalle(@PathVariable("id") int idVacante, Model model) {
		System.out.print("ID Vacante: "+idVacante); 
		
		model.addAttribute("vacante", serviceVacantes.buscarPorId(idVacante));
		return "detalle";
	}
	
	
	@GetMapping("/edit/{id}")
	public String editar(@PathVariable("id") int idVacante, Model model ) {
		Vacante vacante=serviceVacantes.buscarPorId(idVacante); 
		model.addAttribute("vacante", vacante); 
		return "vacante/formVacante";
	}
	
	@ModelAttribute
	public void setGenericos(Model model) {
		model.addAttribute("categorias", serviceCategoria.buscarTodas()); 
	}
	
	
	@GetMapping(value = "/indexPaginate")
	public String mostrarIndexPaginado(Model model, Pageable page) {
	Page<Vacante> lista = serviceVacantes.buscarTodas(page);
	model.addAttribute("vacantes", lista);
	return "vacante/listVacantes";
	}

	
}
