<%@page import="com.google.gson.Gson"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="DAO.ReclamoDAO" %>
<%@ page import="Util.ConexionBD" %>

<%
    int total = 0, pendientes = 0, revision = 0, resueltos = 0;
    Map<String, Integer> categorias = new LinkedHashMap<>();
    Map<String, Integer> balanceEstados = new LinkedHashMap<>();

    try (Connection con = ConexionBD.getConexion()) {
        ReclamoDAO dao = new ReclamoDAO(con);
        total = dao.contarReclamos();
        pendientes = dao.contarReclamosPorEstado("Pendiente");
        revision = dao.contarReclamosPorEstado("En revisión");
        resueltos = dao.contarReclamosPorEstado("Resuelto");
        categorias = dao.contarReclamosPorCategoria();
        balanceEstados.put("Pendiente", pendientes);
        balanceEstados.put("En revisión", revision);
        balanceEstados.put("Resuelto", resueltos);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Reportes de Reclamos</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --netflix-red: #e50914;
                --netflix-dark: #000;
                --netflix-card-bg: #141414;
                --netflix-light-gray: #8c8c8c;
                --netflix-green: #28a745;
                --netflix-yellow: #ffc107;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
                background-color: var(--netflix-dark);
                color: white;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .main-container {
                width: 100%;
                max-width: 1200px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .dashboard-container {
                width: 100%;
                margin: 0 auto;
            }

            .page-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 25px;
                width: 100%;
            }

            .page-title {
                color: var(--netflix-red);
                margin: 0;
                font-weight: 600;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .page-title i {
                font-size: 1.8rem;
            }

            .btn-back {
                background-color: transparent;
                color: white;
                border: 1px solid var(--netflix-light-gray);
                padding: 8px 15px;
                border-radius: 4px;
                font-weight: bold;
                display: flex;
                align-items: center;
                gap: 8px;
                transition: all 0.3s;
                text-decoration: none;
                cursor: pointer;
            }

            .btn-back:hover {
                background-color: white;
                color: black;
                border-color: white;
            }

            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
                width: 100%;
            }

            .stat-card {
                background-color: var(--netflix-card-bg);
                border-radius: 8px;
                padding: 20px;
                border-left: 4px solid var(--netflix-red);
            }

            .stat-card h3 {
                font-size: 1rem;
                color: var(--netflix-light-gray);
                margin-top: 0;
                margin-bottom: 10px;
            }

            .stat-card .value {
                font-size: 2rem;
                font-weight: 600;
                margin: 0;
            }

            .chart-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
                width: 100%;
            }

            .chart-box {
                background-color: var(--netflix-card-bg);
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            }

            .chart-box h3 {
                margin-top: 0;
                margin-bottom: 15px;
                font-size: 1.2rem;
                color: white;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .chart-box h3 i {
                color: var(--netflix-red);
            }

            .chart-wrapper {
                position: relative;
                height: 300px;
            }

            .status-list {
                list-style: none;
                padding: 0;
                margin: 15px 0 0;
                display: flex;
                flex-wrap: wrap;
                gap: 15px;
            }

            .status-item {
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 0.9rem;
            }

            .status-badge {
                width: 12px;
                height: 12px;
                border-radius: 50%;
            }

            .status-pendiente {
                background-color: var(--netflix-red);
            }

            .status-revision {
                background-color: var(--netflix-yellow);
            }

            .status-resuelto {
                background-color: var(--netflix-green);
            }

            @media (max-width: 768px) {
                body {
                    padding: 15px;
                }

                .chart-container {
                    grid-template-columns: 1fr;
                }

                .stats-grid {
                    grid-template-columns: 1fr;
                }

                .chart-wrapper {
                    height: 250px;
                }

                .page-header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 15px;
                }
            }

            @media (max-width: 480px) {
                .page-title {
                    font-size: 1.5rem;
                }

                .page-title i {
                    font-size: 1.4rem;
                }

                .btn-back {
                    padding: 6px 12px;
                    font-size: 0.9rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="main-container">
            <div class="dashboard-container">
                <div class="page-header">
                    <h1 class="page-title">
                        <i class="fas fa-chart-line"></i> Panel de Reportes
                    </h1>
                    <a href="indexAdmin.jsp" class="btn-back">
                        <i class="fas fa-arrow-left"></i> Volver al Panel
                    </a>
                </div>

                <div class="stats-grid">
                    <div class="stat-card">
                        <h3>Total de Reclamos</h3>
                        <p class="value"><%= total%></p>
                    </div>

                    <div class="stat-card">
                        <h3>Pendientes</h3>
                        <p class="value"><%= pendientes%></p>
                    </div>

                    <div class="stat-card">
                        <h3>En Revisión</h3>
                        <p class="value"><%= revision%></p>
                    </div>

                    <div class="stat-card">
                        <h3>Resueltos</h3>
                        <p class="value"><%= resueltos%></p>
                    </div>
                </div>

                <div class="chart-container">
                    <div class="chart-box">
                        <h3><i class="fas fa-tags"></i> Reclamos por Categoría</h3>
                        <div class="chart-wrapper">
                            <canvas id="categoriaChart"></canvas>
                        </div>
                    </div>

                    <div class="chart-box">
                        <h3><i class="fas fa-chart-pie"></i> Distribución por Estado</h3>
                        <div class="chart-wrapper">
                            <canvas id="estadoChart"></canvas>
                        </div>
                        <ul class="status-list">
                            <li class="status-item">
                                <span class="status-badge status-pendiente"></span>
                                <span>Pendientes</span>
                            </li>
                            <li class="status-item">
                                <span class="status-badge status-revision"></span>
                                <span>En Revisión</span>
                            </li>
                            <li class="status-item">
                                <span class="status-badge status-resuelto"></span>
                                <span>Resueltos</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const categoriaLabels = <%= new Gson().toJson(new ArrayList<>(categorias.keySet()))%>;
            const categoriaData = <%= new Gson().toJson(new ArrayList<>(categorias.values()))%>;

            const estadoLabels = <%= new Gson().toJson(new ArrayList<>(balanceEstados.keySet()))%>;
            const estadoData = <%= new Gson().toJson(new ArrayList<>(balanceEstados.values()))%>;

            const chartOptions = {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            color: '#fff',
                            font: {
                                size: 12
                            }
                        }
                    }
                },
                scales: {
                    x: {
                        ticks: {
                            color: '#fff'
                        },
                        grid: {
                            color: 'rgba(255,255,255,0.1)'
                        }
                    },
                    y: {
                        ticks: {
                            color: '#fff'
                        },
                        grid: {
                            color: 'rgba(255,255,255,0.1)'
                        }
                    }
                }
            };

            new Chart(document.getElementById('categoriaChart'), {
                type: 'bar',
                data: {
                    labels: categoriaLabels,
                    datasets: [{
                            label: 'Cantidad',
                            data: categoriaData,
                            backgroundColor: 'rgba(229, 9, 20, 0.7)',
                            borderColor: 'rgba(229, 9, 20, 1)',
                            borderWidth: 1
                        }]
                },
                options: chartOptions
            });

            new Chart(document.getElementById('estadoChart'), {
                type: 'doughnut',
                data: {
                    labels: estadoLabels,
                    datasets: [{
                            data: estadoData,
                            backgroundColor: [
                                'rgba(229, 9, 20, 0.7)',
                                'rgba(255, 193, 7, 0.7)',
                                'rgba(40, 167, 69, 0.7)'
                            ],
                            borderColor: [
                                'rgba(229, 9, 20, 1)',
                                'rgba(255, 193, 7, 1)',
                                'rgba(40, 167, 69, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    ...chartOptions,
                    cutout: '70%'
                }
            });
        </script>
    </body>
</html>