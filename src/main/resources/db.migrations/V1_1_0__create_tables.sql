create table roles(
id bigserial PRIMARY KEY NOT NULL,
name character varying(255) UNIQUE
);

create table users(
id bigserial PRIMARY KEY NOT NULL,
first_name character varying(255),
last_name character varying(255),
email character varying(255) UNIQUE,
password character varying(120),
);

create table users_roles(
user_id bigint,
role_id bigint
);

create table todo_list(
id bigserial PRIMARY KEY NOT NULL,
user_id bigint,
CONSTRAINT fk_todoList_user
      FOREIGN KEY(user_id)
	  REFERENCES users(id)
);


create table todo_item(
id bigserial PRIMARY KEY NOT NULL,
item character varying(255),
todo_list_id bigint,
CONSTRAINT fk_todoItem_todoList
      FOREIGN KEY(todo_list_id)
	  REFERENCES todo_list(id)
);