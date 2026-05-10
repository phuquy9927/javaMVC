package vn.qui.baloshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.qui.baloshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
    

    
}
