# Triad Activities - Backend API

## Use-Case to MVC Implementation Mapping

### US-1: Create Interest Profile
| Layer | File | Purpose |
|-------|------|---------|
| **Model** | `entity/Customer.java` | Customer entity with interests list |
| **View** | `templates/customer/profile.ftlh` | Profile page template |
| **Controller** | `controller/CustomerUiController.java` | Handles profile page requests |
| **Service** | `service/CustomerManager.java` | Business logic for customers |
| **Repository** | `repository/CustomerRepository.java` | Database operations |

**API Endpoints:**
- `POST /api/customers/register` - Register customer
- `POST /api/customers/login` - Login customer
- `GET /api/customers/{id}` - Get customer profile
- `PUT /api/customers/{id}` - Update customer profile
- `POST /api/customers/{id}/interests` - Add interest
- `DELETE /api/customers/{id}/interests/{interest}` - Remove interest
- `GET /api/customers/{id}/interests` - Get all interests

**UI Flow:** Customer logs in → Profile page → Add/remove interests → Interests saved to database


### US-2: Browse Events Matching Interests
| Layer | File | Purpose |
|-------|------|---------|
| **Model** | `entity/Event.java` | Event entity |
| **View** | `templates/customer/browse.ftlh` | Browse page template |
| **Controller** | `controller/CustomerEventUiController.java` | Handles browse page requests |
| **Service** | `service/EventService.java` | Business logic for events |
| **Repository** | `repository/EventRepository.java` | Database operations |

**API Endpoints:**
- `GET /api/events` - Get all events
- `POST /api/events` - Create event
- `GET /customer/browse/{customerId}` - Browse events matching interests
- `GET /customer/browse/{customerId}?search=keyword` - Search events
- `GET /customer/browse/{customerId}?category=Outdoor` - Filter by category
- `GET /customer/browse/{customerId}?sort=price-low` - Sort by price low to high
- `GET /customer/browse/{customerId}?sort=price-high` - Sort by price high to low

**Key Method:** `eventService.getEventsByInterests(interests)` uses `eventRepository.findByCategoryIn(interests)` to find events matching customer interests.

**UI Flow:** Customer browses events → Filter by category → Search by keyword → Sort by price/date


### US-3: Register for Events (Booking)
| Layer | File | Purpose |
|-------|------|---------|
| **Model** | `entity/Booking.java` | Booking entity |
| **View** | `templates/customer/booking.ftlh` | Booking form template |
| **View** | `templates/customer/myPlans.ftlh` | My Plans template |
| **Controller** | `controller/CustomerBookingController.java` | Handles booking requests |
| **Service** | `service/CustomerManager.java` | Business logic for bookings |
| **Repository** | `repository/BookingRepository.java` | Database operations |

**API Endpoints:**
- `POST /api/customers/{customerId}/bookings` - Book an event
- `GET /api/customers/{customerId}/bookings` - Get all bookings
- `GET /customer/booking/{eventId}` - Show booking form
- `POST /customer/booking/confirm` - Confirm booking
- `GET /customer/myplans/{customerId}` - View bookings

**UI Flow:** Customer clicks "View Details" → Booking form → Select people → Confirm → Booking saved → Appears in My Plans


### US-4: Write Reviews
| Layer | File | Purpose |
|-------|------|---------|
| **Model** | `entity/Review.java` | Review entity |
| **View** | `templates/customer/review-form.ftlh` | Review form template |
| **View** | `templates/customer/profile.ftlh` | Profile page showing reviews |
| **Controller** | `controller/CustomerBookingController.java` | Handles review requests |
| **Service** | `service/CustomerManager.java` | Business logic for reviews |
| **Repository** | `repository/ReviewRepository.java` | Database operations |

**API Endpoints:**
- `POST /api/customers/{customerId}/reviews` - Submit review
- `GET /api/customers/{customerId}/reviews` - Get customer reviews
- `GET /customer/review/{bookingId}` - Show review form
- `POST /customer/review/submit` - Submit review

**UI Flow:** Customer goes to My Plans → Clicks "Write Review" on completed booking → Fills rating/comment → Submits → Review appears on Profile


## Technology Stack
- **Framework**: Spring Boot 4.1.0
- **Language**: Java 25
- **Template Engine**: FreeMarker
- **Database**: PostgreSQL (Neon)
- **ORM**: Hibernate / JPA
- **Build Tool**: Maven
- **Styling**: CSS

## Database Schema
| Table | Purpose |
|-------|---------|
| `customers` | Customer account information |
| `customer_interests` | Customer interests (many-to-many) |
| `events` | Event details |
| `providers` | Provider account information |
| `bookings` | Customer bookings |
| `reviews` | Customer reviews for events |