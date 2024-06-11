package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, Integer> {

}
