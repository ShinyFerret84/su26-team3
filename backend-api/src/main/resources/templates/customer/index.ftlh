<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Home</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <style>
        .hero-section {
            text-align: center;
            padding: 80px 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 16px;
            color: white;
            margin-bottom: 40px;
        }
        .hero-section h1 {
            font-size: 48px;
            margin-bottom: 16px;
        }
        .hero-section p {
            font-size: 20px;
            opacity: 0.9;
            margin-bottom: 30px;
        }
        .hero-search {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
        }
        .hero-search input {
            padding: 14px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            width: 100%;
            max-width: 400px;
        }
        .hero-search .search-btn {
            padding: 14px 32px;
            background: white;
            color: #667eea;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
            display: inline-block;
        }
        .hero-search .search-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        .categories-section {
            margin-bottom: 40px;
        }
        .categories-section h2 {
            font-size: 28px;
            margin-bottom: 20px;
        }
        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 16px;
        }
        .category-card {
            background: white;
            padding: 24px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            text-decoration: none;
            color: #2d3748;
            transition: all 0.3s;
            font-weight: 600;
        }
        .category-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }
        .category-card .icon {
            font-size: 36px;
            display: block;
            margin-bottom: 8px;
        }
        .featured-section {
            margin-bottom: 40px;
        }
        .featured-section .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .featured-section .section-header h2 {
            font-size: 28px;
        }
        .activity-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 24px;
        }
        .activity-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .activity-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
        }
        .card-image {
            height: 160px;
            position: relative;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .card-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: #ffd93d;
            color: #333;
            padding: 4px 14px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }
        .card-body {
            padding: 16px;
        }
        .card-body h3 {
            font-size: 18px;
            margin-bottom: 4px;
        }
        .card-body .location {
            color: #718096;
            font-size: 14px;
            margin-bottom: 8px;
        }
        .card-meta {
            display: flex;
            gap: 12px;
            font-size: 13px;
            color: #4a5568;
            margin-bottom: 12px;
        }
        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid #edf2f7;
            padding-top: 12px;
        }
        .price {
            font-size: 20px;
            font-weight: 700;
            color: #2d3748;
        }
        .price span {
            font-size: 14px;
            font-weight: 400;
            color: #718096;
        }
        .view-detail-btn {
            padding: 8px 16px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
            transition: background 0.2s;
        }
        .view-detail-btn:hover {
            background: #5a6fd6;
        }
        .view-all {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }
        .view-all:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <header class="app-header">
        <div class="logo">
            <a href="/index.html">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="/index.html" class="active">Home</a>
            <a href="/customer/browse/1">Browse</a>
            <a href="/customer/myplans/1">My Plans</a>
            <a href="/customer/profile/1">Profile</a>
        </nav>
        <div class="header-actions">
            <span class="location">Winston-Salem, NC</span>
        </div>
    </header>

    <main style="max-width: 1200px; margin: 0 auto; padding: 30px 20px;">

        <section class="hero-section">
            <h1>Discover Amazing Activities in the Triad</h1>
            <p>Find the perfect experience for you and your friends in High Point, Greensboro, and beyond</p>
            <div class="hero-search">
                <input type="text" placeholder="Search activities... (e.g., wine tasting, hiking, food)">
                <a href="/customer/browse/1" class="search-btn">Browse All Activities</a>
            </div>
        </section>

        <section class="categories-section">
            <h2>Browse by Category</h2>
            <div class="category-grid">
                <a href="/customer/browse/1?category=Outdoor" class="category-card">
                    <span class="icon">🏔️</span> Outdoor
                </a>
                <a href="/customer/browse/1?category=Food" class="category-card">
                    <span class="icon">🍷</span> Food & Drink
                </a>
                <a href="/customer/browse/1?category=Entertainment" class="category-card">
                    <span class="icon">🎵</span> Entertainment
                </a>
                <a href="/customer/browse/1?category=Culture" class="category-card">
                    <span class="icon">🎨</span> Culture
                </a>
                <a href="/customer/browse/1?category=Sports" class="category-card">
                    <span class="icon">⚽</span> Sports
                </a>
            </div>
        </section>

        <section class="featured-section">
            <div class="section-header">
                <h2>Featured Activities</h2>
                <a href="/customer/browse/1" class="view-all">View All →</a>
            </div>
            <div class="activity-grid">
                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                        <span class="card-badge">Featured</span>
                    </div>
                    <div class="card-body">
                        <h3>Wine Tasting in Yadkin Valley</h3>
                        <p class="location">Yadkin Valley, NC</p>
                        <div class="card-meta">
                            <span>2026-07-20</span>
                            <span>14:00 - 17:00</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$45 <span>/person</span></span>
                            <a href="/customer/booking/1?customerId=1" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>
                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);">
                    </div>
                    <div class="card-body">
                        <h3>Hiking at Hanging Rock</h3>
                        <p class="location">Danbury, NC</p>
                        <div class="card-meta">
                            <span>2026-08-15</span>
                            <span>09:00 - 15:00</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$25 <span>/person</span></span>
                            <a href="/customer/booking/1?customerId=1" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>
                <div class="activity-card">
                    <div class="card-image" style="background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);">
                    </div>
                    <div class="card-body">
                        <h3>Live Jazz Night</h3>
                        <p class="location">Winston-Salem, NC</p>
                        <div class="card-meta">
                            <span>2026-07-25</span>
                            <span>20:00 - 23:00</span>
                        </div>
                        <div class="card-footer">
                            <span class="price">$25 <span>/person</span></span>
                            <a href="/customer/booking/1?customerId=1" class="view-detail-btn">View Details</a>
                        </div>
                    </div>
                </div>
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
                <a href="/index.html">Home</a>
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