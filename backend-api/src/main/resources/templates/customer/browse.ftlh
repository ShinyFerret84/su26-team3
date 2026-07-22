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
            <a href="#">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="#">Home</a>
            <a href="/customer/browse/${customer.id?c}" class="active">Browse</a>
            <a href="#">My Plans</a>
            <a href="/customer/profile/${customer.id?c}">Profile</a>
        </nav>
        <div class="header-actions">
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
                        <span id="priceMinDisplay">$0</span>
                        <input type="range" min="0" max="100" value="50" id="priceRange">
                        <span id="priceMaxDisplay">$100+</span>
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

            <div class="activity-grid">
                <#if events?has_content>
                    <#list events as event>
                        <div class="activity-card">
                            <#if event.imageUrl??&& event.imageUrl?has_content>
                                <div
                                    class="card-image"
                                    style="
                                        background-image:
                                            url('${event.imageUrl}');
                                        background-size: cover;
                                        background-position: center;
                                    ">

                                    <#if event.featured??
                                        && event.featured>

                                        <span class="card-badge">
                                            Featured
                                        </span>

                                    </#if>
                                </div>
                            <#else>
                                            <div
                                    class="card-image" style="background:linear-gradient(
                                                135deg, #667eea 0%, #764ba2 100%);">

                                    <#if event.featured??
                                        && event.featured>

                                        <span class="card-badge">Featured</span>

                                    </#if>

                                </div>

                            </#if>
                                <div class="card-body">
                                    <h3>${event.eventName}</h3>
                                    <p class="location"> ${event.city}, ${event.state}</p>
                                    <div class="card-meta">
                                        <span>${event.date}</span>
                                        <span>${event.startTime}- ${event.endTime}</span>
                                    </div>
                                    <div class="card-footer">
                                        <span class="price">$<#if event.pricePerPerson??>
                                                ${event.pricePerPerson?string["0.00"]}
                                                <span>/person</span>
                                            <#else>
                                                Contact provider
                                            </#if>
                                        </span>
                                        <a href="booking.html?id=1" class="view-detail-btn">View Details</a>
                                    </div>
                                </div>
                        
                        </div>
                    </#list>
                <#else>

                    <p class="no-events">
                        No events are currently available.
                    </p>

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
                <a href="#">Home</a>
                <a href="/customer/browse/${customer.id?c}">Browse Activities</a>
                <a href="#">My Plans</a>
                <a href="/customer/profile/${customer.id?c}">Profile</a>
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

    // JAVASCRIPT  All filters work
    <script>
        // BROWSE PAGE Frontend JavaScript (US-2)
        // Search works, Sort works, Price filter works, Clear Filters works

        const customerId = ${customer.id?c};

        // Get elements
        const searchInput = document.querySelector('.filter-search input');
        const searchBtn = document.querySelector('.search-btn-small');
        const categoryFilter = document.getElementById('categoryFilter');
        const sortFilter = document.getElementById('sortFilter');
        const dateFilter = document.getElementById('dateFilter');
        const priceRange = document.getElementById('priceRange');
        const priceMinDisplay = document.getElementById('priceMinDisplay');
        const priceMaxDisplay = document.getElementById('priceMaxDisplay');

        // PRICE RANGE Update display when slider moves
        if (priceRange && priceMinDisplay) {
            priceRange.addEventListener('input', function() {
                priceMinDisplay.textContent = '$' + this.value;
            });
        }

        // APPLY FILTERS Reloads page with filter parameters
        function applyFilters() {
            const search = searchInput ? searchInput.value.trim() : '';
            const category = categoryFilter ? categoryFilter.value : '';
            const sort = sortFilter ? sortFilter.value : '';
            const date = dateFilter ? dateFilter.value : '';
            const price = priceRange ? priceRange.value : '';

            let url = '/customer/browse/' + customerId;
            const params = [];

            if (search) params.push('search=' + encodeURIComponent(search));
            if (category && category !== 'all') params.push('category=' + encodeURIComponent(category));
            if (sort && sort !== 'featured') params.push('sort=' + encodeURIComponent(sort));
            if (date) params.push('date=' + encodeURIComponent(date));
            if (price && price !== '50') params.push('price=' + encodeURIComponent(price));

            if (params.length > 0) {
                url += '?' + params.join('&');
            }

            window.location.href = url;
        }

        // CLEAR FILTERS Reset everything
        function clearFilters() {
            // Reset all filter elements
            if (searchInput) searchInput.value = '';
            if (categoryFilter) categoryFilter.value = 'all';
            if (sortFilter) sortFilter.value = 'featured';
            if (dateFilter) dateFilter.value = '';
            if (priceRange) priceRange.value = '50';
            if (priceMinDisplay) priceMinDisplay.textContent = '$0';
            
            // Redirect to base browse page (no filters)
            window.location.href = '/customer/browse/' + customerId;
        }

        // SEARCH BUTTON  Works when clicked
        if (searchBtn) {
            searchBtn.addEventListener('click', function(e) {
                e.preventDefault();
                applyFilters();
            });
        }

        // ENTER KEY Works when pressing Enter in search box
        if (searchInput) {
            searchInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    applyFilters();
                }
            });
        }

        // CATEGORY FILTER Applies when dropdown changes
        if (categoryFilter) {
            categoryFilter.addEventListener('change', function() {
                applyFilters();
            });
        }

        // SORT FILTER Applies when dropdown changes
        if (sortFilter) {
            sortFilter.addEventListener('change', function() {
                applyFilters();
            });
        }

        // DATE FILTER Applies when date changes
        if (dateFilter) {
            dateFilter.addEventListener('change', function() {
                applyFilters();
            });
        }

        // PRICE RANGE  Applies when user stops sliding
        if (priceRange) {
            let priceTimeout;
            priceRange.addEventListener('change', function() {
                clearTimeout(priceTimeout);
                priceTimeout = setTimeout(applyFilters, 300);
            });
        }

        // CLEAR FILTERS BUTTON  Add this button to the page
        const filterSection = document.querySelector('.filter-search');
        if (filterSection) {
            const clearBtn = document.createElement('button');
            clearBtn.textContent = 'Clear Filters';
            clearBtn.className = 'clear-btn';
            clearBtn.style.cssText = 'background: #fc8181; color: white; border: none; padding: 10px 20px; border-radius: 8px; font-size: 15px; font-weight: 600; cursor: pointer; transition: all 0.3s; margin-left: 10px;';
            clearBtn.addEventListener('click', function(e) {
                e.preventDefault();
                clearFilters();
            });
            filterSection.appendChild(clearBtn);
        }

        // VIEW DETAILS BUTTON - Shows event ID 
        document.querySelectorAll('.view-detail-btn').forEach(function(btn) {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                const eventId = this.getAttribute('href').split('=')[1];
                alert('View details for event ID: ' + eventId);
            });
        });

        console.log('Browse page JavaScript loaded! All filters work!');
    </script>

</body>
</html>