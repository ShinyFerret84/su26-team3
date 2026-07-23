<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Provider Metrics</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="/provider.css?v=3">
</head>

<body>

    <!-- Navigation Bar -->
    <header class="app-header">
        <div class="logo">
            <a href="/providers/${provider.id?c}"> Triad<span>Activities</span></a>
        </div>

        <nav class="main-nav">
            <a href="/providers/${provider.id?c}" >Dashboard</a> 
            <a href="/providers/${provider.id?c}/edit">Profile</a>
            <a href="/providers/${provider.id?c}/events/new">Create Event</a>
            <a href="/providers/${provider.id?c}/metrics" class="active">Metrics</a>
        </nav>

    </header>

    <main class="metrics-page">
        <div class="profile-page">
            <div class="page-header">
                <h1>Business Metrics</h1>

                <p>Review attendance, revenue, events, and customer feedback.</p>
            </div>

            <section class="metrics-grid">
                <div class="metric-card">
                    <span class="metric-icon">📅</span>

                    <span class="metric-label">
                        Events Hosted
                    </span>

                    <span class="metric-value">
                        ${statistics.totalEventsHosted()!0}
                    </span>
                </div>

                <div class="metric-card">
                    <span class="metric-icon">👥</span>

                    <span class="metric-label">
                        Total Attendees
                    </span>

                    <span class="metric-value">
                        ${statistics.totalAttendees()!0}
                    </span>
                </div>

                <div class="metric-card">
                    <span class="metric-icon">⭐</span>
                    
                    <span class="metric-label">
                        Average Rating
                    </span>

                    <span class="metric-value">
                        <#if statistics.averageRating()??>
                            ${statistics.averageRating()?string["0.0"]} / 5
                        <#else>
                            No ratings
                        </#if>
                    </span>
                </div>

                <div class="metric-card">
                    <span class="metric-icon">💬</span>

                    <span class="metric-label">
                        Total Reviews
                    </span>

                    <span class="metric-value">
                        ${statistics.totalReviews()!0}
                    </span>
                </div>

                <div class="metric-card">
                    <span class="metric-icon">💰</span>

                    <span class="metric-label">
                        Total Revenue
                    </span>

                    <span class="metric-value">
                        $${statistics.totalRevenue()!0?string["#,##0.00"]}
                    </span>
                </div>

            </section>

            <div class="form-actions">
                <a href="/providers/${provider.id?c}" class="btn-secondary">
                    Back to Dashboard
                </a>
            </div>
            
        </div>
    </main>

    <footer class="app-footer">

    <div class="footer-content">

        <div class="footer-section">
            <h4>Triad Activities</h4>
            <p>Discover the best experiences in the Triad area.</p>
        </div>

        <div class="footer-section">
            <h4>Quick Links</h4>
            <a href="/providers/${provider.id?c}">Dashboard</a>
            <a href="/providers/${provider.id?c}/edit">Profile</a>
            <a href="/providers/${provider.id?c}/events/new">Create Event</a>
            <a href="/providers/${provider.id?c}/metrics">Metrics</a>
        </div>

        <div class="footer-section">
            <h4>Location</h4>
            <p>Winston-Salem, NC</p>
        </div>

    </div>

    <div class="footer-bottom">
        <p>&copy; 2025 Triad Activities. All rights reserved.</p>
    </div>

</footer>

</body>
</html>