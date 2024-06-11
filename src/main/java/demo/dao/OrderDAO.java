package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import demo.entity.Account;
import demo.entity.Order;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface OrderDAO extends JpaRepository<Order, Integer> {
	
	Page<Order> findByAccount(Account account, Pageable pageable);

	
}
