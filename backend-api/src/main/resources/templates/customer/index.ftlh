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
            <a href="/customer/browse">Browse</a>
        </nav>
        <div class="header-actions">
            <a href="/providers/login" class="login-btn-header">Provider Login</a>
            <a href="/customer/login" class="login-btn-header">Customer Login</a>
            <a href="/customer/signup" class="get-started-btn-header">Get Started</a>
        </div>
    </header>

    <main>
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="hero-content">
                <h1>Discover Amazing Activities in the Triad</h1>
                <p>Find the perfect experience for you and your friends in High Point, Greensboro, and beyond</p>
                <form action="/customer/browse" method="get" class="hero-search">
                    <input type="text" name="eventName" placeholder="Search activities... (e.g., wine tasting, hiking, food)">
                    <button type="submit" class="search-btn">
                        Search
                    </button>
                </form>

                <div class="hero-buttons">
                    <a href="/customer/login" class="hero-login-btn">I'm a Customer</a>
                    <a href="/providers/login" class="hero-signup-btn">I'm a Provider</a>
                    <a href="/customer/browse" class="hero-signup-btn">Browse Events</a>
                </div>
            </div>
        </section>

        <!-- Featured Section -->
        <section class="featured-section">
            <div class="section-header">
                <h2>Featured Activities</h2>
                <a href="/customer/browse" class="view-all">View All →</a>
            </div>

            <div class="activity-grid">
                <#if events?? && events?has_content>
                    <#assign featuredCount = 0>

                    <#list events as event>
                        <#if event.featured?? && event.featured>
                            <#assign featuredCount = featuredCount + 1>

                                <div class="activity-card">
                                    <#if event.imageUrl?? && event.imageUrl?has_content>

                                        <div class="card-image" style="background-image:url('${event.imageUrl}');background-size: cover;background-position: center;">
                                            <span class="card-badge">Featured</span>
                                        </div>

                                    <#else>

                                        <div class="card-image" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                                            <span class="card-badge">Featured</span>
                                        </div>

                                    </#if>

                                    <div class="card-body">
                                        <h3>${event.eventName!"Unnamed Event"}</h3>
                                        <p class="location">${event.city!"Location"}, ${event.state!""}</p>
                                        
                                        <div class="card-meta">
                                            <span>${event.formattedDate!event.date!""}</span>
                                            <span>${event.formattedStartTime!event.startTime!""} - ${event.formattedEndTime!event.endTime!""}</span>
                                        </div>

                                        <div class="card-footer">
                                            <span class="price">
                                                <#if event.pricePerPerson??>
                                                    $${event.pricePerPerson?string["#,##0.00"]} <span>/person</span>
                                                <#else>
                                                    Price not set
                                                </#if>
                                            </span>

                                            <a href="/customer/booking/${event.id?c}" class="view-detail-btn">View Details</a>
                                        </div>
                                    </div>
                                </div>

                        </#if>
                            
                    </#list>
                            
                        <#if featuredCount == 0>
                            <p class="empty-message">
                                No featured events available. Check back soon!
                            </p>

                        </#if>

                <#else>
                    <p class="empty-message">
                        No featured events available. Check back soon!
                    </p>
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
                <#if events?? && events?has_content>
                    <#assign popularCount = 0>

                    <#list events as event>

                        <#if (!event.featured?? || !event.featured) && popularCount < 6>

                            <#assign popularCount = popularCount + 1>

                            <div class="activity-card">
                                <#if event.imageUrl?? && event.imageUrl?has_content>

                                    <div class="card-image" style="background-image:url('${event.imageUrl}'); 
                                        background-size: cover; background-position: center; ">
                                    </div>

                                <#else>

                                    <div class="card-image" style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);">
                                    </div>

                                </#if>

                                    <div class="card-body">

                                        <h3>${event.eventName!"Unnamed Event"}</h3>

                                        <p class="location">${event.city!"Location"}, ${event.state!""}</p>

                                        <div class="card-meta">
                                            <span>${event.formattedDate!event.date!""}</span>
                                            <span>${event.formattedStartTime!event.startTime!""} - ${event.formattedEndTime!event.endTime!""}</span>
                                        </div>

                                        <div class="card-footer">
                                            <span class="price">
                                                <#if event.pricePerPerson??>
                                                    $${event.pricePerPerson?string["#,##0.00"]} <span>/person</span>

                                                <#else>
                                                    Price not set
                                                </#if>

                                            </span>

                                            <a href="/customer/booking/${event.id?c}" class="view-detail-btn">View Details</a>
                                        </div>

                                    </div>

                            </div>

                        </#if>

                    </#list>

                    <#if popularCount == 0>

                        <p class="empty-message">
                            No popular events available. Check back soon!
                        </p>

                    </#if>

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
                <a href="/customer/browse">Browse Activities</a>
                <a href="/providers/login"> Provider Login </a>
                <a href="/customer/login">Customer Login</a>
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