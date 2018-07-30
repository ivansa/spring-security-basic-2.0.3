CREATE TABLE `permission` (
    id varchar(36) NOT NULL,
    permission_label varchar(100) NOT NULL,
    permission_value varchar(50) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (permission_label),
    UNIQUE (permission_value)
);

CREATE TABLE `role` (
    id varchar(36) NOT NULL,
    description varchar(50),
    name varchar(15) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE `role_permission` (
    id_role varchar(36) NOT NULL,
    id_permission varchar(36) NOT NULL,
    PRIMARY KEY (id_role, id_permission)
);

CREATE TABLE `user` (
    id varchar(36) NOT NULL,
    active boolean,
    username varchar(255) NOT NULL,
    id_role varchar(36) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (username)
);

CREATE TABLE `user_password` (
    id_user varchar(36) NOT NULL,
    password varchar(255),
    PRIMARY KEY (id_user)
);


INSERT INTO `permission` (id, permission_label, permission_value) VALUES
('USER_LOGGED_IN', 'GET DATA USER', 'ROLE_USER_VIEW');

INSERT INTO `role` (id, description, name) VALUES
('ADMINISTRATOR', 'Application Administrator', 'Administrator');

INSERT INTO `role_permission` (id_role, id_permission) VALUES
('ADMINISTRATOR', 'USER_LOGGED_IN');

INSERT INTO `user` (id, active, username, id_role) VALUES
('admin', true, 'admin', 'ADMINISTRATOR');

INSERT INTO `user_password` (id_user, password) VALUES
('admin', '{bcrypt}$2a$08$LS3sz9Ft014MNaIGCEyt4u6VflkslOW/xosyRbinIF9.uaVLpEhB6');