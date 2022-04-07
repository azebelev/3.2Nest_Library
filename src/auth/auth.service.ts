import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { compare, genSalt, hash } from 'bcryptjs';
import { Repository } from 'typeorm';
import { AuthDto } from './dto/auth.dto';
import { UserModel } from '../entities/user.model';
import { Response } from 'express';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(UserModel) private readonly userModel: Repository<UserModel>,
    private readonly jwtService: JwtService
  ) { }

  async findUser(login: string) {
    return await this.userModel.findOne({ login });
  }

  async registerUser(dto: AuthDto) {
    const salt = await genSalt(10);
    const newUser = await this.userModel.save({
      login: dto.login,
      passwordHash: await hash(dto.password, salt)
    });

    return newUser;
  }

  async validateUser(dto: AuthDto) {
    const user = await this.userModel.findOne({ login: dto.login })
    if (!user) {
      throw new UnauthorizedException('Данный пользователь не зарегистрирован');
    }
    const isConfirmed = await compare(dto.password, user.passwordHash)
    if (!isConfirmed) {
      throw new UnauthorizedException('Неверный пароль пользователя');
    }
    return user.login;
  }
  async login(login: string) {
    const payload = { login };
    return await this.jwtService.signAsync(payload)
  }
}
