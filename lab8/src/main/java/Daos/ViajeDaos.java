package Daos;

import Beans.Seguro;
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
}
