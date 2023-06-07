package com.example.coffee_shop.user.repository.repoTypeUser;

import com.example.coffee_shop.BaseRepository;
import com.example.coffee_shop.user.model.Role;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TypeUserRepositoryImpl implements ITypeUserRepository{
    BaseRepository baseRepository =new BaseRepository();
    private static final String SELECT_ROLE = " SELECT * from role ";
    @Override
    public List<Role> displayRole() {
        Connection connection = baseRepository.getConnection();
        List<Role> typeUserList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ROLE);
            while (resultSet.next()) {
                int idTypeUser = resultSet.getInt("id_role");
                String nameTypeUser = resultSet.getString("name_role");
               typeUserList.add(new Role(idTypeUser,nameTypeUser));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return typeUserList;
    }
}
