<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .navbar {
        background-color: #000;
        padding: 1rem 2rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .navbar .navbar-brand img {
        height: 32px;
    }

    .navbar .nav-link {
        color: #fff;
        font-weight: 500;
        margin: 0 15px;
        transition: color 0.3s ease;
    }

    .navbar .nav-link:hover {
        color: #e50914;
    }

    .navbar .nav-link.active {
        font-weight: bold;
        text-decoration: underline;
        color: #e50914 !important;
    }

    .navbar .btn-regresar {
        background-color: transparent;
        color: #fff;
        border: 1px solid #fff;
        font-weight: bold;
        padding: 6px 16px;
        border-radius: 5px;
        transition: all 0.3s ease;
    }

    .navbar .btn-regresar:hover {
        background-color: #fff;
        color: #000;
    }

    .navbar .btn-salir {
        background-color: red;
        color: #fff;
        font-weight: bold;
        padding: 6px 16px;
        border-radius: 5px;
    }

    .navbar .btn-salir:hover {
        background-color: red;
    }

    @media (max-width: 768px) {
        .navbar .nav-link {
            margin: 0 5px;
        }
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid d-flex align-items-center justify-content-between">
        <a class="navbar-brand" href="#">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg" alt="Netflix Logo">
        </a>
        
        <div class="text-center flex-grow-1">
            <a href="${pageContext.request.contextPath}/admin/reportes.jsp"
               class="nav-link ${pageContext.request.servletPath.contains('indexAdmin.jsp') ? 'active' : ''}">
                Reporte
            </a>
        </div>

        <div class="d-flex align-items-center">
            <a href="https://www.netflix.com" target="_blank" class="btn btn-regresar btn-sm me-2">
                Regresar a Netflix
            </a>
            <form action="${pageContext.request.contextPath}/LogoutServlet" method="get" class="d-flex align-items-center m-0 p-0">
                <button type="submit" class="btn btn-salir btn-sm">Cerrar Sesión</button>
            </form>
        </div>
    </div>
</nav>
