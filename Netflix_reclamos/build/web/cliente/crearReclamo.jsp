<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../includes/headerReclamos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Crear Reclamos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <style>
            :root {
                --netflix-red: #e50914;
                --netflix-dark: #000;
                --netflix-card-bg: #141414;
                --netflix-light-gray: #8c8c8c;
            }

            body {
                background: var(--netflix-dark) !important;
                color: white;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                padding: 0;
                margin: 0;
            }

            .main-content {
                flex: 1;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px 0;
            }

            .options-container {
                width: 100%;
                max-width: 900px;
            }

            .card-option {
                background-color: var(--netflix-card-bg);
                border: 1px solid var(--netflix-red);
                border-radius: 8px;
                transition: transform 0.3s, box-shadow 0.3s;
                height: 100%;
            }

            .btn-netflix {
                background-color: var(--netflix-red);
                color: #fff;
                border: none;
                height: 40px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 6px;
            }

            .btn-netflix:hover {
                background-color: var(--netflix-red) !important;
                color: #fff;
            }

            .page-title {
                color: white;
                font-size: 32px;
                font-weight: 800;
                margin-bottom: 40px;
            }

            .card-title {
                color: white;
                font-weight: 600;
                margin-bottom: 15px;
            }

            .card-text {
                color: var(--netflix-light-gray);
                margin-bottom: 20px;
            }

            .btn-outline-light {
                border-radius: 6px;
                padding: 10px 25px;
                transition: transform .5s;
            }

            .btn-outline-light:hover {
                transform: scale(1.1);
            }
        </style>
    </head>
    <body>
        <main class="main-content">
            <div class="options-container">
                <div class="row justify-content-center">
                    <div class="col-md-5 mb-4 mx-3">
                        <div class="card card-option text-center p-4">
                            <h3 class="card-title">Crear Reclamo</h3>
                            <p class="card-text">¿Tienes un problema con el servicio?</p>
                            <a href="${pageContext.request.contextPath}/TipoReclamoVistaServlet" class="btn btn-netflix w-100">Continuar</a>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-5">
                    <a href="indexCliente.jsp" class="btn btn-outline-light fw-bold">Regresar al Menú</a>
                </div>
            </div>
        </main>

        <%@ include file="../includes/footer.jsp" %>
    </body>
</html>