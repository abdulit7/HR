<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Attendance_DashBoard, App_Web_5bk21qbu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Modern Dashboard Styles -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&family=Space+Mono:wght@400;700&display=swap');
        
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --warning-gradient: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a6f 100%);
            --info-gradient: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
            --dark-gradient: linear-gradient(135deg, #29323c 0%, #485563 100%);
            
            --bg-primary: #f8f9fe;
            --bg-card: #ffffff;
            --text-primary: #1a1f36;
            --text-secondary: #697386;
            --border-color: #e3e8ee;
            --shadow-sm: 0 2px 4px rgba(0,0,0,0.04);
            --shadow-md: 0 4px 12px rgba(0,0,0,0.08);
            --shadow-lg: 0 8px 24px rgba(0,0,0,0.12);
            --shadow-xl: 0 16px 48px rgba(0,0,0,0.16);
            
            --radius-sm: 8px;
            --radius-md: 12px;
            --radius-lg: 16px;
            --radius-xl: 24px;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Outfit', sans-serif;
            background: var(--bg-primary);
            color: var(--text-primary);
            line-height: 1.6;
        }
        
        .dashboard-container {
            max-width: 1600px;
            margin: 0 auto;
            padding: 2rem;
            animation: fadeIn 0.6s ease-out;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Header Section */
        .dashboard-header {
            margin-bottom: 3rem;
            position: relative;
            overflow: hidden;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 2.5rem;
            border-radius: var(--radius-xl);
            box-shadow: var(--shadow-xl);
        }
        
        .dashboard-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><defs><pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse"><path d="M 40 0 L 0 0 0 40" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="1"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
            opacity: 0.3;
        }
        
        .dashboard-header h1 {
            color: white;
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
            text-shadow: 0 2px 12px rgba(0,0,0,0.2);
        }
        
        .dashboard-subtitle {
            color: rgba(255,255,255,0.9);
            font-size: 1.1rem;
            font-weight: 400;
            position: relative;
            z-index: 1;
            font-family: 'Space Mono', monospace;
        }
        
        .time-badge {
            display: inline-block;
            background: rgba(255,255,255,0.2);
            backdrop-filter: blur(10px);
            padding: 0.5rem 1.25rem;
            border-radius: 50px;
            color: white;
            font-size: 0.9rem;
            font-weight: 600;
            margin-top: 1rem;
            border: 1px solid rgba(255,255,255,0.3);
        }
        
        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }
        
        .stat-card {
            background: var(--bg-card);
            border-radius: var(--radius-lg);
            padding: 2rem;
            box-shadow: var(--shadow-md);
            position: relative;
            overflow: hidden;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border: 1px solid var(--border-color);
        }
        
        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient);
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-xl);
        }
        
        .stat-card:hover::before {
            transform: scaleX(1);
        }
        
        .stat-card.primary { --gradient: var(--primary-gradient); }
        .stat-card.success { --gradient: var(--success-gradient); }
        .stat-card.warning { --gradient: var(--warning-gradient); }
        .stat-card.danger { --gradient: var(--danger-gradient); }
        .stat-card.info { --gradient: var(--info-gradient); }
        
        .stat-icon {
            width: 64px;
            height: 64px;
            border-radius: var(--radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.25rem;
            background: var(--gradient);
            box-shadow: var(--shadow-md);
        }
        
        .stat-icon i {
            font-size: 1.75rem;
            color: white;
        }
        
        .stat-value {
            font-size: 2.5rem;
            font-weight: 800;
            line-height: 1;
            margin-bottom: 0.5rem;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .stat-label {
            color: var(--text-secondary);
            font-size: 0.95rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .stat-change {
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
            margin-top: 0.75rem;
            padding: 0.25rem 0.75rem;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
        }
        
        .stat-change.positive {
            background: rgba(76, 217, 100, 0.1);
            color: #2ecc71;
        }
        
        .stat-change.negative {
            background: rgba(231, 76, 60, 0.1);
            color: #e74c3c;
        }
        
        /* Chart Section */
        .chart-section {
            background: var(--bg-card);
            border-radius: var(--radius-lg);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-md);
            border: 1px solid var(--border-color);
        }
        
        .chart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--border-color);
        }
        
        .chart-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-primary);
        }
        
        .chart-filters {
            display: flex;
            gap: 0.75rem;
        }
        
        .filter-btn {
            padding: 0.5rem 1.25rem;
            border-radius: 50px;
            border: 1px solid var(--border-color);
            background: white;
            color: var(--text-secondary);
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        
        .filter-btn:hover,
        .filter-btn.active {
            background: var(--primary-gradient);
            color: white;
            border-color: transparent;
        }
        
        /* Data Tables */
        .data-table-container {
            background: var(--bg-card);
            border-radius: var(--radius-lg);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-md);
            border: 1px solid var(--border-color);
            overflow: hidden;
        }
        
        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        
        .table-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-primary);
        }
        
        .table-actions {
            display: flex;
            gap: 0.75rem;
        }
        
        .action-btn {
            padding: 0.625rem 1.25rem;
            border-radius: var(--radius-sm);
            border: none;
            background: var(--primary-gradient);
            color: white;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }
        
        .action-btn.secondary {
            background: white;
            border: 1px solid var(--border-color);
            color: var(--text-primary);
        }
        
        .modern-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .modern-table thead {
            background: linear-gradient(135deg, #f8f9fe 0%, #f0f2f8 100%);
        }
        
        .modern-table th {
            padding: 1rem 1.25rem;
            text-align: left;
            font-weight: 700;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: var(--text-secondary);
            border-bottom: 2px solid var(--border-color);
            white-space: nowrap;
        }
        
        .modern-table td {
            padding: 1.25rem;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-primary);
            font-size: 0.95rem;
        }
        
        .modern-table tbody tr {
            transition: all 0.2s ease;
            background: white;
        }
        
        .modern-table tbody tr:hover {
            background: linear-gradient(90deg, rgba(102, 126, 234, 0.05) 0%, rgba(118, 75, 162, 0.05) 100%);
            transform: scale(1.01);
        }
        
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.375rem 0.875rem;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
        }
        
        .status-badge.present {
            background: rgba(76, 217, 100, 0.15);
            color: #27ae60;
        }
        
        .status-badge.absent {
            background: rgba(231, 76, 60, 0.15);
            color: #c0392b;
        }
        
        .status-badge.late {
            background: rgba(243, 156, 18, 0.15);
            color: #d68910;
        }
        
        .status-badge.ontime {
            background: rgba(52, 152, 219, 0.15);
            color: #2980b9;
        }
        
        .status-badge.leave {
            background: rgba(155, 89, 182, 0.15);
            color: #8e44ad;
        }
        
        .status-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: currentColor;
        }
        
        /* Progress Bars */
        .progress-bar-wrapper {
            margin-top: 1rem;
        }
        
        .progress-label {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
            font-size: 0.85rem;
            color: var(--text-secondary);
            font-weight: 600;
        }
        
        .progress-bar {
            height: 8px;
            background: #e9ecef;
            border-radius: 50px;
            overflow: hidden;
            position: relative;
        }
        
        .progress-fill {
            height: 100%;
            background: var(--gradient);
            border-radius: 50px;
            transition: width 1s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }
        
        .progress-fill::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
            animation: shimmer 2s infinite;
        }
        
        @keyframes shimmer {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }
        
        /* Responsive Grid */
        .grid-2 {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }
        
        /* Employee Photo */
        .employee-photo {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid white;
            box-shadow: var(--shadow-sm);
        }
        
        .employee-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .employee-details {
            display: flex;
            flex-direction: column;
        }
        
        .employee-name {
            font-weight: 600;
            color: var(--text-primary);
        }
        
        .employee-dept {
            font-size: 0.85rem;
            color: var(--text-secondary);
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 1rem;
            }
            
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .grid-2 {
                grid-template-columns: 1fr;
            }
            
            .chart-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .table-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .modern-table {
                font-size: 0.85rem;
            }
            
            .modern-table th,
            .modern-table td {
                padding: 0.75rem;
            }
        }
        
        /* Loading Animation */
        .loading-skeleton {
            background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
            background-size: 200% 100%;
            animation: loading 1.5s ease-in-out infinite;
            border-radius: var(--radius-sm);
        }
        
        @keyframes loading {
            0% { background-position: 200% 0; }
            100% { background-position: -200% 0; }
        }
        
        /* Chart Container */
        .chart-container {
            position: relative;
            height: 400px;
            margin-top: 1rem;
        }
        
        /* Quick Stats Mini Cards */
        .quick-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .quick-stat-card {
            background: var(--bg-card);
            border-radius: var(--radius-md);
            padding: 1.25rem;
            border-left: 4px solid;
            box-shadow: var(--shadow-sm);
            transition: all 0.2s ease;
        }
        
        .quick-stat-card:hover {
            transform: translateX(4px);
            box-shadow: var(--shadow-md);
        }
        
        .quick-stat-card.primary { border-color: #667eea; }
        .quick-stat-card.success { border-color: #4facfe; }
        .quick-stat-card.warning { border-color: #fa709a; }
        .quick-stat-card.danger { border-color: #ff6b6b; }
        
        .quick-stat-value {
            font-size: 1.75rem;
            font-weight: 800;
            margin-bottom: 0.25rem;
        }
        
        .quick-stat-label {
            font-size: 0.8rem;
            color: var(--text-secondary);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
    </style>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            
            <div class="dashboard-container">
                <!-- Dashboard Header -->
                <div class="dashboard-header">
                    <h1>📊 Attendance Dashboard</h1>
                    <p class="dashboard-subtitle">Real-time employee attendance monitoring & analytics</p>
                    <span class="time-badge" id="currentTime">🕐 Loading...</span>
                </div>

                <!-- Main Statistics Cards -->
                <div id="divSum" runat="server" visible="false">
                    <h3 style="margin-bottom: 1rem; color: var(--text-secondary); font-weight: 600;">📈 Today's Overview</h3>
                    <div class="stats-grid">
                        <div class="stat-card primary">
                            <div class="stat-icon">
                                <i class="fa fa-users"></i>
                            </div>
                            <div class="stat-value">
                                <asp:Label ID="lblTotalEmp" runat="server">0</asp:Label>
                            </div>
                            <div class="stat-label">Total Employees</div>
                            <div class="progress-bar-wrapper">
                                <div class="progress-bar">
                                    <div class="progress-fill" style="--gradient: var(--primary-gradient); width: 100%;"></div>
                                </div>
                            </div>
                        </div>

                        <div class="stat-card success">
                            <div class="stat-icon">
                                <i class="fa fa-check-circle"></i>
                            </div>
                            <div class="stat-value">
                                <asp:Label ID="lblPresent" runat="server">0</asp:Label>
                            </div>
                            <div class="stat-label">Present Today</div>
                            <span class="stat-change positive">
                                <i class="fa fa-arrow-up"></i> Active
                            </span>
                        </div>

                        <div class="stat-card warning">
                            <div class="stat-icon">
                                <i class="fa fa-exclamation-triangle"></i>
                            </div>
                            <div class="stat-value">
                                <asp:Label ID="lblAbsent" runat="server">0</asp:Label>
                            </div>
                            <div class="stat-label">Absent Today</div>
                            <div class="progress-bar-wrapper">
                                <div class="progress-label">
                                    <span>Absence Rate</span>
                                    <span id="absenceRate">0%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="--gradient: var(--warning-gradient);" id="absenceBar"></div>
                                </div>
                            </div>
                        </div>

                        <div class="stat-card danger">
                            <div class="stat-icon">
                                <i class="fa fa-clock-o"></i>
                            </div>
                            <div class="stat-value">
                                <asp:Label ID="lblLate" runat="server">0</asp:Label>
                            </div>
                            <div class="stat-label">Late Today</div>
                            <span class="stat-change negative">
                                <i class="fa fa-arrow-down"></i> Needs Attention
                            </span>
                        </div>

                        <div class="stat-card info">
                            <div class="stat-icon">
                                <i class="fa fa-thumbs-up"></i>
                            </div>
                            <div class="stat-value">
                                <asp:Label ID="lblOnTime" runat="server">0</asp:Label>
                            </div>
                            <div class="stat-label">On Time Today</div>
                            <div class="progress-bar-wrapper">
                                <div class="progress-label">
                                    <span>Punctuality Rate</span>
                                    <span id="punctualityRate">0%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="--gradient: var(--info-gradient);" id="punctualityBar"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Shift-wise Statistics -->
                <div id="divSum6AM" runat="server" visible="false">
                    <h3 style="margin-bottom: 1rem; color: var(--text-secondary); font-weight: 600;">🌅 Morning Shift (6:00 AM - 5:00 PM)</h3>
                    <div class="quick-stats">
                        <div class="quick-stat-card primary">
                            <div class="quick-stat-value"><asp:Label ID="Label2" runat="server">0</asp:Label></div>
                            <div class="quick-stat-label">Total</div>
                        </div>
                        <div class="quick-stat-card success">
                            <div class="quick-stat-value"><asp:Label ID="Label3" runat="server">0</asp:Label></div>
                            <div class="quick-stat-label">Present</div>
                        </div>
                        <div class="quick-stat-card warning">
                            <div class="quick-stat-value"><asp:Label ID="Label4" runat="server">0</asp:Label></div>
                            <div class="quick-stat-label">Absent</div>
                        </div>
                        <div class="quick-stat-card danger">
                            <div class="quick-stat-value"><asp:Label ID="Label5" runat="server">0</asp:Label></div>
                            <div class="quick-stat-label">Late</div>
                        </div>
                        <div class="quick-stat-card primary">
                            <div class="quick-stat-value"><asp:Label ID="Label6" runat="server">0</asp:Label></div>
                            <div class="quick-stat-label">On Time</div>
                        </div>
                    </div>
                </div>

                <div id="divSum6PM" runat="server" visible="false">
                    <h3 style="margin-bottom: 1rem; color: var(--text-secondary); font-weight: 600;">🌙 Evening Shift (5:00 PM - 6:00 AM)</h3>
                    <div class="quick-stats">
                        <div class="quick-stat-card primary">
                            <div class="quick-stat-value"><asp:Label ID="Label7" runat="server">0</asp:Label></div>
                            <div class="quick-stat-label">Total</div>
                        </div>
                        <div class="quick-stat-card success">
                            <div class="quick-stat-value"><asp:Label ID="Label8" runat="server">0</asp:Label></div>
                            <div class="quick-stat-label">Present</div>
                        </div>
                        <div class="quick-stat-card warning">
                            <div class="quick-stat-value"><asp:Label ID="Label9" runat="server">0</asp:Label></div>
                            <div class="quick-stat-label">Absent</div>
                        </div>
                        <div class="quick-stat-card danger">
                            <div class="quick-stat-value"><asp:Label ID="Label10" runat="server">0</asp:Label></div>
                            <div class="quick-stat-label">Late</div>
                        </div>
                        <div class="quick-stat-card primary">
                            <div class="quick-stat-value"><asp:Label ID="Label11" runat="server">0</asp:Label></div>
                            <div class="quick-stat-label">On Time</div>
                        </div>
                    </div>
                </div>

                <!-- Charts Grid -->
                <div class="grid-2">
                    <!-- Attendance Trend Chart -->
                    <div class="chart-section">
                        <div class="chart-header">
                            <h3 class="chart-title">📊 Attendance Distribution</h3>
                           
                        </div>
                        <div class="chart-container">
                            <canvas id="attendanceChart"></canvas>
                        </div>
                    </div>

                    <!-- Department Comparison Chart -->
                    <div class="chart-section">
                        <div class="chart-header">
                            <h3 class="chart-title">🏢 Department Comparison</h3>
                        </div>
                        <div class="chart-container">
                            <canvas id="departmentChart"></canvas>
                        </div>
                    </div>
                </div>

                <!-- New Hires Report -->
                <div id="div2" runat="server" class="data-table-container">
                    <div class="table-header">
                        <h3 class="table-title">🎉 New Hired Employees (Last 15 Days)</h3>
                        
                    </div>
                    <asp:Panel ID="Panel4" runat="server" Width="100%" ScrollBars="Horizontal">
                        <asp:GridView ID="grdNewhiredemployees" CssClass="modern-table" runat="server" GridLines="None" AutoGenerateColumns="true">
                            <EmptyDataTemplate>
                                <div style="text-align: center; padding: 3rem; color: var(--text-secondary);">
                                    <i class="fa fa-inbox" style="font-size: 3rem; margin-bottom: 1rem; opacity: 0.3;"></i>
                                    <p>No new employees in the last 15 days</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </asp:Panel>
                </div>

                <!-- Department Summary -->
                <div id="divSumDept" runat="server" visible="false" class="data-table-container">
                    <div class="table-header">
                        <h3 class="table-title">📋 Attendance Summary Report (Today)</h3>
                        
                    </div>
                    <asp:Panel ID="Panel1" runat="server" Width="100%" ScrollBars="Horizontal">
                        <asp:GridView ID="GridView1" CssClass="modern-table" runat="server" GridLines="None" AutoGenerateColumns="true">
                            <EmptyDataTemplate>
                                <div style="text-align: center; padding: 3rem; color: var(--text-secondary);">
                                    <i class="fa fa-database" style="font-size: 3rem; margin-bottom: 1rem; opacity: 0.3;"></i>
                                    <p>No attendance data available</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </asp:Panel>
                </div>

                <!-- Shift-wise Summary -->
                <div id="div1" runat="server" class="data-table-container">
                    <div class="table-header">
                        <h3 class="table-title">⏰ Shift-wise Attendance Summary</h3>
                        
                    </div>
                    <asp:Panel ID="Panel3" runat="server" Width="100%" ScrollBars="Horizontal">
                        <asp:GridView ID="grdShiftWise" CssClass="modern-table" runat="server" GridLines="None" AutoGenerateColumns="true">
                            <EmptyDataTemplate>
                                <div style="text-align: center; padding: 3rem; color: var(--text-secondary);">
                                    <i class="fa fa-calendar-times-o" style="font-size: 3rem; margin-bottom: 1rem; opacity: 0.3;"></i>
                                    <p>No shift data available</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </asp:Panel>
                </div>

                <!-- Employee Details (for non-CEO/HR users) -->
                <div id="divFilterDate" runat="server" visible="false" class="data-table-container">
                    <div class="table-header">
                        <h3 class="table-title">📅 Select Date Range</h3>
                    </div>
                    <div style="display: flex; gap: 1rem; align-items: center; flex-wrap: wrap;">
                        <div style="flex: 1; min-width: 200px;">
                            <label style="display: block; margin-bottom: 0.5rem; color: var(--text-secondary); font-weight: 600;">From Date</label>
                            <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtFromDate" runat="server" style="padding: 0.75rem; border-radius: var(--radius-sm); border: 1px solid var(--border-color); width: 100%;"></asp:TextBox>
                        </div>
                        <div style="flex: 1; min-width: 200px;">
                            <label style="display: block; margin-bottom: 0.5rem; color: var(--text-secondary); font-weight: 600;">To Date</label>
                            <asp:TextBox CssClass="form-control datepicker-autoclose" autocomplete="off" ID="txtToDate" runat="server" style="padding: 0.75rem; border-radius: var(--radius-sm); border: 1px solid var(--border-color); width: 100%;"></asp:TextBox>
                        </div>
                        <div style="align-self: flex-end;">
                            <asp:Button ID="btnsearch" CssClass="action-btn" runat="server" Text="Show Report" OnClick="btnsearch_Click" />
                        </div>
                    </div>
                </div>

                <div id="divEmpdetail" runat="server" visible="false" class="data-table-container">
                    <div class="table-header">
                        <h3 class="table-title">👤 My Attendance Details</h3>
                        <div class="table-actions">
                            <button class="action-btn secondary">
                                <i class="fa fa-download"></i> Download Report
                            </button>
                        </div>
                    </div>
                    <asp:Panel ID="Panel2" runat="server" Width="100%" ScrollBars="Horizontal">
                        <asp:GridView ID="GRDDashBoard" CssClass="modern-table" runat="server" AutoGenerateColumns="false" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Employee">
                                    <ItemTemplate>
                                        <div class="employee-info">
                                            <img src="./ShowSmallImage.ashx?id='<%#Eval("UserID")%>'" alt="user" class="employee-photo" />
                                            <div class="employee-details">
                                                <span class="employee-name"><%#Eval("NAME") %></span>
                                                <span class="employee-dept"><%#Eval("DEPARTMENT") %></span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Number of Late Comming" HeaderText="Late Coming" />
                                <asp:BoundField DataField="Number of Early Going" HeaderText="Early Going" />
                                <asp:BoundField DataField="Number of Absent Days" HeaderText="Absent Days" />
                                <asp:BoundField DataField="Number of Missing Times" HeaderText="Missing Times" />
                                <asp:BoundField DataField="Number of Leaves Applied" HeaderText="Leaves Applied" />
                                <asp:BoundField DataField="Total Days to be Deducted" HeaderText="Days Deducted" />
                                <asp:BoundField DataField="Number Of Pending Approvals" HeaderText="Pending Approvals" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div style="text-align: center; padding: 3rem; color: var(--text-secondary);">
                                    <i class="fa fa-user-times" style="font-size: 3rem; margin-bottom: 1rem; opacity: 0.3;"></i>
                                    <p>No attendance records found for selected period</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </asp:Panel>
                </div>
            </div>

            <!-- Chart.js Library -->
            <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
            
            <script>
                // Update current time
                function updateTime() {
                    const now = new Date();
                    const options = {
                        weekday: 'long',
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit'
                    };
                    document.getElementById('currentTime').textContent = '🕐 ' + now.toLocaleDateString('en-US', options);
                }
                updateTime();
                setInterval(updateTime, 1000);

                // Calculate and display percentages
                window.addEventListener('load', function () {
                    const total = parseInt(document.getElementById('<%= lblTotalEmp.ClientID %>').textContent) || 1;
                    const absent = parseInt(document.getElementById('<%= lblAbsent.ClientID %>').textContent) || 0;
                    const ontime = parseInt(document.getElementById('<%= lblOnTime.ClientID %>').textContent) || 0;
                    
                    const absencePercentage = Math.round((absent / total) * 100);
                    const punctualityPercentage = Math.round((ontime / total) * 100);
                    
                    if (document.getElementById('absenceRate')) {
                        document.getElementById('absenceRate').textContent = absencePercentage + '%';
                        document.getElementById('absenceBar').style.width = absencePercentage + '%';
                    }
                    
                    if (document.getElementById('punctualityRate')) {
                        document.getElementById('punctualityRate').textContent = punctualityPercentage + '%';
                        document.getElementById('punctualityBar').style.width = punctualityPercentage + '%';
                    }

                    // Initialize Charts
                    initializeCharts();
                });

                function initializeCharts() {
                    // Attendance Distribution Doughnut Chart
                    const attendanceCtx = document.getElementById('attendanceChart');
                    if (attendanceCtx) {
                        const present = parseInt(document.getElementById('<%= lblPresent.ClientID %>').textContent) || 0;
                        const absent = parseInt(document.getElementById('<%= lblAbsent.ClientID %>').textContent) || 0;
                        const late = parseInt(document.getElementById('<%= lblLate.ClientID %>').textContent) || 0;
                        const ontime = parseInt(document.getElementById('<%= lblOnTime.ClientID %>').textContent) || 0;

                        new Chart(attendanceCtx, {
                            type: 'doughnut',
                            data: {
                                labels: ['On Time', 'Late', 'Absent'],
                                datasets: [{
                                    data: [ontime, late, absent],
                                    backgroundColor: [
                                        'rgba(79, 172, 254, 0.8)',
                                        'rgba(250, 112, 154, 0.8)',
                                        'rgba(255, 107, 107, 0.8)'
                                    ],
                                    borderColor: [
                                        'rgba(79, 172, 254, 1)',
                                        'rgba(250, 112, 154, 1)',
                                        'rgba(255, 107, 107, 1)'
                                    ],
                                    borderWidth: 2
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                    legend: {
                                        position: 'bottom',
                                        labels: {
                                            padding: 20,
                                            font: {
                                                size: 14,
                                                family: 'Outfit'
                                            }
                                        }
                                    },
                                    tooltip: {
                                        backgroundColor: 'rgba(0, 0, 0, 0.8)',
                                        padding: 12,
                                        titleFont: {
                                            size: 14,
                                            family: 'Outfit'
                                        },
                                        bodyFont: {
                                            size: 13,
                                            family: 'Outfit'
                                        }
                                    }
                                }
                            }
                        });
                    }

                    // Department Comparison Bar Chart
                    const deptCtx = document.getElementById('departmentChart');
                    if (deptCtx) {
                        new Chart(deptCtx, {
                            type: 'bar',
                            data: {
                                labels: ['HR', 'IT', 'Sales', 'Operations', 'Finance'],
                                datasets: [{
                                    label: 'Present',
                                    data: [12, 19, 15, 17, 14],
                                    backgroundColor: 'rgba(79, 172, 254, 0.8)',
                                    borderColor: 'rgba(79, 172, 254, 1)',
                                    borderWidth: 2,
                                    borderRadius: 8
                                }, {
                                    label: 'Absent',
                                    data: [3, 2, 4, 2, 3],
                                    backgroundColor: 'rgba(255, 107, 107, 0.8)',
                                    borderColor: 'rgba(255, 107, 107, 1)',
                                    borderWidth: 2,
                                    borderRadius: 8
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                    legend: {
                                        position: 'top',
                                        labels: {
                                            padding: 15,
                                            font: {
                                                size: 14,
                                                family: 'Outfit'
                                            }
                                        }
                                    }
                                },
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        grid: {
                                            color: 'rgba(0, 0, 0, 0.05)'
                                        }
                                    },
                                    x: {
                                        grid: {
                                            display: false
                                        }
                                    }
                                }
                            }
                        });
                    }
                }

                // Filter button interactions
                document.querySelectorAll('.filter-btn').forEach(btn => {
                    btn.addEventListener('click', function () {
                        document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
                        this.classList.add('active');
                    });
                });
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
