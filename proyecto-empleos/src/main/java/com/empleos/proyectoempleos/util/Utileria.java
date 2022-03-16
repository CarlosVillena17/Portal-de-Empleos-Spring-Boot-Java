package com.empleos.proyectoempleos.util;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class Utileria {
	public static String guardarArchivo(MultipartFile multiPart, String ruta) {
		// Obtenemos el nombre original del archivo.
		String nombreOriginal = multiPart.getOriginalFilename();
		nombreOriginal=nombreOriginal.replace(" ", "-"); 
		String nombreFinal=randomAlphanumeric(8).concat(nombreOriginal); 
		try {
			// Formamos el nombre del archivo para guardarlo en el disco duro.
			File imageFile = new File(ruta + nombreFinal);
			System.out.println("Archivo: " + imageFile.getAbsolutePath());
			// Guardamos fisicamente el archivo en HD.
			multiPart.transferTo(imageFile);
			return nombreFinal;
		} catch (IOException e) {
			System.out.println("Error " + e.getMessage());
			return null;
		}
	}
	
	public static String randomAlphanumeric(int count) {
		String CARACTERES="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; 
		StringBuilder str=new StringBuilder(); 
		while(count--!=0) {
			int caracter= (int) (Math.random()*CARACTERES.length()); 
			str.append(CARACTERES.charAt(caracter)); 
		}
		return str.toString(); 
	}
}
