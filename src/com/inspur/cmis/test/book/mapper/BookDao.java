package com.inspur.cmis.test.book.mapper;

import com.inspur.cmis.test.book.model.Book;
import com.inspur.common.model.Pagination;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 图书数据访问接口
 */
public interface BookDao {
	/**
	 * 获得所有图书
	 */
	public List<Book> getAllBooks();

    public List<Book> getBooksByPage(Pagination<Book> page);
	/**
	 * 根据图书编号获得图书对象
	 */
	public Book getBookById(@Param("id") int id);
	/**
	 * 添加图书
	 */
	public int add(Book entity);
	/**
	 * 根据图书编号删除图书
	 */
	public int delete(int id);
	/**
	 * 更新图书
	 */
	public int update(Book entity);
}
