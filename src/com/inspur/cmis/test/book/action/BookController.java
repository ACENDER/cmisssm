package com.inspur.cmis.test.book.action;

import com.inspur.cmis.test.book.model.Book;
import com.inspur.cmis.test.book.service.BookService;
import com.inspur.common.model.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/book")
public class BookController {

    private static final Logger log = LoggerFactory.getLogger(BookController.class);
    private static final long serialVersionUID = 1L;

    @Autowired
    BookService bookservice;

    // 图书列表Action
    @RequestMapping("/listbook")
    public String ListBook(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("books", bookservice.getAllBooks());
        return "/test/book/ListBook";
    }

    @RequestMapping("/listbookByPage")
    public String listbookByPage(HttpServletRequest request, HttpServletResponse response) {

        Pagination<Book> page = new Pagination<Book>(2, 4);
        log.debug("book page = "+page);
        bookservice.getBooksByPage(page);
        request.setAttribute("books", page);
        return "/test/book/ListBookPage";
    }

    // 删除图书Action
    public String Delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("message", bookservice.delete(id) > 0 ? "删除成功！" : "删除失败！");
        request.setAttribute("books", bookservice.getAllBooks());
        return "ListBook.jsp";
    }

    // 多删除图书Action
    public String Deletes(HttpServletRequest request, HttpServletResponse response) {
        String[] ids = request.getParameterValues("ids");
        if (ids != null && ids.length > 0) {
            request.setAttribute("message", bookservice.delete(ids) > 0 ? "删除成功！" : "删除失败！");
        } else {
            request.setAttribute("message", "请选择删除项！");
        }
        request.setAttribute("books", bookservice.getAllBooks());
        return "ListBook.jsp";
    }

    // 添加图书Action
    public String AddBook(HttpServletRequest request, HttpServletResponse response) {
        return "AddBook.jsp";
    }

    // 保存添加图书Action
    public String AddBookPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            String title = request.getParameter("title");
            double price = Double.parseDouble(request.getParameter("price"));

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date publishDate = simpleDateFormat.parse(request.getParameter("publishDate"));

            Book entity = new Book(0, title, price, publishDate);
            if (bookservice.add(entity) > 0) {
                request.setAttribute("model", new Book());
                request.setAttribute("message", "添加成功！");
            } else {
                request.setAttribute("model", entity);
                request.setAttribute("message", "添加失败！");
            }
        } catch (Exception exp) {
            request.setAttribute("message", exp.getMessage());
            exp.printStackTrace();
        }
        return "AddBook.jsp";
    }

    //编辑图书Action
    public String EditBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Book model = bookservice.getBookById(id);
        request.setAttribute("model", model);
        return "EditBook.jsp";
    }

    // 保存编辑图书Action
    public String EditBookPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            String title = request.getParameter("title");
            double price = Double.parseDouble(request.getParameter("price"));

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date publishDate = simpleDateFormat.parse(request.getParameter("publishDate"));

            Book entity = new Book(id, title, price, publishDate);
            request.setAttribute("message", bookservice.update(entity) > 0 ? "更新成功！" : "更新失败！");
            request.setAttribute("model", entity);
        } catch (Exception exp) {
            request.setAttribute("message", exp.getMessage());
            exp.printStackTrace();
        }
        return "EditBook.jsp";
    }


    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        // 获得要执行的方法名
        String act = request.getParameter("act");

        // 如果用户没有提供方法名
        if (act == null || act.equals("")) {
            // 默认方法
            act = "execute";
        }

        // 根据方法名获得方法信息获得方法信息
        Method method;
        try {
            // 在对象中获得类型信息,在类型中获得方法通过方法名，与参数类型
            method = this.getClass().getMethod(act, HttpServletRequest.class, HttpServletResponse.class);
            // 调用方法,在当前对象中调用，传递参数request与response,获得返回结果
            String targetUri = method.invoke(this, request, response) + "";
            // 如果返回的url是以redirect开始，则是重定向
            if (targetUri.startsWith("redirect:")) {
                response.sendRedirect(targetUri.substring(9, targetUri.length()));
            } else {
                // 转发
                request.getRequestDispatcher(targetUri).forward(request, response);
            }
        } catch (Exception e) {
            response.sendError(400, e.getMessage());
            e.printStackTrace();
        }
    }

    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendError(400, "请使用参数act指定您要访问的方法");
    }

}
