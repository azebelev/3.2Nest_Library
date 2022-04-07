import { ConfigService } from '@nestjs/config';
import { MysqlConnectionOptions } from 'typeorm/driver/mysql/MysqlConnectionOptions';
import { UserModel } from '../entities/user.model';
import { BooksModel } from '../entities/books.model';
import { BooksAuthorsModel } from '../entities/books_authors.model';
import { AuthorsModel } from '../entities/authors.model';
import { Connection } from 'typeorm';

export const getMysqlConfig = async (configService: ConfigService): Promise<MysqlConnectionOptions> => {
  return {
    type: 'mysql',
    host: configService.get('HOST'),
    port: 3306,
    username: configService.get('DB_USER'),
    password: configService.get('DB_PASS'),
    database: configService.get('DB_NAME'),
    entities: [UserModel, AuthorsModel, BooksModel, BooksAuthorsModel],
    multipleStatements: true,
    synchronize: false,
  }
}


