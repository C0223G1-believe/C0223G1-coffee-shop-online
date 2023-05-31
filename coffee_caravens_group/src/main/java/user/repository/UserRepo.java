package user.repository;

import user.model.User;

import java.util.List;

public interface UserRepo {
    //    display
    List<User> displayUser();
    //    add
    boolean addUser(List<User> userList);
    //  edit
    boolean editUser(List<User> userList);
    //    delete
    boolean deleteUser( int id);
}

