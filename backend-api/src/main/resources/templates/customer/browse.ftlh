<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Browse Activities - Triad Activities</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
</head>
<body>

    <header class="app-header">
        <div class="logo">
            <a href="index.html">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="index.html">Home</a>
            <a href="browse.html" class="active">Browse</a>
            <a href="myPlans.html">My Plans</a>
            <a href="profile.html">Profile</a>
        </nav>
        <div class="header-actions">
            <span class="location">Winston-Salem, NC</span>  //This shows the local area the person wants to find events, need to figure out the filter. Ideally would default to customers registered area
        </div>
    </header>

    <main>
        <section class="browse-header">
            <h1>All Activities</h1>
            <p>Browse through all available activities in the Triad area</p>
        </section>

        <section class="filter-section">
            <div class="filter-row">
                <div class="filter-group">
                    <label for="categoryFilter">Category</label>
                    <select id="categoryFilter">
                        <option value="all">All Categories</option>
                        <option value="outdoor">Outdoor</option>
                        <option value="indoor">Indoor</option>
                        <option value="food">Food & Drink</option>
                        <option value="entertainment">Entertainment</option>
                        <option value="culture">Culture</option>
                        <option value="sports">Sports</option>
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

        <section class="results-section">
            <div class="section-header">
                <h2 id="resultsCount">8 Activities Found</h2>
                <span class="result-count">Showing 1-8 of 8</span>
            </div>

            //Activity card to loop
            <div class="activity-grid">
                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                        <span class="card-badge">Featured</span>
                    </div>
                    <div class="card-body">
                        <h3>Wine Tasting in Yadkin Valley</h3>
                        <p class="location">Yadkin Valley, NC</p>
                        <div class="card-meta">
                            <span>Sat, Jul 12</span>
                            <span>2-5 PM</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$45 <span>/person</span></span>
                            <a href="booking.html?id=1" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>
                //End single activity card

                //This section can be deleted once the looping cards work
                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);"></div>
                    <div class="card-body">
                        <h3>Hiking at Hanging Rock</h3>
                        <p class="location">Hanging Rock State Park</p>
                        <div class="card-meta">
                            <span>Sun, Jul 13</span>
                            <span>8-11 AM</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$15 <span>/person</span></span>
                            <a href="booking.html?id=2" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>

                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);"></div>
                    <div class="card-body">
                        <h3>Food Tour - Downtown Greensboro</h3>
                        <p class="location">Greensboro, NC</p>
                        <div class="card-meta">
                            <span>Sat, Jul 19</span>
                            <span>11 AM - 2 PM</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$75 <span>/person</span></span>
                            <a href="booking.html?id=3" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>

                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%);">
                        <span class="card-badge">Live Music</span>
                    </div>
                    <div class="card-body">
                        <h3>Live Jazz Night</h3>
                        <p class="location">Winston-Salem, NC</p>
                        <div class="card-meta">
                            <span>Fri, Jul 18</span>
                            <span>8-11 PM</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$25 <span>/person</span></span>
                            <a href="booking.html?id=4" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>

                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #fddb92 0%, #d1fdff 100%);"></div>
                    <div class="card-body">
                        <h3>Kernersville Corn Maze</h3>
                        <p class="location">Kernersville, NC</p>
                        <div class="card-meta">
                            <span>Sat, Oct 12</span>
                            <span>10 AM - 6 PM</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$20 <span>/person</span></span>
                            <a href="booking.html?id=5" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>

                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #a18cd1 0%, #fbc2eb 100%);">
                        <span class="card-badge">Arts</span>
                    </div>
                    <div class="card-body">
                        <h3>Pottery Class at Sawtooth</h3>
                        <p class="location">Winston-Salem, NC</p>
                        <div class="card-meta">
                            <span>Thu, Jul 17</span>
                            <span>6-8 PM</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$40 <span>/person</span></span>
                            <a href="booking.html?id=6" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>

                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                        <span class="card-badge">Game Day</span>
                    </div>
                    <div class="card-body">
                        <h3>Dash Baseball Game</h3>
                        <p class="location">Winston-Salem, NC</p>
                        <div class="card-meta">
                            <span>Tue, Jul 15</span>
                            <span>7 PM</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$12 <span>/person</span></span>
                            <a href="booking.html?id=7" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>

                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #fbc2eb 0%, #a6c1ee 100%);"></div>
                    <div class="card-body">
                        <h3>Art & Wine Night</h3>
                        <p class="location">Greensboro, NC</p>
                        <div class="card-meta">
                            <span>Wed, Jul 16</span>
                            <span>7-9 PM</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$35 <span>/person</span></span>
                            <a href="booking.html?id=8" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>
            </div>
            //end of "This section can be deleted once the looping cards work"

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
                <a href="browse.html">Browse Activities</a>
                <a href="myPlans.html">My Plans</a>
                <a href="profile.html">Profile</a>
            </div>
</body>
</html>
<div class="n"></div>