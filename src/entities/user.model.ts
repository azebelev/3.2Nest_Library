import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity({ name: 'users' })
export class UserModel {

  @PrimaryColumn()
  login: string;

  @Column()
  passwordHash: string;
}