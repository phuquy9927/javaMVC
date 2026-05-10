package vn.qui.baloshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.qui.baloshop.domain.Cart;
import vn.qui.baloshop.domain.Product;
import vn.qui.baloshop.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long>{
    Cart findByUser(User user);
}
