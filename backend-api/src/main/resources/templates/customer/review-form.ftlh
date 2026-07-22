<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write a Review - Triad Activities</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <style>
        .review-page {
            max-width: 700px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        .review-page h1 {
            font-size: 32px;
            color: #2d3748;
            margin-bottom: 8px;
        }
        .review-page > p {
            color: #718096;
            margin-bottom: 30px;
        }
        .review-page > p strong {
            color: #2d3748;
        }
        .review-form {
            background: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: 600;
            color: #4a5568;
            font-size: 14px;
            margin-bottom: 6px;
        }
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px 14px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 15px;
            font-family: inherit;
        }
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
        }
        .form-group textarea {
            resize: vertical;
            min-height: 120px;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
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
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
            margin-left: 10px;
        }
        .btn-secondary:hover {
            background: #e2e8f0;
        }
        .form-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
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
        @media (max-width: 600px) {
            .form-actions {
                flex-direction: column;
            }
            .btn-secondary {
                margin-left: 0;
                text-align: center;
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
        <div class="review-page">
            <h1>Write a Review</h1>
            <p>Share your experience with <strong>${event.eventName}</strong></p>

            <div id="message" class="message hidden"></div>

            <form id="reviewForm" class="review-form" action="/customer/review/submit" method="post">
                <input type="hidden" name="customerId" value="${customer.id}">
                <input type="hidden" name="eventId" value="${event.id}">
                <input type="hidden" name="bookingId" value="${bookingId}">

                <div class="form-group">
                    <label for="rating">Rating</label>
                    <select id="rating" name="rating" required>
                        <option value="">Select a rating</option>
                        <option value="5">5 stars - Excellent</option>
                        <option value="4">4 stars - Good</option>
                        <option value="3">3 stars - Average</option>
                        <option value="2">2 stars - Poor</option>
                        <option value="1">1 star - Terrible</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="comment">Comment</label>
                    <textarea id="comment" name="comment" rows="5" placeholder="Describe your experience..." required></textarea>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-primary">Submit Review</button>
                    <a href="/customer/profile/${customer.id}" class="btn-secondary">Cancel</a>
                </div>
            </form>
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
        document.getElementById('reviewForm').addEventListener('submit', function(e) {
            const rating = document.getElementById('rating').value;
            const comment = document.getElementById('comment').value.trim();

            if (!rating) {
                e.preventDefault();
                showMessage('Please select a rating!', 'error');
                return;
            }
            if (!comment) {
                e.preventDefault();
                showMessage('Please write a comment!', 'error');
                return;
            }

            showMessage('Submitting review...', 'success');
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