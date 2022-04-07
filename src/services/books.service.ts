import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BooksModel } from '../entities/books.model';
import { CreateBookDto } from '../admin/dto/create-book.dto';
import { Injectable } from '@nestjs/common';
import { AuthorsModel } from '../entities/authors.model';
import { BooksAuthorsModel } from '../entities/books_authors.model';


@Injectable()
export class BooksService {
  constructor(
    @InjectRepository(BooksModel) private readonly books: Repository<BooksModel>,
    @InjectRepository(BooksAuthorsModel) private readonly books_authors: Repository<BooksAuthorsModel>,
    @InjectRepository(AuthorsModel) private readonly authors: Repository<AuthorsModel>,
  ) { }


  async addNewBook(dto: CreateBookDto) {
    const book = await this.books.save(dto);
    const authors: Array<string> = [];

    if (dto.author1?.trim() !== '') authors.push(dto.author1!);
    if (dto.author2?.trim() !== '') authors.push(dto.author2!);
    if (dto.author3?.trim() !== '') authors.push(dto.author3!);

    authors.forEach(async (author) => {
      let author_: any = await this.authors.save({ author }).catch(e => console.log('Authors is uniq'))
      if (!author_?.id) {
        const { id } = await this.authors.findOne({ author })
        author_ = { id }
      }
      await this.books_authors.save({ authorId: author_.id, bookId: book.id })
    })
  }


  async getBooks(offset: number, limit: number,) {
    return await this.books.createQueryBuilder('books')
      .select('books.id', 'id')
      .addSelect('name')
      .addSelect('img')
      .addSelect('year')
      .addSelect('size')
      .addSelect('descr')
      .addSelect('deleted')
      .addSelect('clicks')
      .addSelect("group_concat(concat(' ', author))", "authors")
      .innerJoin('books_authors', 'b_a', 'b_a.book_id=books.id')
      .innerJoin('authors', 'a', 'a.id=b_a.author_id')
      .groupBy('books.id')
      .limit(limit)
      .offset(offset).execute().catch(e => console.log(e))
  }


  async lookup(offset: number, limit: number): Promise<number> {

    const counter = await this.books.createQueryBuilder('books')
      .select('id')
      .limit(limit)
      .offset(offset)
      .execute()

    return counter.length as number
  }


  async changeStatus(id: number) {

    return await this.books.createQueryBuilder('books')
      .update(BooksModel)
      .set({
        deleted: () => 'if(deleted = true,false,true)'
      })
      .where('id=:id', { id })
      .execute().catch(e => console.log(e))
  }

  async search(searchParam: string) {
    return await this.books.createQueryBuilder('books')
      .select('books.id', 'id')
      .addSelect('name')
      .addSelect('img')
      .addSelect('year')
      .addSelect('size')
      .addSelect('descr')
      .addSelect('deleted')
      .addSelect('clicks')
      .addSelect("group_concat(concat(' ', author))", "authors")
      .innerJoin('books_authors', 'b_a', 'b_a.book_id=books.id')
      .innerJoin('authors', 'a', 'a.id=b_a.author_id')
      .groupBy('books.id')
      .having("authors like :authors OR name like :name OR year = :year",
        { authors: `%${searchParam}%`, name: `%${searchParam}%`, year: `${searchParam}` })
      .execute().catch(e => console.log(e))
  }


  async findOne(id: number) {

    return await this.books.findOne({ where: { id } });
  }


  async incrementValue(id: number, columnName: string) {

    return await this.books.increment({ id }, columnName, 1);
  }
}
