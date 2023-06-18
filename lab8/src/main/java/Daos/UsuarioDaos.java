package Daos;

import Beans.Usuario;

import java.sql.*;

public class UsuarioDaos extends BaseDao{


    //------------------------------ validacion del login-------------------------------------------//
    public Usuario obtenerUsuario(int usuarioId) {

        Usuario usuario = null;

        String sql = "SELECT * FROM usuarios u\n" +
                "left  join credenciales c on c.idusuarios = u.idusuarios\n" +
                " WHERE c.idusuarios = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, usuarioId);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    usuario = new Usuario();
                    fetchUsuarioData(usuario, rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return usuario;
    }

    private void fetchUsuarioData(Usuario usuario, ResultSet rs) throws SQLException {

        usuario.setIdusuarios(rs.getInt(1));
        usuario.setNombre(rs.getString(2));
        usuario.setApellido(rs.getString(3));
        usuario.setEdad(rs.getInt(4));
        usuario.setCodigo(rs.getInt(5));
        usuario.setCorreo(rs.getString(6));
        usuario.setEspecialidad(rs.getString(7));
        usuario.setIdEstatus(rs.getInt(8));

    }

    public Usuario validateUsernameAndPassword(String username, String password) {

        Usuario usuario = null;

        String sql = "SELECT * FROM usuarios u \n" +
                "inner join credenciales c on c.idusuarios = u.idusuarios\n" +
                "where c.correo = ? and c.pass = sha2(?,256)";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = obtenerUsuario(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }



    //------------------------------ Crear nuevo usuario-------------------------------------------//
    public void nuevoUsuario(Usuario usuario){
        String sql ="insert into usuarios (nombre,apellido,edad,codigoPucp,correo,especialidad,Estatus_idEstatus) values\n" +
                "(?,?,?,?,?,?,\"1\")";

        try(Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,usuario.getNombre());
            pstmt.setString(2,usuario.getApellido());
            pstmt.setInt(3,usuario.getEdad());
            pstmt.setInt(4,usuario.getCodigo());
            pstmt.setString(5,usuario.getCorreo());
            pstmt.setString(6,usuario.getEspecialidad());
            pstmt.executeUpdate();

            // aun no se como hacer para poder guardar la contraseña tambien
        }
        catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }


    //------------------------------ Crear nuevo con DTO-------------------------------------------//
    public void nuevoUsuario(Usuario usuario){
        String sql ="insert into usuarios (nombre,apellido,edad,codigoPucp,correo,especialidad,Estatus_idEstatus) values\n" +
                "(?,?,?,?,?,?,\"1\")";

        try(Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,usuario.getNombre());
            pstmt.setString(2,usuario.getApellido());
            pstmt.setInt(3,usuario.getEdad());
            pstmt.setInt(4,usuario.getCodigo());
            pstmt.setString(5,usuario.getCorreo());
            pstmt.setString(6,usuario.getEspecialidad());
            pstmt.executeUpdate();

            // aun no se como hacer para poder guardar la contraseña tambien
        }
        catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }






}
