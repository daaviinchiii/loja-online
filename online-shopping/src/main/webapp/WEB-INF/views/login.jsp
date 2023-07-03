<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="PT">

<head>
    <title>Lojinha Ilegal - ${title}</title>
    <script type="text/javascript">
        window.menu = '${title}';
        window.contextRoot = '${contextRoot}'
    </script>
    <!-- Bootstrap core CSS -->
    <link href="${contextRoot}/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Readable Theme -->
    <link href="${contextRoot}/static/css/bootstrap-readable-theme.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #F5F5FA;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .panel-primary {
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15);
            border: none;
            border-radius: 10px;
        }

        .panel-heading {
            background-color: #007bff;
            color: white;
            border-radius: 0;
            text-align: center;
            padding: 10px;
        }

        .from-control {
            background-color: #F5F5FA;
        }

        .panel-body {
            padding: 20px;
            background-color: #F5F5FA;
            border-radius: 10px;
        }

        .form-group label {
            text-align: center;
            font-weight: bold;
            background-color: #F5F5FA;
        }

        .panel-footer {
            background-color: #F5F5FA;
            border: none;
            padding: 10px;
            text-align: center;
        }

        .register-button {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: normal;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
        }

        /* Botão personalizado */
        .custom-button {
            display: inline-block;
            padding: 10px 20px;
            margin-bottom: 0;
            font-size: 16px;
            font-weight: bold;
            line-height: 1.5;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            background-image: none;
            border: none;
            border-radius: 5px;
            color: #fff;
            background-color: #5cb85c;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s;
            font-family: "Cascadia Code", Consolas, Monaco, "Andale Mono", "Ubuntu Mono", monospace;
        }

        .custom-button:hover {
            background-color: #4cae4c;
        }

        /* Botão de erro personalizado */
        .error-button {
            display: inline-block;
            padding: 10px 20px;
            margin-bottom: 0;
            font-size: 16px;
            font-weight: bold;
            line-height: 1.5;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            background-image: none;
            border: none;
            border-radius: 5px;
            color: #fff;
            background-color: #d9534f;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s;
        }

        .error-button:hover {
            background-color: #d43f3a;
        }

        .button-67 {
            align-items: center;
            background: #f5f5fa;
            border: 0;
            border-radius: 8px;
            box-shadow: -10px -10px 30px 0 #fff, 10px 10px 30px 0 #1d0dca17;
            box-sizing: border-box;
            color: #2a1f62;
            cursor: pointer;
            display: flex;
            font-family: "Cascadia Code", Consolas, Monaco, "Andale Mono", "Ubuntu Mono", monospace;
            font-size: 1.3rem;
           font-weight: 900;
            justify-content: center;
            line-height: 1.5rem;
            padding: 15px;
            position: relative;
            text-align: left;
            transition: .2s;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            white-space: pre;
            width: max-content;
            word-break: normal;
            word-spacing: normal;
        }

        .button-67:hover {
            background: #f8f8ff;
            box-shadow: -15px -15px 30px 0 #fff, 15px 15px 30px 0 #1d0dca17;
        }

        @media (min-width: 768px) {
            .button-67 {
                padding: 24px;
            }
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="${contextRoot}/home">Compras online</a>
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="content">
            <div class="container">
                <c:if test="${not empty message}">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6">
                            <div class="alert alert-danger">${message}</div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${not empty logout}">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6">
                            <div class="alert alert-success">${logout}</div>
                        </div>
                    </div>
                </c:if>

                <div class="row">
                    <div class="col-md-offset-4 col-md-4">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <h4 class="text-center">Iniciar Sessao</h4>
                                <form action="${contextRoot}/login" method="post" class="form-horizontal"
                                    id="loginForm">
                                    <div class="form-group">
                                        <div class="col-md-offset-1 col-md-10">
                                            <input type="email" name="username" class="form-control" placeholder="Email"
                                                required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-offset-1 col-md-10">
                                            <input type="password" name="password" class="form-control"
                                                placeholder="Password" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-offset-4 col-md-8">
                                            <button type="submit" name="password"  class="button-67" role="button">Entrar!</button>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        </div>
                                    </div>
                                </form>
                                <div class="text-center">
  <a href="${contextRoot}/register" class="button-67" role="button" style="text-decoration: none; color: inherit;">Regista-te aqui!</a>
</div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Page Content -->

        <!-- Footer -->
        <%@ include file="share/footer.jsp" %>

        <!-- jQuery -->
        <script src="${contextRoot}/static/js/jquery.js"></script>

        <!-- jQuery validator -->
        <script src="${contextRoot}/static/js/jquery.validate.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${contextRoot}/static/js/bootstrap.min.js"></script>

        <!-- Self-coded JavaScript -->
        <script src="${contextRoot}/static/js/myapp.js"></script>
    </div>
</body>
</html>
