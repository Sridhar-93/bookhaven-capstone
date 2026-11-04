import { describe, it, expect } from 'vitest';
import { books, categories } from './data';
describe('BookHaven sample catalogue', () => {
  it('contains books with the fields required by the catalogue UI', () => {
    expect(books.length).toBeGreaterThanOrEqual(8);
    for (const book of books) {
      expect(book).toHaveProperty('title');
      expect(book).toHaveProperty('author');
      expect(book.price).toBeGreaterThan(0);
    }
  });
  it('provides the main catalogue categories', () => {
    expect(categories).toContain('Fiction');
    expect(categories).toContain('Business');
    expect(categories).toContain('Technology');
  });
});
