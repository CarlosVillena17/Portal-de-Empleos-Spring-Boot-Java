package com.empleos.proyectoempleos.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.empleos.proyectoempleos.model.*;

@Service
public class VacanteServiceImpl implements IvacanteService {
	private List<Vacante> lista=null; 
	
	public VacanteServiceImpl() {
		
		lista=new LinkedList<Vacante>();
		SimpleDateFormat formato=new SimpleDateFormat("dd-MM-yyyy"); 
			try {
			Vacante vacante=new Vacante(); 
			vacante.setId(1); 
			vacante.setNombre("Ingeniero Software"); 
			vacante.setDescripcion("Se solicita ingeniero para dar soporte"); 
			vacante.setFecha(formato.parse("07-12-2021")); 
			vacante.setSalario(2000D);
			vacante.setDestacado(1);
			vacante.setImagen("empresa1.png");
			
			Vacante vacante1=new Vacante(); 
			vacante1.setId(2); 
			vacante1.setNombre("Ingeniero Sistemas"); 
			vacante1.setDescripcion("Se solicita ingeniero para dar soporte"); 
			vacante1.setFecha(formato.parse("07-12-2021")); 
			vacante1.setSalario(2000D);
			vacante1.setDestacado(0);
			vacante1.setImagen("empresa2.png");
			
			
			Vacante vacante2=new Vacante(); 
			vacante2.setId(3); 
			vacante2.setNombre("Ingeniero Informatica"); 
			vacante2.setDescripcion("Se solicita ingeniero para dar soporte"); 
			vacante2.setFecha(formato.parse("07-12-2021")); 
			vacante2.setSalario(4000D);
			vacante2.setDestacado(1);
			vacante2.setImagen("empresa3.png");
			
			
			Vacante vacante3=new Vacante(); 
			vacante3.setId(4); 
			vacante3.setNombre("Ingeniero Minas"); 
			vacante3.setDescripcion("Se solicita ingeniero para dar soporte"); 
			vacante3.setFecha(formato.parse("07-12-2021")); 
			vacante3.setSalario(5000D);
			vacante3.setDestacado(0);
			
			
			
			lista.add(vacante);
			lista.add(vacante1);
			lista.add(vacante2);
			lista.add(vacante3);
			}catch (ParseException e) {
				// TODO: handle exception
			}

	}
	
	@Override
	public List<Vacante> buscarTodas() {
		
		return this.lista;
	}

	@Override
	public Vacante buscarPorId(Integer idVacante) {
		for(Vacante i: lista) {
			if(i.getId()==idVacante) {
				return i;
			}
		}
		return null;
	}

	@Override
	public void guardar(Vacante vacante) {
		this.lista.add(vacante);
		
	}

	@Override
	public List<Vacante> buscarDestacada() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void eliminar(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Vacante> buscarByExample(Example<Vacante> example) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public Page<Vacante> buscarTodas(org.springframework.data.domain.Pageable page) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
