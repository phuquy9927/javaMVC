package vn.qui.baloshop.repository;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.qui.baloshop.domain.Cart;
import vn.qui.baloshop.domain.Order;
import vn.qui.baloshop.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
    List<Order> findByUser(User user);

    Optional<Order> findByPaymentRef(String paymentRef);
}
