<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Browse Activities - Triad Activities</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="/browse.css">
</head>
<body>

    <header class="app-header">
        <div class="logo">
            <a href="index.html">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="index.html">Home</a>
            <a href="/events/browse/${customer.id}" class="active">Browse</a>
            <a href="myPlans.html">My Plans</a>
            <a href="/customer/profile/${customer.id}">Profile</a>
        </nav>
        <div class="header-actions">
            <!-- Shows the customer's location, defaults to Winston-Salem, NC if not set -->
            <span class="location">${customer.location!"Winston-Salem, NC"}</span>
        </div>
    </header>

    <main>
        <section class="browse-header">
            <h1>All Activities</h1>
            <p>Browse through all available activities in the Triad area</p>
        </section>

        <!-- ===== FILTER SECTION ===== -->
        <section class="filter-section">
            <div class="filter-row">
                <div class="filter-group">
                    <label for="categoryFilter">Category</label>
                    <select id="categoryFilter">
                        <option value="all">All Categories</option>
                        <option value="Outdoor">Outdoor</option>
                        <option value="Food">Food & Drink</option>
                        <option value="Entertainment">Entertainment</option>
                        <option value="Culture">Culture</option>
                        <option value="Sports">Sports</option>
                    </select>
                </div>

                <div class="filter-group">
                    <label for="sortFilter">Sort By</label>
                    <select id="sortFilter">
                        <option value="featured">Featured</option>
                        <option value="price-low">Price: Low to High</option>
                        <option value="price-high">Price: High to Low</option>
                        <option value="date">Date: Soonest</option>
                    </select>
                </div>

                <div class="filter-group">
                    <label for="dateFilter">Date</label>
                    <input type="date" id="dateFilter">
                </div>

                <div class="filter-group">
                    <label>Price Range</label>
                    <div class="price-range-display">
                        <span>$0</span>
                        <input type="range" min="0" max="100" value="50">
                        <span>$100+</span>
                    </div>
                </div>
            </div>

            <div class="filter-search">
                <input type="text" placeholder="Search activities by name, location, or keyword...">
                <button class="search-btn-small">Search</button>
            </div>
        </section>

        <!-- RESULTS SECTION  -->
        <section class="results-section">
            <div class="section-header">
                <h2 id="resultsCount">${events?size} Activities Found</h2>
                <span class="result-count">Showing 1-${events?size} of ${events?size}</span>
            </div>

            <!-- EVENTS GRID  -->
            <div class="activity-grid">
                <#if events?has_content>
                    <#list events as event>
                        <div class="activity-card">
                            <div class="card-image" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                                <#if event.featured?? && event.featured == true>
                                    <span class="card-badge">Featured</span>
                                </#if>
                                <#if event.category??>
                                    <span class="card-badge" style="right: 10px; top: 40px;">${event.category}</span>
                                </#if>
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
                                    <a href="booking.html?id=${event.id}" class="view-detail-btn">View Details</a>
                                </div>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <p class="no-events">No events found matching your interests. Try adding more interests!</p>
                </#if>
            </div>

            <div class="pagination">
                <a href="#" class="disabled">Previous</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">Next →</a>
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
                <a href="index.html">Home</a>
                <a href="/events/browse/${customer.id}">Browse Activities</a>
                <a href="myPlans.html">My Plans</a>
                <a href="/customer/profile/${customer.id}">Profile</a>
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
