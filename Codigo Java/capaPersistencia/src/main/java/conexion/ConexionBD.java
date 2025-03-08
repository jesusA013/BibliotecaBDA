/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexion;

import excepciones.PersistenciaException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Jesus
 */
public class ConexionBD implements IConexionBD {

    final String USUARIO = "root";
    final String PASS = "itson";
    final String CADENA_CONEXION = "jdbc:mysql://localhost:3306/bibliotecabda";

    /**
     * Metodo crearCoonxeion(). Crea la conexion con la base de datos.
     * @return objeto Connection con la conexion creada.
     * @throws PersistenciaException Excepcion si no se creo la conexion.
     */
    @Override
    public Connection crearConexion() throws PersistenciaException {
        try {
            Connection conexion =DriverManager.getConnection(CADENA_CONEXION, USUARIO, PASS);
            return conexion;
        } catch (Exception e) {
             Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, e);
             throw new PersistenciaException("Error al conectarse a la base de datos. ");
        }
    }

   
}
