import { Injectable } from '@nestjs/common';
import { Cron, CronExpression } from '@nestjs/schedule';
import { InjectRepository } from '@nestjs/typeorm';
import mysqldump from 'mysqldump';
import * as path from 'path';
import { Repository } from 'typeorm';
import { BooksModel } from '../entities/books.model';
import { cwd } from 'process';
const dir = cwd()


@Injectable()
export class TaskService {
  constructor(@InjectRepository(BooksModel) private readonly books: Repository<BooksModel>) { }

  @Cron(CronExpression.EVERY_10_HOURS)
  async dumpingData() {
    try {
      const dumpFileName = `${Math.round(Date.now() / 1000)}dump.sql`

      await mysqldump({
        connection: {
          host: process.env.DB_HOST || 'localhost',
          user: process.env.DB_USER || 'root',
          password: process.env.DB_PASS || 'asd123',
          database: process.env.DB_NAME || 'library_nest',
        },
        dumpToFile: path.join(dir, 'database.dumps', 'dumps', dumpFileName)
      });
      console.log('dumping completed')
    } catch (error) {
      console.log('dumping failed', error)
    }
  }


  @Cron(CronExpression.EVERY_1ST_DAY_OF_MONTH_AT_MIDNIGHT)
  async deleteMarkedAsDeleted() {
    try {
      await this.books.createQueryBuilder('books')
        .delete()
        .from(BooksModel)
        .where('deleted = :deleted', { deleted: true })
        .execute()
      console.log('removingDeleted completed')
    } catch (error) {
      console.log('deleting failed', error);
    }
  }



}
