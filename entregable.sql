create table "posts"(
"id_post"SERIAL primary key,
"titulo" varchar,
"id_user" int,
"contenido" text
);

create table "usuarios"(
"id_user" SERIAL primary key,
"nombre" varchar,
"id_role" int,
"email" varchar,
"password" varchar
);

create table "roles"(
"id_role" SERIAL primary key,
"nombre" varchar
);

create table "lista_comentarios"(
"id_lista_comentario" SERIAL primary key,
"id_post" int,
"id_comentario" int
);

create table "comentarios"(
"id_comentario" SERIAL primary key,
"contenido" text,
"id_user" int
);

create table "lista_categorias"(
"id_lista_categorias" SERIAL primary key,
"id_post" int,
"id_categoria" int
);

create table "categorias"(
"id_categoria"SERIAL primary key,
"nombre"varchar
);

alter table posts add foreign key (id_user) references usuarios (id_user);
alter table usuarios add foreign key (id_role) references roles (id_role);
alter table lista_comentarios add foreign key (id_post) references posts (id_post);
alter table lista_comentarios add foreign key (id_comentario) references comentarios (id_comentario);
alter table comentarios add foreign key (id_user) references usuarios (id_user);
alter table lista_categorias add foreign key (id_post) references posts (id_post);
alter table lista_categorias add foreign key (id_categoria) references categorias (id_categoria);

insert into categorias (nombre) values ('Autos'),('Refacciones'),('Piezas');
insert into roles (nombre) values ('Jefe'),('Vendedor'),('Gerente');
insert into usuarios (nombre,id_role,email,password) values ('Bryan',3,'alanm.ceron@gmail.com','gelatina'),('Pepe',2,'pepe@gmail.com','lola'),('Gabriela',1,'gaby@gmail.com','ñoño');
insert into posts (titulo,id_user,contenido) values ('Promociona carros',2,'Promocion de carro para su venta'),('Supervisar',3,'Supervisar el personal'),('Organizar',1,'Organizar todas las operaciones');
insert into comentarios (contenido,id_user) values ('Los mejores carros al mejor precio',2),('Los carros con la mejor calidad',1);
insert into lista_comentarios (id_post,id_comentario) values (2,1),(3,2);
insert into lista_categorias (id_post,id_categoria) values (2,1),(3,3);