import { Column, Entity, PrimaryGeneratedColumn, Unique } from 'typeorm';


@Entity({ name: 'books' })
export class BooksModel {

  @Column({ primary: true, generated: true })
  id: number

  @Column({ nullable: false })
  name: string;

  @Column({ nullable: false })
  img: string;

  @Column({ nullable: false })
  year: number;

  @Column({ nullable: false })
  size: number;

  @Column({ nullable: false })
  descr: string;

  @Column({ default: false })
  deleted: boolean;

  @Column({ default: 0 })
  clicks: number

  @Column({ default: 0 })
  visits: number


}
