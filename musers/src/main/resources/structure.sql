PGDMP     7                 	    w            users    11.2    12.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    34493    users    DATABASE     �   CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE users;
             	   adm_users    false            �            1259    68654    address    TABLE     L  CREATE TABLE public.address (
    id bigint NOT NULL,
    complement_street character varying(255),
    complement_street_number character varying(255),
    lattitude character varying(255),
    longitude character varying(255),
    street character varying(255),
    street_number bigint,
    street_type character varying(255)
);
    DROP TABLE public.address;
       public         	   adm_users    false            �            1259    68662    address_city    TABLE     u   CREATE TABLE public.address_city (
    id_address bigint NOT NULL,
    insee_city character varying(255) NOT NULL
);
     DROP TABLE public.address_city;
       public         	   adm_users    false            �            1259    68665    city    TABLE     �   CREATE TABLE public.city (
    insee character varying(255) NOT NULL,
    name character varying(255),
    postal_code character varying(255)
);
    DROP TABLE public.city;
       public         	   adm_users    false            �            1259    68652    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public       	   adm_users    false            �            1259    68673    role    TABLE     z   CREATE TABLE public.role (
    id bigint NOT NULL,
    name character varying(255),
    wording character varying(255)
);
    DROP TABLE public.role;
       public         	   adm_users    false            �            1259    68681    users    TABLE        CREATE TABLE public.users (
    id bigint NOT NULL,
    active boolean NOT NULL,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    phone character varying(255),
    id_address bigint
);
    DROP TABLE public.users;
       public         	   adm_users    false            �            1259    68689 
   users_role    TABLE     ]   CREATE TABLE public.users_role (
    id_user bigint NOT NULL,
    id_role bigint NOT NULL
);
    DROP TABLE public.users_role;
       public         	   adm_users    false                       2606    68661    address address_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public         	   adm_users    false    197                       2606    68672    city city_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (insee);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public         	   adm_users    false    199                       2606    68680    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public         	   adm_users    false    200                       2606    68693 !   users uk6dotkott2kjsp8vw4d0m25fb7 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7;
       public         	   adm_users    false    201                       2606    68688    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         	   adm_users    false    201                       2606    68694 (   address_city fk96vl80h1sqwd8k74ifbnio52y    FK CONSTRAINT     �   ALTER TABLE ONLY public.address_city
    ADD CONSTRAINT fk96vl80h1sqwd8k74ifbnio52y FOREIGN KEY (insee_city) REFERENCES public.city(insee);
 R   ALTER TABLE ONLY public.address_city DROP CONSTRAINT fk96vl80h1sqwd8k74ifbnio52y;
       public       	   adm_users    false    199    2066    198                       2606    68714 &   users_role fkahsq7xiwuf9xb7261rw6bt3ir    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_role
    ADD CONSTRAINT fkahsq7xiwuf9xb7261rw6bt3ir FOREIGN KEY (id_user) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.users_role DROP CONSTRAINT fkahsq7xiwuf9xb7261rw6bt3ir;
       public       	   adm_users    false    202    201    2072                       2606    68699 (   address_city fkiglebsbsr9vdwyia2okldxb0n    FK CONSTRAINT     �   ALTER TABLE ONLY public.address_city
    ADD CONSTRAINT fkiglebsbsr9vdwyia2okldxb0n FOREIGN KEY (id_address) REFERENCES public.address(id);
 R   ALTER TABLE ONLY public.address_city DROP CONSTRAINT fkiglebsbsr9vdwyia2okldxb0n;
       public       	   adm_users    false    2064    198    197                       2606    68709 &   users_role fkjm2d8v3yts0ehg9pmly9hnn43    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_role
    ADD CONSTRAINT fkjm2d8v3yts0ehg9pmly9hnn43 FOREIGN KEY (id_role) REFERENCES public.role(id);
 P   ALTER TABLE ONLY public.users_role DROP CONSTRAINT fkjm2d8v3yts0ehg9pmly9hnn43;
       public       	   adm_users    false    2068    200    202                       2606    68704 !   users fkqn6e1vfgae7l0vdporgpbuhf6    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkqn6e1vfgae7l0vdporgpbuhf6 FOREIGN KEY (id_address) REFERENCES public.address(id);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT fkqn6e1vfgae7l0vdporgpbuhf6;
       public       	   adm_users    false    201    2064    197           