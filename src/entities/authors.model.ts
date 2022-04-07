import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'authors' })
export class AuthorsModel {

  @Column({ primary: true, generated: true })
  id: number;

  @Column({ unique: true })
  author: string;

}
