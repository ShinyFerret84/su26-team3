# Triad Activities Backend API

**Version:** 1.0
**Last Updated:** July 2026

**Base URL:**

- local: http://localhost:8080
- production: (to be added)

---

## Table of Contents

1. [Overview](#1-overview)
2. [UML Class Diagram](#2-uml-class-diagram)
3. [API Endpoints](#3-api-endpoints)
   - [Customer Endpoints](#31-customer-endpoints)
   - [Event Endpoints](#32-event-endpoints)
   - [Booking Endpoints](#33-booking-endpoints)
   - [Review Endpoints](#34-review-endpoints)
   - [Provider Endpoints](#35-provider-endpoints)
4. [Use Case Mapping](#4-use-case-mapping)

---

## 1. Overview

The Triad Activities backend exposes a RESTful API for the activity discovery and booking platform described in the SRS. It supports customer registration and profile management, event browsing and searching, event booking, review management, and provider event management.

---

## 2. UML Class Diagram

![UML Class Diagram](../docs/c:\Users\Maria Reynoso\OneDrive - UNCG\CSC340\Team 3 current UML Diagram.png)


---

## 3. API Endpoints

### 3.1 Customer Endpoints

#### Create a customer

```http
POST /api/customers/register