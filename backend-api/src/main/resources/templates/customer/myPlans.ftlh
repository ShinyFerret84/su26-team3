<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Plans - Triad Activities</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <style>
        .plans-page {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 20px;
        }
        .plans-page h1 {
            font-size: 32px;
            color: #2d3748;
            margin-bottom: 8px;
        }
        .plans-page > p {
            color: #718096;
            margin-bottom: 30px;
        }
        .booking-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .booking-card {
            background: white;
            padding: 20px 25px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        .booking-card:hover {
            box-shadow: 0 4px 20px rgba(0,0,0,0.12);
        }
        .booking-info h3 {
            font-size: 20px;
            color: #2d3748;
            margin-bottom: 4px;
        }
        .booking-info .location {
            color: #718096;
            font-size: 14px;
            margin-bottom: 8px;
        }
        .booking-details {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            font-size: 14px;
            color: #4a5568;
        }
        .booking-status {
            font-weight: 600;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 13px;
        }
        .booking-status.CONFIRMED {
            background: #c6f6d5;
            color: #276749;
        }
        .booking-status.COMPLETED {
            background: #bee3f8;
            color: #2a69ac;
        }
        .booking-status.CANCELLED {
            background: #fed7d7;
            color: #9b2c2c;
        }
        .booking-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }
        .btn-secondary {
            background: #edf2f7;
            color: #2d3748;
            border: none;
            padding: 8px 18px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s;
        }
        .btn-secondary:hover {
            background: #e2e8f0;
        }
        .btn-danger {
            background: #fc8181;
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s;
        }
        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(252, 129, 129, 0.4);
        }
        .no-bookings {
            text-align: center;
            color: #a0aec0;
            padding: 40px 0;
            font-size: 18px;
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
        @media (max-width: 768px) {
            .booking-card {
                flex-direction: column;
                align-items: stretch;
                text-align: center;
            }
            .booking-actions {
                justify-content: center;
            }
            .booking-details {
                justify-content: center;
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
            <a href="/customer/myplans/${customer.id}" class="active">My Plans</a>
            <a href="/customer/profile/${customer.id}">Profile</a>
        </nav>
        <div class="header-actions">
            <span class="location">${customer.location!"No location set"}</span>
        </div>
    </header>

    <main>
        <div class="plans-page">
            <h1>My Plans</h1>
            <p>View all your upcoming and past bookings.</p>

            <div id="message" class="message hidden"></div>

            <#if bookings?has_content>
                <div class="booking-list" id="bookingList">
                    <#list bookings as booking>
                        <div class="booking-card" id="booking-${booking.id}">
                            <div class="booking-info">
                                <h3>${booking.event.eventName}</h3>
                                <p class="location">${booking.event.city}, ${booking.event.state}</p>
                                <div class="booking-details">
                                    <span>Date: ${booking.event.date}</span>
                                    <span>Time: ${booking.event.startTime} - ${booking.event.endTime}</span>
                                    <span>People: ${booking.numberOfPeople}</span>
                                    <span class="booking-status ${booking.status}">${booking.status}</span>
                                </div>
                            </div>
                            <div class="booking-actions">
                                <#if booking.status == "CONFIRMED">
                                    <button class="btn-danger" onclick="cancelBooking(${booking.id})">Cancel</button>
                                </#if>
                                <#if booking.status == "COMPLETED">
                                    <a href="/customer/review/${booking.id}" class="btn-primary">Write Review</a>
                                </#if>
                                <a href="/customer/booking/${booking.event.id}" class="btn-secondary">View Details</a>
                            </div>
                        </div>
                    </#list>
                </div>
            <#else>
                <p class="no-bookings">You have no bookings yet. Start browsing events!</p>
            </#if>

            <div style="margin-top: 30px;">
                <a href="/customer/browse/${customer.id}" class="btn-primary">Browse More Events</a>
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
                <a href="/index.html">Home</a>
                <a href="/customer/browse/${customer.id}">Browse Activities</a>
                <a href="/customer/myplans/${customer.id}">My Plans</a>
                <a href="/customer/profile/${customer.id}">Profile</a>
            </div>
        </div>
    </footer>

    <script>
        async function cancelBooking(bookingId) {
            if (!confirm('Are you sure you want to cancel this booking?')) {
                return;
            }

            try {
                const response = await fetch('/api/customers/bookings/' + bookingId + '/cancel', {
                    method: 'PUT',
                    headers: { 'Content-Type': 'application/json' }
                });

                if (!response.ok) throw new Error('Failed to cancel booking');

                const result = await response.json();
                showMessage('Booking cancelled successfully!', 'success');

                const card = document.getElementById('booking-' + bookingId);
                if (card) {
                    const statusSpan = card.querySelector('.booking-status');
                    if (statusSpan) {
                        statusSpan.textContent = 'CANCELLED';
                        statusSpan.className = 'booking-status CANCELLED';
                    }
                    const cancelBtn = card.querySelector('.btn-danger');
                    if (cancelBtn) {
                        cancelBtn.remove();
                    }
                }

            } catch (error) {
                console.error('Error:', error);
                showMessage('Failed to cancel booking. Please try again.', 'error');
            }
        }

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