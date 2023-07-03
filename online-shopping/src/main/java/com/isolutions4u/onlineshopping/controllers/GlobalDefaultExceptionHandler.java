package com.isolutions4u.onlineshopping.controllers;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@ControllerAdvice
public class GlobalDefaultExceptionHandler implements ErrorController {

    private static final String PATH = "/error";

    @RequestMapping(value = PATH)
    @ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView error() {
        ModelAndView modelAndView = new ModelAndView("404");
        modelAndView.addObject("errorTitle", "A Pagina não foi construida");
        modelAndView.addObject("errorDescription", "A pagina não está disponivel de momento");
        modelAndView.addObject("title", "404 Error Page");
        return modelAndView;
    }

    @Override
    public String getErrorPath() {
        // TODO Auto-generated method stub
        return PATH;
    }

    @ExceptionHandler(ProductNotFoundExceptoion.class)
    public ModelAndView errorProductNotfound() {
        ModelAndView modelAndView = new ModelAndView("404");
        modelAndView.addObject("errorTitle", "Este produto nao esta disponivel");
        modelAndView.addObject("errorDescription", "O produto que procura nao esta disponivel de momento");
        modelAndView.addObject("title", "Produto indisponivel");
        return modelAndView;
    }

    @ExceptionHandler(MultipartException.class)
    public String handleError1(MultipartException e, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("message", e.getCause().getMessage());
        return "/redirect:/manage/products";

    }

}
