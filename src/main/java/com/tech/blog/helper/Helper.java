/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.helper;

import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author prateekgupta
 */
public class Helper {
    
    public static boolean saveFile(InputStream is, String path ){
        boolean flag = false;
        
        try{
            byte b[] = new byte[is.available()];
            is.read(b);
            
            FileOutputStream fos = new FileOutputStream(path);
            
            fos.write(b);
            fos.flush();
            fos.close();
            flag = true;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return flag;
    }
}
