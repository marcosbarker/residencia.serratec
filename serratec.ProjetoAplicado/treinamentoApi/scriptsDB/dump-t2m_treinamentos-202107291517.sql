toc.dat                                                                                             0000600 0004000 0002000 00000123537 14100570234 0014446 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                            y            t2m_treinamentos    9.6.21    9.6.21 �    (	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         )	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         *	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         +	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3         �            1259    25938    certificacoes    TABLE     �   CREATE TABLE public.certificacoes (
    id integer NOT NULL,
    tempo_validade numeric NOT NULL,
    id_treinamento integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 !   DROP TABLE public.certificacoes;
       public         postgres    false    3         �            1259    25936    certificacoes_id_seq    SEQUENCE     }   CREATE SEQUENCE public.certificacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.certificacoes_id_seq;
       public       postgres    false    193    3         ,	           0    0    certificacoes_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.certificacoes_id_seq OWNED BY public.certificacoes.id;
            public       postgres    false    192         �            1259    25885    colaboradores    TABLE     �  CREATE TABLE public.colaboradores (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    data_nascimento date,
    email character varying(30),
    pix character varying(40),
    cpf character varying(14) NOT NULL,
    rg character varying(12) NOT NULL,
    cnh character varying(1) NOT NULL,
    id_posicao integer,
    isativo integer NOT NULL,
    permissao integer NOT NULL,
    CONSTRAINT cnh CHECK ((((cnh)::text = 'A'::text) OR ((cnh)::text = 'B'::text) OR ((cnh)::text = 'C'::text) OR ((cnh)::text = 'D'::text) OR ((cnh)::text = 'E'::text) OR ((cnh)::text = 'N'::text))),
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1))),
    CONSTRAINT permissao CHECK (((permissao = 0) OR (permissao = 1) OR (permissao = 2)))
);
 !   DROP TABLE public.colaboradores;
       public         postgres    false    3         �            1259    25947    colaboradores_certificacoes    TABLE     �   CREATE TABLE public.colaboradores_certificacoes (
    id_colaborador integer,
    id_certificacao integer,
    data_obtencao date NOT NULL,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 /   DROP TABLE public.colaboradores_certificacoes;
       public         postgres    false    3         �            1259    25908    colaboradores_enderecos    TABLE     �   CREATE TABLE public.colaboradores_enderecos (
    id_colaborador integer,
    id_endereco integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 +   DROP TABLE public.colaboradores_enderecos;
       public         postgres    false    3         �            1259    26077    colaboradores_formacoes    TABLE     �   CREATE TABLE public.colaboradores_formacoes (
    id_colaborador integer,
    id_formacao integer,
    data_entrada date NOT NULL,
    data_conclusao date,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 +   DROP TABLE public.colaboradores_formacoes;
       public         postgres    false    3         �            1259    25883    colaboradores_id_seq    SEQUENCE     }   CREATE SEQUENCE public.colaboradores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.colaboradores_id_seq;
       public       postgres    false    3    186         -	           0    0    colaboradores_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.colaboradores_id_seq OWNED BY public.colaboradores.id;
            public       postgres    false    185         �            1259    26032    colaboradores_projetos    TABLE     !  CREATE TABLE public.colaboradores_projetos (
    id_colaborador integer,
    id_projeto integer,
    funcao character varying(25) NOT NULL,
    data_inicio date NOT NULL,
    data_saida date,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 *   DROP TABLE public.colaboradores_projetos;
       public         postgres    false    3         �            1259    25971    colaboradores_treinamentos    TABLE     �   CREATE TABLE public.colaboradores_treinamentos (
    id_colaborador integer,
    id_treinamento integer,
    status character varying(20),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 .   DROP TABLE public.colaboradores_treinamentos;
       public         postgres    false    3         �            1259    25986    competencias    TABLE     �   CREATE TABLE public.competencias (
    id integer NOT NULL,
    nome character varying(25) NOT NULL,
    descricao character varying(255),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
     DROP TABLE public.competencias;
       public         postgres    false    3         �            1259    26000    competencias_conhecimentos    TABLE     �   CREATE TABLE public.competencias_conhecimentos (
    id_competencia integer,
    id_conhecimento integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 .   DROP TABLE public.competencias_conhecimentos;
       public         postgres    false    3         �            1259    25984    competencias_id_seq    SEQUENCE     |   CREATE SEQUENCE public.competencias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.competencias_id_seq;
       public       postgres    false    199    3         .	           0    0    competencias_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.competencias_id_seq OWNED BY public.competencias.id;
            public       postgres    false    198         �            1259    26115    competencias_niveis    TABLE     �   CREATE TABLE public.competencias_niveis (
    id_competencia integer,
    id_nivel integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 '   DROP TABLE public.competencias_niveis;
       public         postgres    false    3         �            1259    25994    conhecimentos    TABLE     �   CREATE TABLE public.conhecimentos (
    id integer NOT NULL,
    nome character varying(25) NOT NULL,
    descricao character varying(255),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 !   DROP TABLE public.conhecimentos;
       public         postgres    false    3         �            1259    25992    conhecimentos_id_seq    SEQUENCE     }   CREATE SEQUENCE public.conhecimentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.conhecimentos_id_seq;
       public       postgres    false    3    201         /	           0    0    conhecimentos_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.conhecimentos_id_seq OWNED BY public.conhecimentos.id;
            public       postgres    false    200         �            1259    26128    conhecimentos_niveis    TABLE     �   CREATE TABLE public.conhecimentos_niveis (
    id_conhecimento integer,
    id_nivel integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 (   DROP TABLE public.conhecimentos_niveis;
       public         postgres    false    3         �            1259    26090    conhecimentos_treinamentos    TABLE     �   CREATE TABLE public.conhecimentos_treinamentos (
    id_conhecimento integer,
    id_treinamento integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 .   DROP TABLE public.conhecimentos_treinamentos;
       public         postgres    false    3         �            1259    25902 	   enderecos    TABLE     �  CREATE TABLE public.enderecos (
    id integer NOT NULL,
    cep character varying(12) NOT NULL,
    rua character varying(100),
    numero character varying(10),
    complemento character varying(15),
    bairro character varying(50),
    cidade character varying(50),
    estado character varying(2),
    pais character varying(15),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
    DROP TABLE public.enderecos;
       public         postgres    false    3         �            1259    25900    enderecos_id_seq    SEQUENCE     y   CREATE SEQUENCE public.enderecos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.enderecos_id_seq;
       public       postgres    false    3    188         0	           0    0    enderecos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.enderecos_id_seq OWNED BY public.enderecos.id;
            public       postgres    false    187         �            1259    26071 	   formacoes    TABLE       CREATE TABLE public.formacoes (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    nivel character varying(50) NOT NULL,
    instituicao character varying(30) NOT NULL,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
    DROP TABLE public.formacoes;
       public         postgres    false    3         �            1259    26069    formacoes_id_seq    SEQUENCE     y   CREATE SEQUENCE public.formacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.formacoes_id_seq;
       public       postgres    false    210    3         1	           0    0    formacoes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.formacoes_id_seq OWNED BY public.formacoes.id;
            public       postgres    false    209         �            1259    26109    niveis    TABLE     �   CREATE TABLE public.niveis (
    id integer NOT NULL,
    nivel character varying(50),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
    DROP TABLE public.niveis;
       public         postgres    false    3         �            1259    26107    niveis_id_seq    SEQUENCE     v   CREATE SEQUENCE public.niveis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.niveis_id_seq;
       public       postgres    false    214    3         2	           0    0    niveis_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.niveis_id_seq OWNED BY public.niveis.id;
            public       postgres    false    213         �            1259    26015    posicoes    TABLE     �   CREATE TABLE public.posicoes (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    descricao character varying(255),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
    DROP TABLE public.posicoes;
       public         postgres    false    3         �            1259    26056    posicoes_competencias    TABLE     �   CREATE TABLE public.posicoes_competencias (
    id_posicao integer,
    id_competencia integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
 )   DROP TABLE public.posicoes_competencias;
       public         postgres    false    3         �            1259    26013    posicoes_id_seq    SEQUENCE     x   CREATE SEQUENCE public.posicoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.posicoes_id_seq;
       public       postgres    false    204    3         3	           0    0    posicoes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.posicoes_id_seq OWNED BY public.posicoes.id;
            public       postgres    false    203         �            1259    26023    projetos    TABLE     �  CREATE TABLE public.projetos (
    id integer NOT NULL,
    nome character varying(25) NOT NULL,
    descricao character varying(255),
    app_gerenciamento character varying(255),
    segmento character varying(50),
    data_entrega_esperada date NOT NULL,
    data_entrega date,
    equipe integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
    DROP TABLE public.projetos;
       public         postgres    false    3         �            1259    26021    projetos_id_seq    SEQUENCE     x   CREATE SEQUENCE public.projetos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.projetos_id_seq;
       public       postgres    false    206    3         4	           0    0    projetos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.projetos_id_seq OWNED BY public.projetos.id;
            public       postgres    false    205         �            1259    25962    treinamentos    TABLE     A  CREATE TABLE public.treinamentos (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    instituicao character varying(25) NOT NULL,
    carga_horaria numeric NOT NULL,
    descricao character varying(255),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
     DROP TABLE public.treinamentos;
       public         postgres    false    3         �            1259    25960    treinamentos_id_seq    SEQUENCE     |   CREATE SEQUENCE public.treinamentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.treinamentos_id_seq;
       public       postgres    false    3    196         5	           0    0    treinamentos_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.treinamentos_id_seq OWNED BY public.treinamentos.id;
            public       postgres    false    195         �            1259    25923    usuarios    TABLE     `  CREATE TABLE public.usuarios (
    id integer NOT NULL,
    id_colaborador integer,
    usuario character varying(20) NOT NULL,
    senha character varying(8) NOT NULL,
    isadmin integer,
    isativo integer NOT NULL,
    CONSTRAINT isadmin CHECK (((isadmin = 0) OR (isadmin = 1))),
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);
    DROP TABLE public.usuarios;
       public         postgres    false    3         �            1259    25921    usuarios_id_seq    SEQUENCE     x   CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public       postgres    false    191    3         6	           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
            public       postgres    false    190         C           2604    25941    certificacoes id    DEFAULT     t   ALTER TABLE ONLY public.certificacoes ALTER COLUMN id SET DEFAULT nextval('public.certificacoes_id_seq'::regclass);
 ?   ALTER TABLE public.certificacoes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    193    193         9           2604    25888    colaboradores id    DEFAULT     t   ALTER TABLE ONLY public.colaboradores ALTER COLUMN id SET DEFAULT nextval('public.colaboradores_id_seq'::regclass);
 ?   ALTER TABLE public.colaboradores ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    185    186         I           2604    25989    competencias id    DEFAULT     r   ALTER TABLE ONLY public.competencias ALTER COLUMN id SET DEFAULT nextval('public.competencias_id_seq'::regclass);
 >   ALTER TABLE public.competencias ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199         K           2604    25997    conhecimentos id    DEFAULT     t   ALTER TABLE ONLY public.conhecimentos ALTER COLUMN id SET DEFAULT nextval('public.conhecimentos_id_seq'::regclass);
 ?   ALTER TABLE public.conhecimentos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201         =           2604    25905    enderecos id    DEFAULT     l   ALTER TABLE ONLY public.enderecos ALTER COLUMN id SET DEFAULT nextval('public.enderecos_id_seq'::regclass);
 ;   ALTER TABLE public.enderecos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    187    188         T           2604    26074    formacoes id    DEFAULT     l   ALTER TABLE ONLY public.formacoes ALTER COLUMN id SET DEFAULT nextval('public.formacoes_id_seq'::regclass);
 ;   ALTER TABLE public.formacoes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    210    210         X           2604    26112 	   niveis id    DEFAULT     f   ALTER TABLE ONLY public.niveis ALTER COLUMN id SET DEFAULT nextval('public.niveis_id_seq'::regclass);
 8   ALTER TABLE public.niveis ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    213    214         N           2604    26018    posicoes id    DEFAULT     j   ALTER TABLE ONLY public.posicoes ALTER COLUMN id SET DEFAULT nextval('public.posicoes_id_seq'::regclass);
 :   ALTER TABLE public.posicoes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    204    204         P           2604    26026    projetos id    DEFAULT     j   ALTER TABLE ONLY public.projetos ALTER COLUMN id SET DEFAULT nextval('public.projetos_id_seq'::regclass);
 :   ALTER TABLE public.projetos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    205    206         F           2604    25965    treinamentos id    DEFAULT     r   ALTER TABLE ONLY public.treinamentos ALTER COLUMN id SET DEFAULT nextval('public.treinamentos_id_seq'::regclass);
 >   ALTER TABLE public.treinamentos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    195    196         @           2604    25926    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190    191         	          0    25938    certificacoes 
   TABLE DATA               T   COPY public.certificacoes (id, tempo_validade, id_treinamento, isativo) FROM stdin;
    public       postgres    false    193       2318.dat 7	           0    0    certificacoes_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.certificacoes_id_seq', 6, true);
            public       postgres    false    192         	          0    25885    colaboradores 
   TABLE DATA               |   COPY public.colaboradores (id, nome, data_nascimento, email, pix, cpf, rg, cnh, id_posicao, isativo, permissao) FROM stdin;
    public       postgres    false    186       2311.dat 	          0    25947    colaboradores_certificacoes 
   TABLE DATA               n   COPY public.colaboradores_certificacoes (id_colaborador, id_certificacao, data_obtencao, isativo) FROM stdin;
    public       postgres    false    194       2319.dat 
	          0    25908    colaboradores_enderecos 
   TABLE DATA               W   COPY public.colaboradores_enderecos (id_colaborador, id_endereco, isativo) FROM stdin;
    public       postgres    false    189       2314.dat  	          0    26077    colaboradores_formacoes 
   TABLE DATA               u   COPY public.colaboradores_formacoes (id_colaborador, id_formacao, data_entrada, data_conclusao, isativo) FROM stdin;
    public       postgres    false    211       2336.dat 8	           0    0    colaboradores_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.colaboradores_id_seq', 30, true);
            public       postgres    false    185         	          0    26032    colaboradores_projetos 
   TABLE DATA               v   COPY public.colaboradores_projetos (id_colaborador, id_projeto, funcao, data_inicio, data_saida, isativo) FROM stdin;
    public       postgres    false    207       2332.dat 	          0    25971    colaboradores_treinamentos 
   TABLE DATA               e   COPY public.colaboradores_treinamentos (id_colaborador, id_treinamento, status, isativo) FROM stdin;
    public       postgres    false    197       2322.dat 	          0    25986    competencias 
   TABLE DATA               D   COPY public.competencias (id, nome, descricao, isativo) FROM stdin;
    public       postgres    false    199       2324.dat 	          0    26000    competencias_conhecimentos 
   TABLE DATA               ^   COPY public.competencias_conhecimentos (id_competencia, id_conhecimento, isativo) FROM stdin;
    public       postgres    false    202       2327.dat 9	           0    0    competencias_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.competencias_id_seq', 5, true);
            public       postgres    false    198         $	          0    26115    competencias_niveis 
   TABLE DATA               P   COPY public.competencias_niveis (id_competencia, id_nivel, isativo) FROM stdin;
    public       postgres    false    215       2340.dat 	          0    25994    conhecimentos 
   TABLE DATA               E   COPY public.conhecimentos (id, nome, descricao, isativo) FROM stdin;
    public       postgres    false    201       2326.dat :	           0    0    conhecimentos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.conhecimentos_id_seq', 5, true);
            public       postgres    false    200         %	          0    26128    conhecimentos_niveis 
   TABLE DATA               R   COPY public.conhecimentos_niveis (id_conhecimento, id_nivel, isativo) FROM stdin;
    public       postgres    false    216       2341.dat !	          0    26090    conhecimentos_treinamentos 
   TABLE DATA               ^   COPY public.conhecimentos_treinamentos (id_conhecimento, id_treinamento, isativo) FROM stdin;
    public       postgres    false    212       2337.dat 		          0    25902 	   enderecos 
   TABLE DATA               m   COPY public.enderecos (id, cep, rua, numero, complemento, bairro, cidade, estado, pais, isativo) FROM stdin;
    public       postgres    false    188       2313.dat ;	           0    0    enderecos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.enderecos_id_seq', 7, true);
            public       postgres    false    187         	          0    26071 	   formacoes 
   TABLE DATA               J   COPY public.formacoes (id, nome, nivel, instituicao, isativo) FROM stdin;
    public       postgres    false    210       2335.dat <	           0    0    formacoes_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.formacoes_id_seq', 8, true);
            public       postgres    false    209         #	          0    26109    niveis 
   TABLE DATA               4   COPY public.niveis (id, nivel, isativo) FROM stdin;
    public       postgres    false    214       2339.dat =	           0    0    niveis_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.niveis_id_seq', 4, true);
            public       postgres    false    213         	          0    26015    posicoes 
   TABLE DATA               @   COPY public.posicoes (id, nome, descricao, isativo) FROM stdin;
    public       postgres    false    204       2329.dat 	          0    26056    posicoes_competencias 
   TABLE DATA               T   COPY public.posicoes_competencias (id_posicao, id_competencia, isativo) FROM stdin;
    public       postgres    false    208       2333.dat >	           0    0    posicoes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.posicoes_id_seq', 5, true);
            public       postgres    false    203         	          0    26023    projetos 
   TABLE DATA               �   COPY public.projetos (id, nome, descricao, app_gerenciamento, segmento, data_entrega_esperada, data_entrega, equipe, isativo) FROM stdin;
    public       postgres    false    206       2331.dat ?	           0    0    projetos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.projetos_id_seq', 9, true);
            public       postgres    false    205         	          0    25962    treinamentos 
   TABLE DATA               `   COPY public.treinamentos (id, nome, instituicao, carga_horaria, descricao, isativo) FROM stdin;
    public       postgres    false    196       2321.dat @	           0    0    treinamentos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.treinamentos_id_seq', 5, true);
            public       postgres    false    195         	          0    25923    usuarios 
   TABLE DATA               X   COPY public.usuarios (id, id_colaborador, usuario, senha, isadmin, isativo) FROM stdin;
    public       postgres    false    191       2316.dat A	           0    0    usuarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usuarios_id_seq', 11, true);
            public       postgres    false    190         k           2606    25946     certificacoes certificacoes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.certificacoes
    ADD CONSTRAINT certificacoes_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.certificacoes DROP CONSTRAINT certificacoes_pkey;
       public         postgres    false    193    193         ]           2606    25897 #   colaboradores colaboradores_cpf_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_cpf_key UNIQUE (cpf);
 M   ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_cpf_key;
       public         postgres    false    186    186         _           2606    25895 #   colaboradores colaboradores_pix_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_pix_key UNIQUE (pix);
 M   ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_pix_key;
       public         postgres    false    186    186         a           2606    25893     colaboradores colaboradores_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_pkey;
       public         postgres    false    186    186         c           2606    25899 "   colaboradores colaboradores_rg_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_rg_key UNIQUE (rg);
 L   ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_rg_key;
       public         postgres    false    186    186         o           2606    25991    competencias competencias_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.competencias
    ADD CONSTRAINT competencias_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.competencias DROP CONSTRAINT competencias_pkey;
       public         postgres    false    199    199         q           2606    25999     conhecimentos conhecimentos_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.conhecimentos
    ADD CONSTRAINT conhecimentos_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.conhecimentos DROP CONSTRAINT conhecimentos_pkey;
       public         postgres    false    201    201         e           2606    25907    enderecos enderecos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.enderecos DROP CONSTRAINT enderecos_pkey;
       public         postgres    false    188    188         w           2606    26076    formacoes formacoes_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.formacoes
    ADD CONSTRAINT formacoes_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.formacoes DROP CONSTRAINT formacoes_pkey;
       public         postgres    false    210    210         y           2606    26114    niveis niveis_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.niveis
    ADD CONSTRAINT niveis_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.niveis DROP CONSTRAINT niveis_pkey;
       public         postgres    false    214    214         s           2606    26020    posicoes posicoes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.posicoes
    ADD CONSTRAINT posicoes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.posicoes DROP CONSTRAINT posicoes_pkey;
       public         postgres    false    204    204         u           2606    26031    projetos projetos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.projetos
    ADD CONSTRAINT projetos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.projetos DROP CONSTRAINT projetos_pkey;
       public         postgres    false    206    206         m           2606    25970    treinamentos treinamentos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.treinamentos
    ADD CONSTRAINT treinamentos_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.treinamentos DROP CONSTRAINT treinamentos_pkey;
       public         postgres    false    196    196         g           2606    25928    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    191    191         i           2606    26105    usuarios usuarios_usuario_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);
 G   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_usuario_key;
       public         postgres    false    191    191         ~           2606    26050 /   certificacoes certificacoes_id_treinamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.certificacoes
    ADD CONSTRAINT certificacoes_id_treinamento_fkey FOREIGN KEY (id_treinamento) REFERENCES public.treinamentos(id);
 Y   ALTER TABLE ONLY public.certificacoes DROP CONSTRAINT certificacoes_id_treinamento_fkey;
       public       postgres    false    2157    193    196         �           2606    25955 L   colaboradores_certificacoes colaboradores_certificacoes_id_certificacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores_certificacoes
    ADD CONSTRAINT colaboradores_certificacoes_id_certificacao_fkey FOREIGN KEY (id_certificacao) REFERENCES public.certificacoes(id);
 v   ALTER TABLE ONLY public.colaboradores_certificacoes DROP CONSTRAINT colaboradores_certificacoes_id_certificacao_fkey;
       public       postgres    false    194    193    2155                    2606    25950 K   colaboradores_certificacoes colaboradores_certificacoes_id_colaborador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores_certificacoes
    ADD CONSTRAINT colaboradores_certificacoes_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);
 u   ALTER TABLE ONLY public.colaboradores_certificacoes DROP CONSTRAINT colaboradores_certificacoes_id_colaborador_fkey;
       public       postgres    false    186    194    2145         {           2606    25911 C   colaboradores_enderecos colaboradores_enderecos_id_colaborador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores_enderecos
    ADD CONSTRAINT colaboradores_enderecos_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);
 m   ALTER TABLE ONLY public.colaboradores_enderecos DROP CONSTRAINT colaboradores_enderecos_id_colaborador_fkey;
       public       postgres    false    186    2145    189         |           2606    25916 @   colaboradores_enderecos colaboradores_enderecos_id_endereco_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores_enderecos
    ADD CONSTRAINT colaboradores_enderecos_id_endereco_fkey FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id);
 j   ALTER TABLE ONLY public.colaboradores_enderecos DROP CONSTRAINT colaboradores_enderecos_id_endereco_fkey;
       public       postgres    false    2149    188    189         �           2606    26080 C   colaboradores_formacoes colaboradores_formacoes_id_colaborador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores_formacoes
    ADD CONSTRAINT colaboradores_formacoes_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);
 m   ALTER TABLE ONLY public.colaboradores_formacoes DROP CONSTRAINT colaboradores_formacoes_id_colaborador_fkey;
       public       postgres    false    2145    211    186         �           2606    26085 @   colaboradores_formacoes colaboradores_formacoes_id_formacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores_formacoes
    ADD CONSTRAINT colaboradores_formacoes_id_formacao_fkey FOREIGN KEY (id_formacao) REFERENCES public.formacoes(id);
 j   ALTER TABLE ONLY public.colaboradores_formacoes DROP CONSTRAINT colaboradores_formacoes_id_formacao_fkey;
       public       postgres    false    2167    211    210         z           2606    26045 +   colaboradores colaboradores_id_posicao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_id_posicao_fkey FOREIGN KEY (id_posicao) REFERENCES public.posicoes(id);
 U   ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_id_posicao_fkey;
       public       postgres    false    186    2163    204         �           2606    26035 A   colaboradores_projetos colaboradores_projetos_id_colaborador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores_projetos
    ADD CONSTRAINT colaboradores_projetos_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);
 k   ALTER TABLE ONLY public.colaboradores_projetos DROP CONSTRAINT colaboradores_projetos_id_colaborador_fkey;
       public       postgres    false    207    186    2145         �           2606    26040 =   colaboradores_projetos colaboradores_projetos_id_projeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores_projetos
    ADD CONSTRAINT colaboradores_projetos_id_projeto_fkey FOREIGN KEY (id_projeto) REFERENCES public.projetos(id);
 g   ALTER TABLE ONLY public.colaboradores_projetos DROP CONSTRAINT colaboradores_projetos_id_projeto_fkey;
       public       postgres    false    207    2165    206         �           2606    25974 I   colaboradores_treinamentos colaboradores_treinamentos_id_colaborador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores_treinamentos
    ADD CONSTRAINT colaboradores_treinamentos_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);
 s   ALTER TABLE ONLY public.colaboradores_treinamentos DROP CONSTRAINT colaboradores_treinamentos_id_colaborador_fkey;
       public       postgres    false    186    2145    197         �           2606    25979 I   colaboradores_treinamentos colaboradores_treinamentos_id_treinamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaboradores_treinamentos
    ADD CONSTRAINT colaboradores_treinamentos_id_treinamento_fkey FOREIGN KEY (id_treinamento) REFERENCES public.treinamentos(id);
 s   ALTER TABLE ONLY public.colaboradores_treinamentos DROP CONSTRAINT colaboradores_treinamentos_id_treinamento_fkey;
       public       postgres    false    2157    197    196         �           2606    26003 I   competencias_conhecimentos competencias_conhecimentos_id_competencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.competencias_conhecimentos
    ADD CONSTRAINT competencias_conhecimentos_id_competencia_fkey FOREIGN KEY (id_competencia) REFERENCES public.competencias(id);
 s   ALTER TABLE ONLY public.competencias_conhecimentos DROP CONSTRAINT competencias_conhecimentos_id_competencia_fkey;
       public       postgres    false    202    199    2159         �           2606    26008 J   competencias_conhecimentos competencias_conhecimentos_id_conhecimento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.competencias_conhecimentos
    ADD CONSTRAINT competencias_conhecimentos_id_conhecimento_fkey FOREIGN KEY (id_conhecimento) REFERENCES public.conhecimentos(id);
 t   ALTER TABLE ONLY public.competencias_conhecimentos DROP CONSTRAINT competencias_conhecimentos_id_conhecimento_fkey;
       public       postgres    false    202    201    2161         �           2606    26118 ;   competencias_niveis competencias_niveis_id_competencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.competencias_niveis
    ADD CONSTRAINT competencias_niveis_id_competencia_fkey FOREIGN KEY (id_competencia) REFERENCES public.competencias(id);
 e   ALTER TABLE ONLY public.competencias_niveis DROP CONSTRAINT competencias_niveis_id_competencia_fkey;
       public       postgres    false    2159    215    199         �           2606    26123 5   competencias_niveis competencias_niveis_id_nivel_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.competencias_niveis
    ADD CONSTRAINT competencias_niveis_id_nivel_fkey FOREIGN KEY (id_nivel) REFERENCES public.niveis(id);
 _   ALTER TABLE ONLY public.competencias_niveis DROP CONSTRAINT competencias_niveis_id_nivel_fkey;
       public       postgres    false    2169    215    214         �           2606    26131 >   conhecimentos_niveis conhecimentos_niveis_id_conhecimento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conhecimentos_niveis
    ADD CONSTRAINT conhecimentos_niveis_id_conhecimento_fkey FOREIGN KEY (id_conhecimento) REFERENCES public.conhecimentos(id);
 h   ALTER TABLE ONLY public.conhecimentos_niveis DROP CONSTRAINT conhecimentos_niveis_id_conhecimento_fkey;
       public       postgres    false    2161    216    201         �           2606    26136 7   conhecimentos_niveis conhecimentos_niveis_id_nivel_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conhecimentos_niveis
    ADD CONSTRAINT conhecimentos_niveis_id_nivel_fkey FOREIGN KEY (id_nivel) REFERENCES public.niveis(id);
 a   ALTER TABLE ONLY public.conhecimentos_niveis DROP CONSTRAINT conhecimentos_niveis_id_nivel_fkey;
       public       postgres    false    216    2169    214         �           2606    26093 J   conhecimentos_treinamentos conhecimentos_treinamentos_id_conhecimento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conhecimentos_treinamentos
    ADD CONSTRAINT conhecimentos_treinamentos_id_conhecimento_fkey FOREIGN KEY (id_conhecimento) REFERENCES public.conhecimentos(id);
 t   ALTER TABLE ONLY public.conhecimentos_treinamentos DROP CONSTRAINT conhecimentos_treinamentos_id_conhecimento_fkey;
       public       postgres    false    201    212    2161         �           2606    26098 I   conhecimentos_treinamentos conhecimentos_treinamentos_id_treinamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conhecimentos_treinamentos
    ADD CONSTRAINT conhecimentos_treinamentos_id_treinamento_fkey FOREIGN KEY (id_treinamento) REFERENCES public.treinamentos(id);
 s   ALTER TABLE ONLY public.conhecimentos_treinamentos DROP CONSTRAINT conhecimentos_treinamentos_id_treinamento_fkey;
       public       postgres    false    196    212    2157         �           2606    26064 ?   posicoes_competencias posicoes_competencias_id_competencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posicoes_competencias
    ADD CONSTRAINT posicoes_competencias_id_competencia_fkey FOREIGN KEY (id_competencia) REFERENCES public.competencias(id);
 i   ALTER TABLE ONLY public.posicoes_competencias DROP CONSTRAINT posicoes_competencias_id_competencia_fkey;
       public       postgres    false    199    208    2159         �           2606    26059 ;   posicoes_competencias posicoes_competencias_id_posicao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posicoes_competencias
    ADD CONSTRAINT posicoes_competencias_id_posicao_fkey FOREIGN KEY (id_posicao) REFERENCES public.posicoes(id);
 e   ALTER TABLE ONLY public.posicoes_competencias DROP CONSTRAINT posicoes_competencias_id_posicao_fkey;
       public       postgres    false    204    208    2163         }           2606    25931 %   usuarios usuarios_id_colaborador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);
 O   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_id_colaborador_fkey;
       public       postgres    false    2145    191    186                                                                                                                                                                         2318.dat                                                                                            0000600 0004000 0002000 00000000055 14100570234 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	0	1	1
3	0	2	1
4	0	3	1
5	0	4	1
6	2	5	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   2311.dat                                                                                            0000600 0004000 0002000 00000003150 14100570234 0014233 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Eloá Bruna Lúcia Nunes	1949-07-09	eloa.nunes@email.com	eloa.nunes@email.com	793.077.779-00	30.603.488-8	B	4	1	1
25	Renato Silva	1984-09-19	renato.silva@email.com	renato.silva@email.com	123.455.789-12	12.344.677-0	N	\N	0	0
26	Renato Bezerra	1984-09-19	renato.bezerra@email.com	renato.bezerra@email.com	123.355.789-12	12.343.677-0	N	\N	0	1
8	João Paulo	1995-04-03	joao.paulo@email.com	joao.paulo@email.com	123.456.789-01	12.345.678-0	N	2	1	0
27	Bob Bezerra	1984-09-19	bob.bezerra@email.com	bob.bezerra@email.com	123.355.759-12	12.343.675-5	N	\N	1	1
28	Thiago Bezerra	1984-09-19	thiago.bezerra@email.com	thiago.bezerra@email.com	323.955.966-12	12.333.665-6	N	\N	1	1
29	Bob Rob	1984-09-19	bob.rob@email.com	bob.rob@email.com	444.955.966-12	44.333.665-6	N	\N	1	1
7	Ian Alt	1998-06-02	ian.alt@email.com	ian.alt@email.com	123.456.789-00	12.345.678-9	N	2	1	0
3	Melissa Fátima Isabella Vieira	1959-11-12	melissa.vieira@email.com	806.492.510-08	806.492.510-08	12.226.154-9	B	3	1	0
5	Sérgio Márcio Castro	1995-07-02	sergio.castro@email.com	402.991.554-04	402.991.554-04	27.057.408-6	A	3	1	0
2	Hugo Pedro Henrique Bernardo Martins	1948-01-25	hugo.martins@email.com	hugo.martins@email.com	728.512.147-99	19.393.303-2	B	4	1	1
22	Renato Gomes	1987-09-19	renato.gomes@email.com	renato.gomes@email.com	123.456.789-12	12.349.677-0	N	3	1	1
21	Ian Paulo	1996-04-23	ian.paulo@email.com	ian.paulo@email.com	123.456.789-11	12.345.677-0	N	3	0	1
4	Kaique Raul Oliveira	1997-05-02	kaique.oliveira@email.com	958.621.186-08	958.621.186-08	38.322.163-8	N	2	1	0
30	Bob Bob	1982-09-19	bob.bob@email.com	bob.bob@email.com	464.955.966-12	66.333.665-6	N	\N	1	0
\.


                                                                                                                                                                                                                                                                                                                                                                                                                        2319.dat                                                                                            0000600 0004000 0002000 00000000531 14100570234 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	6	2015-07-20	1
1	2	2021-07-20	1
1	3	2021-07-20	1
1	4	2021-07-20	1
1	5	2021-07-20	1
2	6	2015-04-13	1
2	2	2021-04-13	1
2	3	2021-04-13	1
2	4	2021-04-13	1
2	5	2021-04-13	1
3	6	2018-02-17	1
3	2	2018-02-17	1
3	3	2018-02-17	1
3	4	2018-02-17	1
3	5	2018-02-17	1
4	6	2019-08-14	1
4	2	2019-08-14	1
4	3	2019-08-14	1
4	4	2019-08-14	1
4	5	2019-08-14	1
\.


                                                                                                                                                                       2314.dat                                                                                            0000600 0004000 0002000 00000000074 14100570234 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	2	1
3	3	1
4	4	1
5	5	1
7	1	1
7	2	1
21	7	0
1	1	1
8	1	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                    2336.dat                                                                                            0000600 0004000 0002000 00000000316 14100570234 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	2	2011-02-01	2016-12-11	1
3	3	2009-02-03	2014-12-12	1
4	4	2018-03-05	\N	1
5	5	2010-02-02	2015-12-10	1
7	4	2016-02-05	\N	1
21	8	2014-02-02	\N	0
1	1	1994-02-08	1999-12-16	1
8	7	2012-03-05	2017-03-05	1
\.


                                                                                                                                                                                                                                                                                                                  2332.dat                                                                                            0000600 0004000 0002000 00000000446 14100570234 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	3	Gerente do projeto	2021-04-27	\N	1
5	3	Desenvolvedor back-end	2021-04-28	\N	1
4	2	Desenvolvedor mobile	2021-04-30	2021-08-26	1
2	2	Gerente do projeto	2021-04-25	\N	1
7	1	Assistente	2021-03-10	2021-11-15	1
21	9	DBA	2021-04-02	2021-11-12	0
1	1	Gerente do projeto	2021-03-10	2021-12-22	1
\.


                                                                                                                                                                                                                          2322.dat                                                                                            0000600 0004000 0002000 00000000670 14100570234 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	Concluído	1
1	2	Concluído	1
1	3	Concluído	1
1	4	Concluído	1
1	5	Concluído	1
2	1	Concluído	1
2	2	Concluído	1
2	3	Concluído	1
2	4	Concluído	1
2	5	Concluído	1
3	1	Concluído	1
3	2	Concluído	1
3	3	Concluído	1
3	4	Concluído	1
3	5	Concluído	1
4	1	Concluído	1
4	2	Concluído	1
4	3	Concluído	1
4	4	Concluído	1
4	5	Concluído	1
5	1	Em andamento	1
5	2	Em andamento	1
5	3	Em andamento	1
5	4	Em andamento	1
5	5	Em andamento	1
\.


                                                                        2324.dat                                                                                            0000600 0004000 0002000 00000000312 14100570234 0014234 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Framework	ReactJS, React Native...	1
2	Banco de dados	PostgreSQL, DBeaver...	1
3	Linguagens	Java, C#, JavaScript...	1
4	Soft Skills	Proatividade, liderança...	1
5	Treinamentos	SCRUM, Agile...	1
\.


                                                                                                                                                                                                                                                                                                                      2327.dat                                                                                            0000600 0004000 0002000 00000000043 14100570234 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             2340.dat                                                                                            0000600 0004000 0002000 00000000131 14100570234 0014231 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1
1	2	1
1	3	1
2	1	1
2	2	1
2	3	1
3	1	1
3	2	1
3	3	1
4	1	1
4	2	1
4	3	1
4	4	1
5	4	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                       2326.dat                                                                                            0000600 0004000 0002000 00000000675 14100570234 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	ReactJS	Aplicação de Hooks, componentização, responsividade, uso de Router DOM...	1
2	PostgreSQL	Criação de tabelas, normalização, mapeamento, elaboração de diagramas ER, tratamento de dados...	1
3	Java	Criação de API Restful, POO...	1
4	Proatividade	Capacidade de trabalhar ativamente em grupo ou isolado sem demanda de tarefas por terceiros...	1
5	SCRUM	Conhecimento da ideologia, denominações, método de execução...	1
\.


                                                                   2341.dat                                                                                            0000600 0004000 0002000 00000000107 14100570234 0014235 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1
1	2	1
1	3	1
2	1	1
2	2	1
2	3	1
3	1	1
3	2	1
3	3	1
4	4	1
5	4	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                         2337.dat                                                                                            0000600 0004000 0002000 00000000043 14100570234 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             2313.dat                                                                                            0000600 0004000 0002000 00000001204 14100570234 0014233 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	13872-034	Rua Capitão José Gomes Guimarães	111		Jardim Primeiro de Maio	São João da Boa Vista	SP	Brasil	1
2	49044-502	Rua A8	489		Santa Maria	Aracaju	SE	Brasil	1
3	29114-685	Beco Mirandópolis	804		Argolas	Vila Velha	ES	Brasil	1
4	68906-842	Alameda Araguary	254		Cabralzinho	Macapá	AP	Brasil	1
5	96825-363	Antônia da Silva Martins	316		Belvedere	Santa Cruz do Sul	RS	Brasil	1
6	13872-028	Rua Capitão José Gomes Guimarães	999	apartamento 5	Jardim Primeiro de Abril	São João da Boa Vista	SP	Brasil	1
7	13872-028	Rua Capitão José Gomes Guimarães	999	apartamento 8	Jardim Primeiro de Abril	São João da Boa Vista	SP	Brasil	1
\.


                                                                                                                                                                                                                                                                                                                                                                                            2335.dat                                                                                            0000600 0004000 0002000 00000000726 14100570234 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Sistemas da Informação	Superior Completo	UFRJ	1
2	Ciência da Computação	Superior Completo	UFF	1
3	Engenharia Elétrica	Superior Completo	UCP	1
4	Engenharia de Computação	Superior Incompleto	UCP	1
5	Engenharia de Software	Superior Completo	Estácio	1
6	Análise e Desenvolvimento de Sistemas	Superior Completo	UFRJ	1
7	Análise e Desenvolvimento de Sistemas	Superior Incompleto	Estácio	1
8	Análise e Desenvolvimento de Sistemas	Superior Incompleto	UERJ	1
\.


                                          2339.dat                                                                                            0000600 0004000 0002000 00000000071 14100570234 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Básico	1
2	Intermediário	1
3	Avançado	1
4	\N	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                       2329.dat                                                                                            0000600 0004000 0002000 00000000340 14100570234 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Dev Trainee	Estagiário	1
3	Dev Pleno	Desenvolvedor com autonomia para desenvolvimento de software	1
4	Dev Sênior	Desenvolvedor líder de software 	1
2	Dev Júnior	Desenvolvedor iniciante	1
5	DBA	Analista de Dados	1
\.


                                                                                                                                                                                                                                                                                                2333.dat                                                                                            0000600 0004000 0002000 00000000153 14100570234 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	3	1
1	2	1
2	1	1
2	2	1
2	3	1
2	4	1
2	5	1
3	1	1
3	2	1
3	3	1
3	4	1
3	5	1
4	1	1
4	2	1
4	3	1
4	4	1
4	5	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                     2331.dat                                                                                            0000600 0004000 0002000 00000000564 14100570234 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	Projeto 4	Quarto projeto		Desenvolvimento Mobile	2021-10-22	\N	2	1
3	Projeto 3	Terceiro projeto	Notion	Desenvolvimento Mobile	2022-02-04	\N	3	1
2	Projeto 2	Segundo projeto		Desenvolvimento Web	2021-11-23	\N	2	1
1	Projeto 1	Primeiro projeto	Trello	Desenvolvimento Mobile	2021-10-11	\N	4	1
9	Projeto 11	Décimo primeiro projeto		Desenvolvimento Web	2021-09-22	\N	5	1
\.


                                                                                                                                            2321.dat                                                                                            0000600 0004000 0002000 00000000671 14100570234 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	React - The Complete Guide (incl Hooks, React Router, Redux)	Udemy Academy	48	Curso sobre ReactJS	1
2	PostgreSQL High Performance Tuning Guide	Udemy Academy	2	Curso sobre PostgreSQL	1
3	Java 2021 COMPLETO: Do Zero ao Profissional + Projetos!	Udemy Academy	77	Curso sobre Java	1
4	Soft Skills: The 11 Essential Career Soft Skills	Udemy Academy	31	Curso sobre soft skills	1
5	SCRUM Fundamentals	t2m	6	Curso sobre fundamentos de SCRUM	1
\.


                                                                       2316.dat                                                                                            0000600 0004000 0002000 00000000257 14100570234 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	eloa.nunes	1111	1	1
2	2	hugo.martins	2222	0	1
6	21	1-4711	1996/3	0	1
7	22	1-4712	1987/8	0	1
8	26	1-3712	1984/8	0	0
10	28	Thiago.19	1984/8	0	1
11	29	bob.19	1984/8	0	1
\.


                                                                                                                                                                                                                                                                                                                                                 restore.sql                                                                                         0000600 0004000 0002000 00000115320 14100570234 0015362 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.21
-- Dumped by pg_dump version 9.6.21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_id_colaborador_fkey;
ALTER TABLE ONLY public.posicoes_competencias DROP CONSTRAINT posicoes_competencias_id_posicao_fkey;
ALTER TABLE ONLY public.posicoes_competencias DROP CONSTRAINT posicoes_competencias_id_competencia_fkey;
ALTER TABLE ONLY public.conhecimentos_treinamentos DROP CONSTRAINT conhecimentos_treinamentos_id_treinamento_fkey;
ALTER TABLE ONLY public.conhecimentos_treinamentos DROP CONSTRAINT conhecimentos_treinamentos_id_conhecimento_fkey;
ALTER TABLE ONLY public.conhecimentos_niveis DROP CONSTRAINT conhecimentos_niveis_id_nivel_fkey;
ALTER TABLE ONLY public.conhecimentos_niveis DROP CONSTRAINT conhecimentos_niveis_id_conhecimento_fkey;
ALTER TABLE ONLY public.competencias_niveis DROP CONSTRAINT competencias_niveis_id_nivel_fkey;
ALTER TABLE ONLY public.competencias_niveis DROP CONSTRAINT competencias_niveis_id_competencia_fkey;
ALTER TABLE ONLY public.competencias_conhecimentos DROP CONSTRAINT competencias_conhecimentos_id_conhecimento_fkey;
ALTER TABLE ONLY public.competencias_conhecimentos DROP CONSTRAINT competencias_conhecimentos_id_competencia_fkey;
ALTER TABLE ONLY public.colaboradores_treinamentos DROP CONSTRAINT colaboradores_treinamentos_id_treinamento_fkey;
ALTER TABLE ONLY public.colaboradores_treinamentos DROP CONSTRAINT colaboradores_treinamentos_id_colaborador_fkey;
ALTER TABLE ONLY public.colaboradores_projetos DROP CONSTRAINT colaboradores_projetos_id_projeto_fkey;
ALTER TABLE ONLY public.colaboradores_projetos DROP CONSTRAINT colaboradores_projetos_id_colaborador_fkey;
ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_id_posicao_fkey;
ALTER TABLE ONLY public.colaboradores_formacoes DROP CONSTRAINT colaboradores_formacoes_id_formacao_fkey;
ALTER TABLE ONLY public.colaboradores_formacoes DROP CONSTRAINT colaboradores_formacoes_id_colaborador_fkey;
ALTER TABLE ONLY public.colaboradores_enderecos DROP CONSTRAINT colaboradores_enderecos_id_endereco_fkey;
ALTER TABLE ONLY public.colaboradores_enderecos DROP CONSTRAINT colaboradores_enderecos_id_colaborador_fkey;
ALTER TABLE ONLY public.colaboradores_certificacoes DROP CONSTRAINT colaboradores_certificacoes_id_colaborador_fkey;
ALTER TABLE ONLY public.colaboradores_certificacoes DROP CONSTRAINT colaboradores_certificacoes_id_certificacao_fkey;
ALTER TABLE ONLY public.certificacoes DROP CONSTRAINT certificacoes_id_treinamento_fkey;
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_usuario_key;
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
ALTER TABLE ONLY public.treinamentos DROP CONSTRAINT treinamentos_pkey;
ALTER TABLE ONLY public.projetos DROP CONSTRAINT projetos_pkey;
ALTER TABLE ONLY public.posicoes DROP CONSTRAINT posicoes_pkey;
ALTER TABLE ONLY public.niveis DROP CONSTRAINT niveis_pkey;
ALTER TABLE ONLY public.formacoes DROP CONSTRAINT formacoes_pkey;
ALTER TABLE ONLY public.enderecos DROP CONSTRAINT enderecos_pkey;
ALTER TABLE ONLY public.conhecimentos DROP CONSTRAINT conhecimentos_pkey;
ALTER TABLE ONLY public.competencias DROP CONSTRAINT competencias_pkey;
ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_rg_key;
ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_pkey;
ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_pix_key;
ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_cpf_key;
ALTER TABLE ONLY public.certificacoes DROP CONSTRAINT certificacoes_pkey;
ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.treinamentos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.projetos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.posicoes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.niveis ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.formacoes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.enderecos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.conhecimentos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competencias ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.colaboradores ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.certificacoes ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.usuarios_id_seq;
DROP TABLE public.usuarios;
DROP SEQUENCE public.treinamentos_id_seq;
DROP TABLE public.treinamentos;
DROP SEQUENCE public.projetos_id_seq;
DROP TABLE public.projetos;
DROP SEQUENCE public.posicoes_id_seq;
DROP TABLE public.posicoes_competencias;
DROP TABLE public.posicoes;
DROP SEQUENCE public.niveis_id_seq;
DROP TABLE public.niveis;
DROP SEQUENCE public.formacoes_id_seq;
DROP TABLE public.formacoes;
DROP SEQUENCE public.enderecos_id_seq;
DROP TABLE public.enderecos;
DROP TABLE public.conhecimentos_treinamentos;
DROP TABLE public.conhecimentos_niveis;
DROP SEQUENCE public.conhecimentos_id_seq;
DROP TABLE public.conhecimentos;
DROP TABLE public.competencias_niveis;
DROP SEQUENCE public.competencias_id_seq;
DROP TABLE public.competencias_conhecimentos;
DROP TABLE public.competencias;
DROP TABLE public.colaboradores_treinamentos;
DROP TABLE public.colaboradores_projetos;
DROP SEQUENCE public.colaboradores_id_seq;
DROP TABLE public.colaboradores_formacoes;
DROP TABLE public.colaboradores_enderecos;
DROP TABLE public.colaboradores_certificacoes;
DROP TABLE public.colaboradores;
DROP SEQUENCE public.certificacoes_id_seq;
DROP TABLE public.certificacoes;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: certificacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificacoes (
    id integer NOT NULL,
    tempo_validade numeric NOT NULL,
    id_treinamento integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.certificacoes OWNER TO postgres;

--
-- Name: certificacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.certificacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificacoes_id_seq OWNER TO postgres;

--
-- Name: certificacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.certificacoes_id_seq OWNED BY public.certificacoes.id;


--
-- Name: colaboradores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaboradores (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    data_nascimento date,
    email character varying(30),
    pix character varying(40),
    cpf character varying(14) NOT NULL,
    rg character varying(12) NOT NULL,
    cnh character varying(1) NOT NULL,
    id_posicao integer,
    isativo integer NOT NULL,
    permissao integer NOT NULL,
    CONSTRAINT cnh CHECK ((((cnh)::text = 'A'::text) OR ((cnh)::text = 'B'::text) OR ((cnh)::text = 'C'::text) OR ((cnh)::text = 'D'::text) OR ((cnh)::text = 'E'::text) OR ((cnh)::text = 'N'::text))),
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1))),
    CONSTRAINT permissao CHECK (((permissao = 0) OR (permissao = 1) OR (permissao = 2)))
);


ALTER TABLE public.colaboradores OWNER TO postgres;

--
-- Name: colaboradores_certificacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaboradores_certificacoes (
    id_colaborador integer,
    id_certificacao integer,
    data_obtencao date NOT NULL,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.colaboradores_certificacoes OWNER TO postgres;

--
-- Name: colaboradores_enderecos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaboradores_enderecos (
    id_colaborador integer,
    id_endereco integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.colaboradores_enderecos OWNER TO postgres;

--
-- Name: colaboradores_formacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaboradores_formacoes (
    id_colaborador integer,
    id_formacao integer,
    data_entrada date NOT NULL,
    data_conclusao date,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.colaboradores_formacoes OWNER TO postgres;

--
-- Name: colaboradores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colaboradores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colaboradores_id_seq OWNER TO postgres;

--
-- Name: colaboradores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colaboradores_id_seq OWNED BY public.colaboradores.id;


--
-- Name: colaboradores_projetos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaboradores_projetos (
    id_colaborador integer,
    id_projeto integer,
    funcao character varying(25) NOT NULL,
    data_inicio date NOT NULL,
    data_saida date,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.colaboradores_projetos OWNER TO postgres;

--
-- Name: colaboradores_treinamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaboradores_treinamentos (
    id_colaborador integer,
    id_treinamento integer,
    status character varying(20),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.colaboradores_treinamentos OWNER TO postgres;

--
-- Name: competencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competencias (
    id integer NOT NULL,
    nome character varying(25) NOT NULL,
    descricao character varying(255),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.competencias OWNER TO postgres;

--
-- Name: competencias_conhecimentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competencias_conhecimentos (
    id_competencia integer,
    id_conhecimento integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.competencias_conhecimentos OWNER TO postgres;

--
-- Name: competencias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.competencias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competencias_id_seq OWNER TO postgres;

--
-- Name: competencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.competencias_id_seq OWNED BY public.competencias.id;


--
-- Name: competencias_niveis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competencias_niveis (
    id_competencia integer,
    id_nivel integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.competencias_niveis OWNER TO postgres;

--
-- Name: conhecimentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conhecimentos (
    id integer NOT NULL,
    nome character varying(25) NOT NULL,
    descricao character varying(255),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.conhecimentos OWNER TO postgres;

--
-- Name: conhecimentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conhecimentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conhecimentos_id_seq OWNER TO postgres;

--
-- Name: conhecimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conhecimentos_id_seq OWNED BY public.conhecimentos.id;


--
-- Name: conhecimentos_niveis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conhecimentos_niveis (
    id_conhecimento integer,
    id_nivel integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.conhecimentos_niveis OWNER TO postgres;

--
-- Name: conhecimentos_treinamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conhecimentos_treinamentos (
    id_conhecimento integer,
    id_treinamento integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.conhecimentos_treinamentos OWNER TO postgres;

--
-- Name: enderecos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enderecos (
    id integer NOT NULL,
    cep character varying(12) NOT NULL,
    rua character varying(100),
    numero character varying(10),
    complemento character varying(15),
    bairro character varying(50),
    cidade character varying(50),
    estado character varying(2),
    pais character varying(15),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.enderecos OWNER TO postgres;

--
-- Name: enderecos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enderecos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enderecos_id_seq OWNER TO postgres;

--
-- Name: enderecos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enderecos_id_seq OWNED BY public.enderecos.id;


--
-- Name: formacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formacoes (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    nivel character varying(50) NOT NULL,
    instituicao character varying(30) NOT NULL,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.formacoes OWNER TO postgres;

--
-- Name: formacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.formacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formacoes_id_seq OWNER TO postgres;

--
-- Name: formacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.formacoes_id_seq OWNED BY public.formacoes.id;


--
-- Name: niveis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.niveis (
    id integer NOT NULL,
    nivel character varying(50),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.niveis OWNER TO postgres;

--
-- Name: niveis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.niveis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.niveis_id_seq OWNER TO postgres;

--
-- Name: niveis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.niveis_id_seq OWNED BY public.niveis.id;


--
-- Name: posicoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posicoes (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    descricao character varying(255),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.posicoes OWNER TO postgres;

--
-- Name: posicoes_competencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posicoes_competencias (
    id_posicao integer,
    id_competencia integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.posicoes_competencias OWNER TO postgres;

--
-- Name: posicoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posicoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posicoes_id_seq OWNER TO postgres;

--
-- Name: posicoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posicoes_id_seq OWNED BY public.posicoes.id;


--
-- Name: projetos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projetos (
    id integer NOT NULL,
    nome character varying(25) NOT NULL,
    descricao character varying(255),
    app_gerenciamento character varying(255),
    segmento character varying(50),
    data_entrega_esperada date NOT NULL,
    data_entrega date,
    equipe integer,
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.projetos OWNER TO postgres;

--
-- Name: projetos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projetos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projetos_id_seq OWNER TO postgres;

--
-- Name: projetos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projetos_id_seq OWNED BY public.projetos.id;


--
-- Name: treinamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treinamentos (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    instituicao character varying(25) NOT NULL,
    carga_horaria numeric NOT NULL,
    descricao character varying(255),
    isativo integer NOT NULL,
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.treinamentos OWNER TO postgres;

--
-- Name: treinamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.treinamentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.treinamentos_id_seq OWNER TO postgres;

--
-- Name: treinamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.treinamentos_id_seq OWNED BY public.treinamentos.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    id_colaborador integer,
    usuario character varying(20) NOT NULL,
    senha character varying(8) NOT NULL,
    isadmin integer,
    isativo integer NOT NULL,
    CONSTRAINT isadmin CHECK (((isadmin = 0) OR (isadmin = 1))),
    CONSTRAINT isativo CHECK (((isativo = 0) OR (isativo = 1)))
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: certificacoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificacoes ALTER COLUMN id SET DEFAULT nextval('public.certificacoes_id_seq'::regclass);


--
-- Name: colaboradores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores ALTER COLUMN id SET DEFAULT nextval('public.colaboradores_id_seq'::regclass);


--
-- Name: competencias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competencias ALTER COLUMN id SET DEFAULT nextval('public.competencias_id_seq'::regclass);


--
-- Name: conhecimentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conhecimentos ALTER COLUMN id SET DEFAULT nextval('public.conhecimentos_id_seq'::regclass);


--
-- Name: enderecos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos ALTER COLUMN id SET DEFAULT nextval('public.enderecos_id_seq'::regclass);


--
-- Name: formacoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formacoes ALTER COLUMN id SET DEFAULT nextval('public.formacoes_id_seq'::regclass);


--
-- Name: niveis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveis ALTER COLUMN id SET DEFAULT nextval('public.niveis_id_seq'::regclass);


--
-- Name: posicoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posicoes ALTER COLUMN id SET DEFAULT nextval('public.posicoes_id_seq'::regclass);


--
-- Name: projetos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projetos ALTER COLUMN id SET DEFAULT nextval('public.projetos_id_seq'::regclass);


--
-- Name: treinamentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treinamentos ALTER COLUMN id SET DEFAULT nextval('public.treinamentos_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: certificacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.certificacoes (id, tempo_validade, id_treinamento, isativo) FROM stdin;
\.
COPY public.certificacoes (id, tempo_validade, id_treinamento, isativo) FROM '$$PATH$$/2318.dat';

--
-- Name: certificacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.certificacoes_id_seq', 6, true);


--
-- Data for Name: colaboradores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaboradores (id, nome, data_nascimento, email, pix, cpf, rg, cnh, id_posicao, isativo, permissao) FROM stdin;
\.
COPY public.colaboradores (id, nome, data_nascimento, email, pix, cpf, rg, cnh, id_posicao, isativo, permissao) FROM '$$PATH$$/2311.dat';

--
-- Data for Name: colaboradores_certificacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaboradores_certificacoes (id_colaborador, id_certificacao, data_obtencao, isativo) FROM stdin;
\.
COPY public.colaboradores_certificacoes (id_colaborador, id_certificacao, data_obtencao, isativo) FROM '$$PATH$$/2319.dat';

--
-- Data for Name: colaboradores_enderecos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaboradores_enderecos (id_colaborador, id_endereco, isativo) FROM stdin;
\.
COPY public.colaboradores_enderecos (id_colaborador, id_endereco, isativo) FROM '$$PATH$$/2314.dat';

--
-- Data for Name: colaboradores_formacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaboradores_formacoes (id_colaborador, id_formacao, data_entrada, data_conclusao, isativo) FROM stdin;
\.
COPY public.colaboradores_formacoes (id_colaborador, id_formacao, data_entrada, data_conclusao, isativo) FROM '$$PATH$$/2336.dat';

--
-- Name: colaboradores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colaboradores_id_seq', 30, true);


--
-- Data for Name: colaboradores_projetos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaboradores_projetos (id_colaborador, id_projeto, funcao, data_inicio, data_saida, isativo) FROM stdin;
\.
COPY public.colaboradores_projetos (id_colaborador, id_projeto, funcao, data_inicio, data_saida, isativo) FROM '$$PATH$$/2332.dat';

--
-- Data for Name: colaboradores_treinamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaboradores_treinamentos (id_colaborador, id_treinamento, status, isativo) FROM stdin;
\.
COPY public.colaboradores_treinamentos (id_colaborador, id_treinamento, status, isativo) FROM '$$PATH$$/2322.dat';

--
-- Data for Name: competencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competencias (id, nome, descricao, isativo) FROM stdin;
\.
COPY public.competencias (id, nome, descricao, isativo) FROM '$$PATH$$/2324.dat';

--
-- Data for Name: competencias_conhecimentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competencias_conhecimentos (id_competencia, id_conhecimento, isativo) FROM stdin;
\.
COPY public.competencias_conhecimentos (id_competencia, id_conhecimento, isativo) FROM '$$PATH$$/2327.dat';

--
-- Name: competencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.competencias_id_seq', 5, true);


--
-- Data for Name: competencias_niveis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competencias_niveis (id_competencia, id_nivel, isativo) FROM stdin;
\.
COPY public.competencias_niveis (id_competencia, id_nivel, isativo) FROM '$$PATH$$/2340.dat';

--
-- Data for Name: conhecimentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conhecimentos (id, nome, descricao, isativo) FROM stdin;
\.
COPY public.conhecimentos (id, nome, descricao, isativo) FROM '$$PATH$$/2326.dat';

--
-- Name: conhecimentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conhecimentos_id_seq', 5, true);


--
-- Data for Name: conhecimentos_niveis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conhecimentos_niveis (id_conhecimento, id_nivel, isativo) FROM stdin;
\.
COPY public.conhecimentos_niveis (id_conhecimento, id_nivel, isativo) FROM '$$PATH$$/2341.dat';

--
-- Data for Name: conhecimentos_treinamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conhecimentos_treinamentos (id_conhecimento, id_treinamento, isativo) FROM stdin;
\.
COPY public.conhecimentos_treinamentos (id_conhecimento, id_treinamento, isativo) FROM '$$PATH$$/2337.dat';

--
-- Data for Name: enderecos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enderecos (id, cep, rua, numero, complemento, bairro, cidade, estado, pais, isativo) FROM stdin;
\.
COPY public.enderecos (id, cep, rua, numero, complemento, bairro, cidade, estado, pais, isativo) FROM '$$PATH$$/2313.dat';

--
-- Name: enderecos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enderecos_id_seq', 7, true);


--
-- Data for Name: formacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formacoes (id, nome, nivel, instituicao, isativo) FROM stdin;
\.
COPY public.formacoes (id, nome, nivel, instituicao, isativo) FROM '$$PATH$$/2335.dat';

--
-- Name: formacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formacoes_id_seq', 8, true);


--
-- Data for Name: niveis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.niveis (id, nivel, isativo) FROM stdin;
\.
COPY public.niveis (id, nivel, isativo) FROM '$$PATH$$/2339.dat';

--
-- Name: niveis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.niveis_id_seq', 4, true);


--
-- Data for Name: posicoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posicoes (id, nome, descricao, isativo) FROM stdin;
\.
COPY public.posicoes (id, nome, descricao, isativo) FROM '$$PATH$$/2329.dat';

--
-- Data for Name: posicoes_competencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posicoes_competencias (id_posicao, id_competencia, isativo) FROM stdin;
\.
COPY public.posicoes_competencias (id_posicao, id_competencia, isativo) FROM '$$PATH$$/2333.dat';

--
-- Name: posicoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posicoes_id_seq', 5, true);


--
-- Data for Name: projetos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projetos (id, nome, descricao, app_gerenciamento, segmento, data_entrega_esperada, data_entrega, equipe, isativo) FROM stdin;
\.
COPY public.projetos (id, nome, descricao, app_gerenciamento, segmento, data_entrega_esperada, data_entrega, equipe, isativo) FROM '$$PATH$$/2331.dat';

--
-- Name: projetos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projetos_id_seq', 9, true);


--
-- Data for Name: treinamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treinamentos (id, nome, instituicao, carga_horaria, descricao, isativo) FROM stdin;
\.
COPY public.treinamentos (id, nome, instituicao, carga_horaria, descricao, isativo) FROM '$$PATH$$/2321.dat';

--
-- Name: treinamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.treinamentos_id_seq', 5, true);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, id_colaborador, usuario, senha, isadmin, isativo) FROM stdin;
\.
COPY public.usuarios (id, id_colaborador, usuario, senha, isadmin, isativo) FROM '$$PATH$$/2316.dat';

--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 11, true);


--
-- Name: certificacoes certificacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificacoes
    ADD CONSTRAINT certificacoes_pkey PRIMARY KEY (id);


--
-- Name: colaboradores colaboradores_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_cpf_key UNIQUE (cpf);


--
-- Name: colaboradores colaboradores_pix_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_pix_key UNIQUE (pix);


--
-- Name: colaboradores colaboradores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_pkey PRIMARY KEY (id);


--
-- Name: colaboradores colaboradores_rg_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_rg_key UNIQUE (rg);


--
-- Name: competencias competencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competencias
    ADD CONSTRAINT competencias_pkey PRIMARY KEY (id);


--
-- Name: conhecimentos conhecimentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conhecimentos
    ADD CONSTRAINT conhecimentos_pkey PRIMARY KEY (id);


--
-- Name: enderecos enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id);


--
-- Name: formacoes formacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formacoes
    ADD CONSTRAINT formacoes_pkey PRIMARY KEY (id);


--
-- Name: niveis niveis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveis
    ADD CONSTRAINT niveis_pkey PRIMARY KEY (id);


--
-- Name: posicoes posicoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posicoes
    ADD CONSTRAINT posicoes_pkey PRIMARY KEY (id);


--
-- Name: projetos projetos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projetos
    ADD CONSTRAINT projetos_pkey PRIMARY KEY (id);


--
-- Name: treinamentos treinamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treinamentos
    ADD CONSTRAINT treinamentos_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- Name: certificacoes certificacoes_id_treinamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificacoes
    ADD CONSTRAINT certificacoes_id_treinamento_fkey FOREIGN KEY (id_treinamento) REFERENCES public.treinamentos(id);


--
-- Name: colaboradores_certificacoes colaboradores_certificacoes_id_certificacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_certificacoes
    ADD CONSTRAINT colaboradores_certificacoes_id_certificacao_fkey FOREIGN KEY (id_certificacao) REFERENCES public.certificacoes(id);


--
-- Name: colaboradores_certificacoes colaboradores_certificacoes_id_colaborador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_certificacoes
    ADD CONSTRAINT colaboradores_certificacoes_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);


--
-- Name: colaboradores_enderecos colaboradores_enderecos_id_colaborador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_enderecos
    ADD CONSTRAINT colaboradores_enderecos_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);


--
-- Name: colaboradores_enderecos colaboradores_enderecos_id_endereco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_enderecos
    ADD CONSTRAINT colaboradores_enderecos_id_endereco_fkey FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id);


--
-- Name: colaboradores_formacoes colaboradores_formacoes_id_colaborador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_formacoes
    ADD CONSTRAINT colaboradores_formacoes_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);


--
-- Name: colaboradores_formacoes colaboradores_formacoes_id_formacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_formacoes
    ADD CONSTRAINT colaboradores_formacoes_id_formacao_fkey FOREIGN KEY (id_formacao) REFERENCES public.formacoes(id);


--
-- Name: colaboradores colaboradores_id_posicao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_id_posicao_fkey FOREIGN KEY (id_posicao) REFERENCES public.posicoes(id);


--
-- Name: colaboradores_projetos colaboradores_projetos_id_colaborador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_projetos
    ADD CONSTRAINT colaboradores_projetos_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);


--
-- Name: colaboradores_projetos colaboradores_projetos_id_projeto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_projetos
    ADD CONSTRAINT colaboradores_projetos_id_projeto_fkey FOREIGN KEY (id_projeto) REFERENCES public.projetos(id);


--
-- Name: colaboradores_treinamentos colaboradores_treinamentos_id_colaborador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_treinamentos
    ADD CONSTRAINT colaboradores_treinamentos_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);


--
-- Name: colaboradores_treinamentos colaboradores_treinamentos_id_treinamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_treinamentos
    ADD CONSTRAINT colaboradores_treinamentos_id_treinamento_fkey FOREIGN KEY (id_treinamento) REFERENCES public.treinamentos(id);


--
-- Name: competencias_conhecimentos competencias_conhecimentos_id_competencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competencias_conhecimentos
    ADD CONSTRAINT competencias_conhecimentos_id_competencia_fkey FOREIGN KEY (id_competencia) REFERENCES public.competencias(id);


--
-- Name: competencias_conhecimentos competencias_conhecimentos_id_conhecimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competencias_conhecimentos
    ADD CONSTRAINT competencias_conhecimentos_id_conhecimento_fkey FOREIGN KEY (id_conhecimento) REFERENCES public.conhecimentos(id);


--
-- Name: competencias_niveis competencias_niveis_id_competencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competencias_niveis
    ADD CONSTRAINT competencias_niveis_id_competencia_fkey FOREIGN KEY (id_competencia) REFERENCES public.competencias(id);


--
-- Name: competencias_niveis competencias_niveis_id_nivel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competencias_niveis
    ADD CONSTRAINT competencias_niveis_id_nivel_fkey FOREIGN KEY (id_nivel) REFERENCES public.niveis(id);


--
-- Name: conhecimentos_niveis conhecimentos_niveis_id_conhecimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conhecimentos_niveis
    ADD CONSTRAINT conhecimentos_niveis_id_conhecimento_fkey FOREIGN KEY (id_conhecimento) REFERENCES public.conhecimentos(id);


--
-- Name: conhecimentos_niveis conhecimentos_niveis_id_nivel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conhecimentos_niveis
    ADD CONSTRAINT conhecimentos_niveis_id_nivel_fkey FOREIGN KEY (id_nivel) REFERENCES public.niveis(id);


--
-- Name: conhecimentos_treinamentos conhecimentos_treinamentos_id_conhecimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conhecimentos_treinamentos
    ADD CONSTRAINT conhecimentos_treinamentos_id_conhecimento_fkey FOREIGN KEY (id_conhecimento) REFERENCES public.conhecimentos(id);


--
-- Name: conhecimentos_treinamentos conhecimentos_treinamentos_id_treinamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conhecimentos_treinamentos
    ADD CONSTRAINT conhecimentos_treinamentos_id_treinamento_fkey FOREIGN KEY (id_treinamento) REFERENCES public.treinamentos(id);


--
-- Name: posicoes_competencias posicoes_competencias_id_competencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posicoes_competencias
    ADD CONSTRAINT posicoes_competencias_id_competencia_fkey FOREIGN KEY (id_competencia) REFERENCES public.competencias(id);


--
-- Name: posicoes_competencias posicoes_competencias_id_posicao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posicoes_competencias
    ADD CONSTRAINT posicoes_competencias_id_posicao_fkey FOREIGN KEY (id_posicao) REFERENCES public.posicoes(id);


--
-- Name: usuarios usuarios_id_colaborador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES public.colaboradores(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                