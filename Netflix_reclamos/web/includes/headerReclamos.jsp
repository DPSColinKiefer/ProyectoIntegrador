<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .breadcrumb-item > .text-danger {
        color: #e50914 !important;
    }
    .breadcrumb-item + .breadcrumb-item::before {
        color: #e50914 !important;
    }
    .breadcrumb-item .active {
        text-decoration: underline !important;
        font-weight: bold !important;
    }
</style>
<nav class="container-fluid py-3 px-4">
    <div class="d-flex align-items-center">
        <div class="me-4">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg" height="30" alt="Netflix Logo">
        </div>
        <div class="flex-grow-1 text-center">
            <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 justify-content-center">
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/cliente/crearReclamo.jsp" class="text-decoration-none text-danger ${pageContext.request.servletPath.contains('crearReclamo.jsp') ? 'active' : ''}">Crear Reclamo</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/cliente/tipoReclamo.jsp" class="text-decoration-none text-danger ${pageContext.request.servletPath.contains('tipoReclamo.jsp') ? 'active' : ''}">Tipo de Reclamo</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/cliente/detalleReclamo.jsp" class="text-decoration-none text-danger ${pageContext.request.servletPath.contains('detalleReclamo.jsp') ? 'active' : ''}">Detalle del Reclamo</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/cliente/resumenReclamo.jsp" class="text-decoration-none text-danger ${pageContext.request.servletPath.contains('resumenReclamo.jsp') ? 'active' : ''}">Resumen y Confirmación</a>
                    </li>
                </ol>
            </nav>
        </div>
        <div style="width: 120px;"></div>
    </div>
</nav>