package vn.qui.baloshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import vn.qui.baloshop.domain.User;

//CRUD
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User qui);

    void deleteById(long id);

    List<User> findOneByEmail(String email);

    User findById(long id);

    List<User> findAll();

    boolean existsByEmail(String email);

    User findByEmail(String email);
}
