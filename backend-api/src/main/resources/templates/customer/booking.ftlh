<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Event - Triad Activities</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <style>
        .detail-page {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 20px;
        }
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        .detail-container {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 40px;
        }
        .detail-image {
            height: 300px;
            border-radius: 12px;
            position: relative;
            margin-bottom: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            background-size: cover;
            background-position: center;
        }
        .detail-badge {
            position: absolute;
            top: 16px;
            left: 16px;
            background: #ffd93d;
            color: #333;
            padding: 6px 16px;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 600;
        }
        .detail-header {
            display: flex;
            justify-content: space-between;
            align-items: start;
            margin-bottom: 8px;
            flex-wrap: wrap;
        }
        .detail-header h2 {
            font-size: 28px;
        }
        .detail-rating {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .detail-rating .stars {
            color: #f6ad55;
            font-size: 18px;
        }
        .detail-rating span:last-child {
            color: #718096;
            font-size: 14px;
        }
        .detail-location {
            color: #718096;
            font-size: 16px;
            margin-bottom: 16px;
        }
        .detail-meta {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 24px;
            color: #4a5568;
        }
        .detail-description {
            margin-bottom: 24px;
        }
        .detail-description h4 {
            font-size: 18px;
            margin-bottom: 8px;
        }
        .detail-description p {
            color: #4a5568;
            line-height: 1.8;
            margin-bottom: 12px;
        }
        .detail-includes {
            background: #f7fafc;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 24px;
        }
        .detail-includes h4 {
            margin-bottom: 12px;
        }
        .detail-includes ul {
            list-style: none;
            padding: 0;
        }
        .detail-includes ul li {
            padding: 4px 0;
            color: #4a5568;
        }
        .provider-section {
            margin-bottom: 24px;
        }
        .provider-section h4 {
            margin-bottom: 12px;
        }
        .provider-card {
            display: flex;
            align-items: start;
            gap: 16px;
            padding: 16px;
            background: white;
            border-radius: 8px;
            border: 1px solid #edf2f7;
        }
        .provider-avatar {
            font-size: 40px;
            width: 56px;
            height: 56px;
            background: #edf2f7;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .provider-info h5 {
            font-size: 16px;
            margin-bottom: 4px;
        }
        .provider-info p {
            color: #718096;
            font-size: 14px;
        }
        .provider-desc {
            margin-top: 4px;
            color: #4a5568 !important;
        }
        .reviews-section h4 {
            margin-bottom: 16px;
        }
        .review-item {
            padding: 16px 0;
            border-bottom: 1px solid #edf2f7;
        }
        .review-item:last-child {
            border-bottom: none;
        }
        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 4px;
        }
        .review-header .stars {
            color: #f6ad55;
        }
        .review-item p {
            color: #4a5568;
            margin-bottom: 4px;
        }
        .review-item small {
            color: #a0aec0;
            font-size: 12px;
        }
        .booking-sidebar {
            position: sticky;
            top: 20px;
        }
        .booking-card-sticky {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }
        .price-box {
            text-align: center;
            padding-bottom: 16px;
            border-bottom: 1px solid #edf2f7;
            margin-bottom: 16px;
        }
        .price-box .price {
            font-size: 32px;
            font-weight: 700;
            color: #2d3748;
        }
        .price-box .price-per {
            font-size: 16px;
            color: #718096;
        }
        .booking-form .form-group {
            margin-bottom: 16px;
        }
        .booking-form label {
            display: block;
            font-weight: 500;
            margin-bottom: 4px;
            font-size: 14px;
            color: #4a5568;
        }
        .booking-form select,
        .booking-form textarea {
            width: 100%;
            padding: 10px 12px;
            border: 2px solid #e2e8f0;
            border-radius: 6px;
            font-family: inherit;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s;
        }
        .booking-form select:focus,
        .booking-form textarea:focus {
            border-color: #667eea;
        }
        .booking-form textarea {
            min-height: 80px;
            resize: vertical;
        }
        .booking-total {
            display: flex;
            justify-content: space-between;
            font-size: 20px;
            font-weight: 600;
            padding: 16px 0;
            border-top: 1px solid #edf2f7;
            margin-top: 8px;
        }
        .total-price {
            color: #667eea;
        }
        .book-now-btn {
            width: 100%;
            padding: 14px;
            font-size: 18px;
            font-weight: 600;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.2s;
        }
        .book-now-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }
        .booking-note {
            text-align: center;
            font-size: 13px;
            color: #a0aec0;
            margin-top: 12px;
        }
        .quick-info {
            margin-top: 16px;
            padding-top: 16px;
            border-top: 1px solid #edf2f7;
        }
        .info-item {
            padding: 4px 0;
            color: #4a5568;
            font-size: 14px;
        }
        .message {
            padding: 15px 25px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
        }
        .message.success {
            background: #c6f6d5;
            color: #276749;
        }
        .message.error {
            background: #fed7d7;
            color: #9b2c2c;
        }
        .hidden {
            display: none;
        }
        @media (max-width: 992px) {
            .detail-container {
                grid-template-columns: 1fr;
                gap: 30px;
            }
            .booking-sidebar {
                position: static;
            }
        }
        @media (max-width: 768px) {
            .detail-header {
                flex-direction: column;
                gap: 8px;
            }
            .detail-header h2 {
                font-size: 22px;
            }
            .detail-meta {
                gap: 12px;
                font-size: 14px;
            }
            .detail-image {
                height: 200px;
            }
            .booking-card-sticky {
                padding: 16px;
            }
        }
    </style>
</head>
<body>

    <header class="app-header">
        <div class="logo">
            <a href="/index.html">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="/index.html">Home</a>
            <a href="/customer/browse/${customer.id}">Browse</a>
            <a href="/customer/myplans/${customer.id}">My Plans</a>
            <a href="/customer/profile/${customer.id}">Profile</a>
        </nav>
        <div class="header-actions">
            <span class="location">${customer.location!"Winston-Salem, NC"}</span>
        </div>
    </header>

    <main class="detail-page">
        <a href="/customer/browse/${customer.id}" class="back-link">Back to Browse</a>

        <div id="message" class="message hidden"></div>

        <div class="detail-container">
            <div class="detail-info">
                <div class="detail-image" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); background-image: url('${event.imageUrl!''}'); background-size: cover; background-position: center;">
                    <#if event.featured?? && event.featured == true>
                        <span class="detail-badge">Featured</span>
                    </#if>
                </div>
                
                <div class="detail-header">
                    <h2>${event.eventName}</h2>
                    <div class="detail-rating">
                        <span class="stars">★★★★★</span>
                        <span>(0 reviews)</span>
                    </div>
                </div>
                
                <p class="detail-location">${event.city}, ${event.state}</p>
                
                <div class="detail-meta">
                    <span>${event.date}</span>
                    <span>${event.startTime} - ${event.endTime}</span>
                    <span>${event.maxCapacity} spots</span>
                </div>
                
                <div class="detail-description">
                    <h4>About this activity</h4>
                    <p>${event.description}</p>
                </div>

                <#if event.included?? && event.included?has_content>
                    <div class="detail-includes">
                        <h4>What's Included</h4>
                        <ul>
                            <#list event.included?split(",") as item>
                                <li>${item?trim}</li>
                            </#list>
                        </ul>
                    </div>
                </#if>

                <div class="provider-section">
                    <h4>About the Provider</h4>
                    <div class="provider-card">
                        <div class="provider-avatar">P</div>
                        <div class="provider-info">
                            <h5>${event.provider.companyName!""}</h5>
                            <p>${event.provider.category!""}</p>
                            <p class="provider-desc">${event.provider.description!"Experienced provider in the Triad area."}</p>
                        </div>
                    </div>
                </div>

                <div class="reviews-section">
                    <h4>Reviews</h4>
                    <p style="color: #a0aec0;">No reviews yet. Be the first to write one!</p>
                </div>
            </div>

            <div class="booking-sidebar">
                <div class="booking-card-sticky">
                    <div class="price-box">
                        <span class="price">$${event.pricePerPerson!0}</span>
                        <span class="price-per">/ person</span>
                    </div>
                    
                    <form id="bookingForm" class="booking-form">
                        <input type="hidden" id="customerId" value="${customer.id}">
                        <input type="hidden" id="eventId" value="${event.id}">

                        <div class="form-group">
                            <label>Number of people</label>
                            <select id="numberOfPeople" required>
                                <#list 1..event.maxCapacity as i>
                                    <option value="${i}">${i} person${i > 1 ? 's' : ''}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Special requests</label>
                            <textarea id="specialRequests" placeholder="Dietary restrictions, mobility needs, etc."></textarea>
                        </div>

                        <div class="booking-total">
                            <span>Total:</span>
                            <span class="total-price" id="totalPrice">$${event.pricePerPerson!0}</span>
                        </div>

                        <button type="submit" class="book-now-btn">Confirm Booking</button>
                        <p class="booking-note">No payment required now. You will pay at the event.</p>
                    </form>

                    <div class="quick-info">
                        <div class="info-item">Free cancellation</div>
                        <div class="info-item">Pay at event</div>
                        <div class="info-item">Meeting point provided after booking</div>
                    </div>
                </div>
            </div>
        </div>
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
                <a href="/customer/browse/${customer.id}">Browse Activities</a>
                <a href="/customer/myplans/${customer.id}">My Plans</a>
                <a href="/customer/profile/${customer.id}">Profile</a>
            </div>
        </div>
    </footer>

    <script>
        const pricePerPerson = ${event.pricePerPerson!0};
        const maxCapacity = ${event.maxCapacity};

        const numberOfPeopleSelect = document.getElementById('numberOfPeople');
        const totalPriceSpan = document.getElementById('totalPrice');

        numberOfPeopleSelect.addEventListener('change', function() {
            const people = parseInt(this.value) || 0;
            const total = people * pricePerPerson;
            totalPriceSpan.textContent = '$' + total.toFixed(2);
        });

        document.getElementById('bookingForm').addEventListener('submit', async function(e) {
            e.preventDefault();

            const customerId = document.getElementById('customerId').value;
            const eventId = document.getElementById('eventId').value;
            const numberOfPeople = document.getElementById('numberOfPeople').value;
            const specialRequests = document.getElementById('specialRequests').value.trim();

            try {
                const response = await fetch('/api/customers/' + customerId + '/bookings', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        event: { id: parseInt(eventId) },
                        numberOfPeople: parseInt(numberOfPeople),
                        specialRequests: specialRequests
                    })
                });

                if (!response.ok) {
                    const error = await response.json();
                    throw new Error(error.error || 'Failed to book event');
                }

                const booking = await response.json();
                showMessage('Booking confirmed successfully!', 'success');

                setTimeout(function() {
                    window.location.href = '/customer/myplans/' + customerId;
                }, 2000);

            } catch (error) {
                console.error('Error:', error);
                showMessage(error.message || 'Failed to book event. Please try again.', 'error');
            }
        });

        function showMessage(text, type) {
            const messageDiv = document.getElementById('message');
            messageDiv.textContent = text;
            messageDiv.className = 'message ' + type;
            messageDiv.classList.remove('hidden');

            clearTimeout(window.messageTimeout);
            window.messageTimeout = setTimeout(function() {
                messageDiv.classList.add('hidden');
            }, 4000);
        }
    </script>

</body>
</html>