# Changelog

All notable changes to BookHaven are documented here.

## [1.1.0] — 2026-11-04

### Fixed
- **Search input focus loss** — `Header`, `BookCard`, and `Footer` were defined
  inside the `App` function body. React treated each render as a new component
  type and unmounted/remounted the header, causing the search input to lose focus
  after every keystroke. All three components are now defined at module level and
  receive state via props.

- **Order confirmation blank titles** — `placeOrder` spread cart items as
  `{ id, qty }` but the success page, order history, and recommendations all
  looked up books by `i.bookId`. Changed `placeOrder` to save items as
  `{ bookId, qty }` so every consumer finds the correct book title.

### Improved
- `onQueryChange` in `Header` now only navigates to home when the user is not
  already on the home page, avoiding unnecessary re-renders while typing.

## [1.0.0] — 2026-11-04

### Added
- Responsive React + Vite storefront (Home, Detail, Cart, Checkout, Success,
  Orders, Account pages)
- Book catalogue with category filter, brand/publisher filter, full-text search
  across title, author, category and brand, and four-way sort
- Book detail page with related titles, estimated delivery date, quantity picker
  and wishlist toggle
- Shopping cart with quantity controls, free-shipping threshold (₹499), and
  running order totals
- Gift point redemption (₹100 off, 250 points balance)
- Checkout flow — delivery address form plus UPI / Credit-Debit Card / Cash on
  Delivery payment options
- Order confirmation page with full item list and total
- Order history with status badges, Buy Again, and 48-hour cancellation window
- Demo account — email-only sign-in, stats panel, sign out
- Express REST API with seven endpoints (health, books, book detail,
  recommendations, order history, create order, cancel order)
- PostgreSQL schema — `books`, `orders`, `order_items` tables with FK
  constraints, indexes and soft-delete flag
- Seed data for 10 books across 6 categories matching the frontend catalogue
- OpenAPI 3.0.3 specification documenting all endpoints
- Docker Compose setup for local PostgreSQL 16
- npm workspaces monorepo with concurrent dev scripts
- Vitest unit tests for data layer
