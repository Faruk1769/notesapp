import { BaseEntity, Column, CreateDateColumn, DeleteDateColumn, Entity, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";

@Entity('notes')

export class Notes extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number

    @Column({ type: "varchar", length: 255,nullable: false})
    userid: string

    @Column({ type: "varchar", length: 255, })
    title: string

    @Column({ type: "varchar", length: 255,})
    content: string

    @CreateDateColumn()
    created_at: Date

    @UpdateDateColumn()
    updated_at: Date

    @DeleteDateColumn()
    deleted_at: Date
}