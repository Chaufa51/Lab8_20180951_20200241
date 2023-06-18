package Daos;

import Dtos.RegistroUsuarioDto;

import java.sql.*;

public class UsuarioRegistroDaos extends BaseDao{
    public static int idUsuario;
    //------------------------------ Crear nuevo usuario-------------------------------------------//
    /*public void nuevoUsuario(RegistroUsuarioDto registroUsuarioDto){
        String sql ="insert into usuarios (nombre,apellido,edad,codigoPucp,correo,especialidad,Estatus_idEstatus) values\n" +
                "(?,?,?,?,?,?,\"1\")";

        try(Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)){

            pstmt.setString(1,registroUsuarioDto.getNombre());
            pstmt.setString(2,registroUsuarioDto.getApellido());
            pstmt.setInt(3,registroUsuarioDto.getEdad());
            pstmt.setInt(4,registroUsuarioDto.getCodigoPucp());
            pstmt.setString(5,registroUsuarioDto.getCorreoPucp());
            pstmt.setString(6,registroUsuarioDto.getEspecialidad());
            pstmt.executeUpdate();

            ResultSet id = pstmt.getGeneratedKeys();
            idUsuario = id.getInt(1);


        }
        catch (SQLException ex){
            throw new RuntimeException(ex);
        }

        String sql2 ="INSERT INTO credenciales (correo, pass, idusuarios)\n" +
                "VALUES (?,?,?)";

        try(Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql2)){

            pstmt.setString(1,registroUsuarioDto.getCorreoPucp());
            pstmt.setString(2,registroUsuarioDto.getPassword1());
            pstmt.setInt(3,idUsuario);
            pstmt.executeUpdate();
        }
        catch (SQLException ex){
            throw new RuntimeException(ex);
        }

    }

*/

    public void nuevoUsuario(RegistroUsuarioDto registroUsuarioDto) {
        String sql = "INSERT INTO usuarios (nombre, apellido, edad, codigoPucp, correo, especialidad, Estatus_idEstatus) " +
                "VALUES (?, ?, ?, ?, ?, ?, '1')";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, registroUsuarioDto.getNombre());
            pstmt.setString(2, registroUsuarioDto.getApellido());
            pstmt.setInt(3, registroUsuarioDto.getEdad());
            pstmt.setInt(4, registroUsuarioDto.getCodigoPucp());
            pstmt.setString(5, registroUsuarioDto.getCorreoPucp());
            pstmt.setString(6, registroUsuarioDto.getEspecialidad());
            pstmt.executeUpdate();

            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            int idUsuario;
            if (generatedKeys.next()) {
                idUsuario = generatedKeys.getInt(1);
            } else {
                throw new SQLException("No se pudo obtener el ID generado");
            }

            String sql2 = "INSERT INTO credenciales (correo, pass, idusuarios) VALUES (?, ?, ?)";

            try (PreparedStatement pstmt2 = connection.prepareStatement(sql2)) {
                pstmt2.setString(1, registroUsuarioDto.getCorreoPucp());
                pstmt2.setString(2, registroUsuarioDto.getPassword1());
                pstmt2.setInt(3, idUsuario);
                pstmt2.executeUpdate();
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }





}
