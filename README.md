# BookHaven — AI Specialist Capstone

A responsive bookstore e-commerce capstone based on the supplied IBM AI Specialist Front End and Mobile presentation. The UI follows the dark bookstore reference screens and implements the customer journeys described in the deck.

## Included

- Responsive React + Vite storefront
- Book catalogue, category and publisher filters, search and sorting
- Book detail pages, related titles, estimated delivery and wishlist
- Shopping bag with quantity controls and order totals
- Demo sign-in and account view
- Delivery address form, UPI/card/Cash on Delivery selection
- Gift-point redemption and order confirmation
- Order history, Buy Again and 48-hour cancellation rule
- Express REST API, PostgreSQL schema and seed data
- OpenAPI specification
- Docker Compose database setup

## Quick start — frontend demo

Requirements: Node.js 18+ and npm.

```bash
npm install
npm run dev:client
```

Open http://localhost:5173. The frontend uses browser localStorage so the main customer journey works without a database or API.

Demo sign-in: use any email address containing `@` (for example `reader@bookhaven.in`). No password is required in this prototype.

## Run the PostgreSQL + API backend

In a second terminal:

```bash
docker compose up -d db
cp server/.env.example server/.env
npm install
npm run dev:server
```

API runs at http://localhost:4000. Health check: http://localhost:4000/api/health

The database schema and sample books are loaded automatically on the first database start. To reset the database and reload seed data:

```bash
docker compose down -v
docker compose up -d db
```

## Build

```bash
npm install
npm run build
```

## Main API endpoints

| Method | Endpoint | Purpose |
|---|---|---|
| GET | `/api/health` | API/database health |
| GET | `/api/books` | Catalogue with optional `category`, `brand`, `q` filters |
| GET | `/api/books/:id` | Book detail |
| GET | `/api/recommendations?email=...` | Purchase-history recommendations |
| GET | `/api/orders?email=...` | Customer order history |
| POST | `/api/orders` | Create order |
| POST | `/api/orders/:id/cancel` | Cancel eligible order within 48 hours |

Full API contract: `server/openapi.yaml`.

## Important prototype notes

- This is a learning/demo implementation, not a production commerce system.
- Payment methods are simulated. No card, UPI or bank transaction is initiated.
- Demo sign-in is intentionally lightweight. Add a proper identity provider, password hashing, sessions/JWT and authorization before production use.
- The storefront persists its demo cart and orders in localStorage. The PostgreSQL API is supplied as a separate backend foundation; the frontend currently runs independently for a reliable local demonstration.
- The seeded order history and reward points are sample data.
- Before production, add inventory checks, tax/shipping rules, payment gateway integration, email notifications, rate limiting, audit logging, input validation and security review.

## Suggested IBM BOB / AWS Kiro development walkthrough

The supplied capstone asks learners to use an Agentic IDE and explain the development process. Suggested prompts you can use while reviewing and extending this project:

1. **Understand the use case:** "Review the capstone requirements and map each customer journey to the BookHaven screens and components. Identify any missing acceptance criteria."
2. **UI refinement:** "Review the React storefront against the supplied bookstore screenshots. Improve responsive spacing and accessibility without changing the customer journeys."
3. **API review:** "Review `server/openapi.yaml` and the Express routes. Check request validation, error responses and consistency with the PostgreSQL schema."
4. **Testing:** "Generate component and API tests for catalogue filtering, cart totals, gift points, checkout validation, order history and the 48-hour cancellation rule."
5. **Code quality:** "Review the project for reusable components, naming, duplicate logic, accessibility and security risks. Explain each proposed change before applying it."

## Recent fixes

- **Search input** — typing in the search bar no longer drops focus. Root cause
  was `Header`, `BookCard`, and `Footer` being defined inside `App`, causing
  React to remount them on every render. All three are now top-level components.
- **Order confirmation titles** — book titles now appear correctly on the success
  page and order history. `placeOrder` previously saved items as `{ id, qty }`;
  changed to `{ bookId, qty }` to match what the order lookup expects.

## Suggested Git workflow

```bash
git init
git checkout -b feature/bookstore-capstone
git add .
git commit -m "Build responsive BookHaven bookstore capstone"
git remote add origin https://github.com/<your-username>/bookhaven-capstone.git
git push -u origin feature/bookstore-capstone
```

Then create a Pull Request in GitHub. Replace the placeholder remote URL with your own repository URL.
