package com.isolutions4u.onlineshopping.controllers;

import com.isolutions4u.onlineshopping.model.Category;
import com.isolutions4u.onlineshopping.model.Product;
import com.isolutions4u.onlineshopping.service.CategoryService;
import com.isolutions4u.onlineshopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class IndexController {

    @Autowired
    @Qualifier("categoryService")
    private CategoryService categoryService;

    @Autowired
    @Qualifier("productService")
    private ProductService productService;

    @GetMapping(value = { "/", "/home" })
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView("page");
        modelAndView.addObject("userClickHome", true);
        modelAndView.addObject("title", "Menu Principal");

        modelAndView.addObject("categories", categoryService.findAllCategories());

        return modelAndView;
    }

    @GetMapping("/contact")
    public ModelAndView contact() {
        ModelAndView modelAndView = new ModelAndView("page");
        modelAndView.addObject("userClickContact", true);
        modelAndView.addObject("title", "Contate-nos");

        return modelAndView;
    }

    @GetMapping("/about")
    public ModelAndView about() {
        ModelAndView modelAndView = new ModelAndView("page");
        modelAndView.addObject("userClickAbout", true);
        modelAndView.addObject("title", "Sobre Nos");

        return modelAndView;
    }

    /*
     * Creating Custom Login Controller
     *
     *
     */

    @GetMapping("/login")
    public ModelAndView login(@RequestParam(name = "error", required = false) String error,
            @RequestParam(name = "logout", required = false) String logout) {
        ModelAndView modelAndView = new ModelAndView("login");
        if (error != null) {
            modelAndView.addObject("message", "Nome de utilizador ou Palavra-Passe errada!");
        }
        if (logout != null) {
            modelAndView.addObject("logout", "O utilizador desconectou-se com sucesso!");
        }
        modelAndView.addObject("title", "Login");

        return modelAndView;
    }

    /*
     * Methods to load all the products and based on category
     *
     */

    @GetMapping("/show/all/products")
    public ModelAndView showAllProducts() {
        ModelAndView modelAndView = new ModelAndView("page");
        modelAndView.addObject("userClickAllProducts", true);
        modelAndView.addObject("title", "Todos os produtos");

        // passing the list of categories

        modelAndView.addObject("categories", categoryService.findAllCategories());

        return modelAndView;
    }

    @GetMapping("/show/category/{id}/products")
    public ModelAndView showCategoryProducts(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView("page");

        Category category = null;
        category = categoryService.findCategoryById(id);

        modelAndView.addObject("userClickCategoryProducts", true);
        modelAndView.addObject("title", category.getName());

        // passing the list of categories

        modelAndView.addObject("categories", categoryService.findAllCategories());

        // passing the single category object
        modelAndView.addObject("category", category);

        return modelAndView;
    }

    /*
     * Viewing a single product
     */

    @GetMapping("/show/{id}/product")
    public ModelAndView showSingleProduct(@PathVariable("id") int id) throws ProductNotFoundExceptoion {

        ModelAndView modelAndView = new ModelAndView("page");

        Product product = productService.findProductById(id);

        if (product == null)
            throw new ProductNotFoundExceptoion();

        product.setViews(product.getViews() + 1);
        productService.updateProduct(product);
        modelAndView.addObject("title", product.getName());
        modelAndView.addObject("product", product);
        modelAndView.addObject("userClickShowProduct", true);

        return modelAndView;

    }

    /*
     * Access denied Page
     */
    @GetMapping("/access-denied")
    public ModelAndView accessDenied() {
        ModelAndView modelAndView = new ModelAndView("404");
        modelAndView.addObject("title", "403 - Accesso negado");
        modelAndView.addObject("errorTitle", "Aha! Foste apanhado");
        modelAndView.addObject("errorDescription", "Não tens permiissão para aceder a esta pagina");
        return modelAndView;
    }

    /*
     * Logout
     */
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {

        // first we are going to fetch the authentication
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }

        return "redirect:/login?logout";
    }

}
