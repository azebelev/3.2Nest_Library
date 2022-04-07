import { Entity, PrimaryGeneratedColumn, Column, JoinColumn, OneToOne, ManyToOne } from 'typeorm';
import { AuthorsModel } from './authors.model';
import { BooksModel } from './books.model';

@Entity({ name: 'books_authors' })
export class BooksAuthorsModel {

  @Column({ primary: true, generated: true })
  id: number;

  @ManyToOne(() => AuthorsModel, authors => authors.id, { onDelete: 'CASCADE', nullable: false })
  @JoinColumn({ name: 'author_id' })
  authorId: number;

  @ManyToOne(() => BooksModel, books => books.id, { onDelete: 'CASCADE', nullable: false })
  @JoinColumn({ name: 'book_id' })
  bookId: number;
}
