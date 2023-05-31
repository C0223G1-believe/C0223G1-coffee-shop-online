package user.repository;

import user.model.User;

import java.util.List;

public class UserRepoImpl implements UserRepo {

    @Override
    public List<User> displayUser() {
        return null;
    }

    @Override
    public boolean addUser(List<User> userList) {
        return false;
    }

    @Override
    public boolean editUser(List<User> userList) {
        return false;
    }

    @Override
    public boolean deleteUser(int id) {
        return false;
    }
}
