package com.empleos.proyectoempleos.service.db;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.empleos.proyectoempleos.model.Vacante;
import com.empleos.proyectoempleos.repository.VacantesRepository;
import com.empleos.proyectoempleos.service.IvacanteService;

@Service
@Primary
public class VacanteServiceJpa implements IvacanteService {
	
	@Autowired
	private VacantesRepository vacanteRepo; 
	
	
	@Override
	public List<Vacante> buscarTodas() {
		return vacanteRepo.findAll();
	}

	@Override
	public Vacante buscarPorId(Integer idVacante) {
		Optional<Vacante> optional=vacanteRepo.findById(idVacante); 
		if(optional.isPresent()) {
			return optional.get(); 
		}
		return null;
	}

	@Override
	public void guardar(Vacante vacante) {
		vacanteRepo.save(vacante); 
	}

	@Override
	public List<Vacante> buscarDestacada() {
		
		return vacanteRepo.findByDestacado(1);
	}

	@Override
	public void eliminar(Integer id) {
		vacanteRepo.deleteById(id);		
	}

	@Override
	public List<Vacante> buscarByExample(Example<Vacante> example) {
		// TODO Auto-generated method stub
		return vacanteRepo.findAll(example);
	}

	@Override
	public Page<Vacante> buscarTodas(Pageable page) {
		// TODO Auto-generated method stub
		return vacanteRepo.findAll(page);
	}


}
