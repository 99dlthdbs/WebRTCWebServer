package com.loginform.test;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;
import java.io.IOException;

/*
 p.74
 HttpServlet는 서블릿이 웹상에서 HTTP 프로토콜을 이용해 서비스를 처리하기 위해
 반드시 상속받아야 하는 클래스이다. 즉 모든 서블릿클래스의 상위 클래스는 HttpServlet이어야한다.
 */

public class FirstServlet extends HttpServlet{
    @Override
    public void init(ServletConfig config)throws ServletException{
        System.out.println("init() 실행됨");
    }

    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException{
        System.out.println("service() 실행됨");
    }
}