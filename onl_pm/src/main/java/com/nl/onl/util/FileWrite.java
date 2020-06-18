package com.nl.onl.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileWrite {
	public boolean writeFile(String fileLoc, String fileContent) {
		boolean isS = false;
		
		File file = new File(fileLoc);
		
		
		try {
			FileWriter fileWriter;
			fileWriter = new FileWriter(file, false);
			
			BufferedWriter bw = new BufferedWriter(fileWriter);
			
			bw.write(fileContent);
			bw.flush();
			
			bw.close();

			System.out.println("complete");
			isS = true;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isS;
	}
}
