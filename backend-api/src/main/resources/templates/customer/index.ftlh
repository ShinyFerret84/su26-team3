<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Home</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
</head>
<body>

    <header class="app-header">
        <div class="logo">
            <a href="/">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="/" class="active">Home</a>
            <a href="/customer/browse/1">Browse</a>
            <a href="/customer/myplans/1">My Plans</a>
            <a href="/customer/profile/1">Profile</a>
        </nav>
        <div class="header-actions">
            <a href="/customer/profile/1" class="login-btn-header">Profile</a>
            <a href="/customer/browse/1" class="get-started-btn-header">Get Started</a>
        </div>
    </header>

    <main>
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="hero-content">
                <h1>Discover Amazing Activities in the Triad</h1>
                <p>Find the perfect experience for you and your friends in High Point, Greensboro, and beyond</p>
                <div class="hero-search">
                    <input type="text" placeholder="Search activities... (e.g., wine tasting, hiking, food)">
                    <a href="/customer/browse/1" class="search-btn">Search</a>
                </div>
                <div class="hero-buttons">
                    <a href="/customer/profile/1" class="hero-login-btn">I'm a Customer</a>
                    <a href="/customer/browse/1" class="hero-signup-btn">Browse Events</a>
                </div>
            </div>
        </section>

        <!-- Categories Section -->
        <section class="categories-section">
            <h2>Browse by Category</h2>
            <div class="category-filters">
                <a href="/customer/browse/1" class="filter-chip active">All</a>
                <a href="/customer/browse/1?category=Outdoor" class="filter-chip">Outdoor</a>
                <a href="/customer/browse/1?category=Indoor" class="filter-chip">Indoor</a>
                <a href="/customer/browse/1?category=Food" class="filter-chip">Food & Drink</a>
                <a href="/customer/browse/1?category=Entertainment" class="filter-chip">Entertainment</a>
                <a href="/customer/browse/1?category=Culture" class="filter-chip">Culture</a>
                <a href="/customer/browse/1?category=Sports" class="filter-chip">Sports</a>
            </div>
        </section>

        <!-- Featured Section -->
        <section class="featured-section">
            <div class="section-header">
                <h2>Featured Activities</h2>
                <a href="/customer/browse/1" class="view-all">View All →</a>
            </div>
            <div class="activity-grid">
                <#if events?has_content>
                    <#list events as event>
                        <#if event.featured?? && event.featured == true>
                            <div class="activity-card">
                                <div class="card-image" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                                    <span class="card-badge">Featured</span>
                                </div>
                                <div class="card-body">
                                    <h3>${event.eventName}</h3>
                                    <p class="location">${event.city}, ${event.state}</p>
                                    <div class="card-meta">
                                        <span>${event.date}</span>
                                        <span>${event.startTime} - ${event.endTime}</span>
                                    </div>
                                    <div class="card-footer">
                                        <span class="price">$${event.pricePerPerson!0} <span>/person</span></span>
                                        <a href="/customer/booking/${event.id}?customerId=1" class="view-detail-btn">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </#if>
                    </#list>
                <#else>
                    <p style="color: #a0aec0; text-align: center; padding: 40px 0;">No featured events available. Check back soon!</p>
                </#if>
            </div>
        </section>

        <!-- Popular Activities Section -->
        <section class="more-section">
            <div class="section-header">
                <h2>Popular Activities</h2>
                <a href="/customer/browse/1" class="view-all">View All →</a>
            </div>
            <div class="activity-grid">
                <#if events?has_content>
                    <#list events as event>
                        <#if event.featured?? && event.featured == false>
                            <div class="activity-card">
                                <div class="card-image" style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);">
                                </div>
                                <div class="card-body">
                                    <h3>${event.eventName}</h3>
                                    <p class="location">${event.city}, ${event.state}</p>
                                    <div class="card-meta">
                                        <span>${event.date}</span>
                                        <span>${event.startTime} - ${event.endTime}</span>
                                    </div>
                                    <div class="card-footer">
                                        <span class="price">$${event.pricePerPerson!0} <span>/person</span></span>
                                        <a href="/customer/booking/${event.id}?customerId=1" class="view-detail-btn">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </#if>
                    </#list>
                <#else>
                    <p style="color: #a0aec0; text-align: center; padding: 40px 0;">No popular events available. Check back soon!</p>
                </#if>
            </div>
        </section>
    </main>

    <footer class="app-footer">
        <div class="footer-content">
            <div class="footer-section">
                <h4>Triad Activities</h4>
                <p>Discover the best experiences in the Triad area. From wine tasting to hiking, find your next adventure!</p>
            </div>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <a href="/">Home</a>
                <a href="/customer/browse/1">Browse Activities</a>
                <a href="/customer/myplans/1">My Plans</a>
                <a href="/customer/profile/1">Profile</a>
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