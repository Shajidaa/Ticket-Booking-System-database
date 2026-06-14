# Football Ticket Booking System (Database Design & SQL Architecture)

An intermediate-to-advanced relational database solution designed to model, manage, and audit transactional ticket sales for high-profile football tournaments. This repository contains the operational Entity-Relationship Diagram (ERD), full Schema Initialization scripts (DDL), and optimized Analytical SQL Reporting queries.

---

---

## 📐 Part 1: Schema Architecture & ERD Design

The system maps real-world booking behaviors by abstracting operations into three interdependent layers.

### Relational Schema Blueprint:

- **Users Table:** Tracks application actors, restricting permissions via custom constraints to either `Ticket Manager` or `Football Fan`.
- **Matches Table:** Acts as the inventory registry catalog for tournaments, tracking pricing metrics and seat statuses (`Available`, `Selling Fast`, `Sold Out`, `Postponed`).
- **Bookings Table:** Operates as a transactional junction entity resolving the **Many-to-Many** relationship between Users and Matches into streamlined **One-to-Many** linkages.

### Entity-Relationship Diagram (ERD) Link

> 🔗 **[Click Here to View the Interactive ERD Canvas](https://drive.google.com/file/d/1LLYFGBe-Pj35Y5MQu-CG5lVm8NpvEzl6/view?usp=sharing)**

---

## 💻 Part 2: Database Setup & Seed Data

This project utilizes a standardized relational script written in clean, modern ANSI-SQL. It includes safe drop-tables mechanisms, sequential entity creation loops, and pre-populated evaluation datasets.

```sql
-- To install the schema and seed mock data locally:
-- 1. Open your terminal or preferred database GUI (e.g., Beekeeper Studio / VS Code SQL Tools).
-- 2. Run the complete script located inside the source file:
--    File Path: ./QUERY.sql
```
