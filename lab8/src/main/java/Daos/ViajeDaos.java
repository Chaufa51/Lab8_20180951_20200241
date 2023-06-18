package Daos;

import Beans.Seguro;
import Beans.Usuario;
import Beans.Viaje;

import java.sql.*;
import java.util.ArrayList;

public class ViajeDaos extends BaseDao{

    // ----------- lista los viajes por usuarios ----------------------//
    public ArrayList<Viaje> listarViajes(int idusuario){

        ArrayList<Viaje> listaViajes = new ArrayList<>();

        String sql = "select * from viajes v \n" +
                "left join usuarios u on u.idusuarios = v.idusuarios\n" +
                "left join seguros s on s.idseguros = v.seguros_idseguros\n" +
                "where v.idusuarios = ?";

        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql)){

            preparedStatement.setInt(1, idusuario);

            try(ResultSet resultSet = preparedStatement.executeQuery()){

            if (resultSet.next()){
                Viaje viaje = new Viaje();
                viaje.setIdViaje(resultSet.getInt(1));
                viaje.setFechaReserva(resultSet.getDate(2));
                viaje.setFechaViaje(resultSet.getDate(3));
                viaje.setCiudadOrigen(resultSet.getString(4));
                viaje.setCiudadDestino(resultSet.getString(5));
                viaje.setCantidadBoletos(resultSet.getInt(7));
                viaje.setCostoTotal(resultSet.getDouble(8));
                viaje.setHabilitado(resultSet.getInt(9));
                viaje.setIdUsuario(resultSet.getInt(10));

                Seguro seguro = new Seguro();
                seguro.setIdseguros(resultSet.getInt("s.idseguros"));
                seguro.setNombre(resultSet.getString("s.nombre"));

                viaje.setSeguro(seguro);
                listaViajes.add(viaje);
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaViajes;
    }


    //------------------------------ crear un nuevo viaje-------------------
    public void nuevoViaje(Viaje viaje){
        String sql ="insert into viajes values \n" +
                "?,?,?,?,?,?,?,?,'1','1')";

        try(Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1,viaje.getIdViaje());
            pstmt.setDate(2,viaje.getFechaReserva());
            pstmt.setDate(3,viaje.getFechaViaje());
            pstmt.setString(4,viaje.getCiudadOrigen());
            pstmt.setString(5,viaje.getCiudadDestino());
            pstmt.setInt(6,viaje.getIdSeguros());
            pstmt.setInt(7,viaje.getCantidadBoletos());
            pstmt.setDouble(8,viaje.getCostoTotal());
            pstmt.executeUpdate();

        }
        catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    //---------------------------------- Buscador de viajes por ciudad de origen y por ciudad de destino ------


    public ArrayList<Viaje> buscarViajePorCiudad(String name) {

        ArrayList<Viaje> listaViaje = new ArrayList<>();

        String sql = "select * from viajes\n" +
                "where ciudadOrigen like ? or ciudadDestino like ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, name + "%");
            pstmt.setString(2, name + "%");

            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    Viaje viaje = new Viaje();
                    fetchviajeData(viaje, rs);

                    listaViaje.add(viaje);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listaViaje;
    }
    //------------------- sirve para el buscador

    private void fetchviajeData(Viaje viaje, ResultSet rs) throws SQLException {

        viaje.setIdViaje(rs.getInt(1));
        viaje.setFechaReserva(rs.getDate(2));
        viaje.setFechaViaje(rs.getDate(3));
        viaje.setCiudadOrigen(rs.getString(4));
        viaje.setCiudadDestino(rs.getString(5));
        viaje.setIdSeguros(rs.getInt(6));
        viaje.setCantidadBoletos(rs.getInt(7));
        viaje.setCostoTotal(rs.getDouble(8));
        viaje.setHabilitado(rs.getInt(9));
        viaje.setIdUsuario(rs.getInt(10));

    }

}
