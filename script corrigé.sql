/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  21/07/2023 12:20:34                      */
/*==============================================================*/


drop table if exists id_personnel;

drop table if exists role;

drop table if exists table_administrateur;

drop table if exists table_clients;

drop table if exists table_depense;

drop table if exists table_fourmisseur;

drop table if exists table_mesure;

drop table if exists table_modeles_couture;

drop table if exists table_payement;

drop table if exists table_superadmi;

/*==============================================================*/
/* Table : id_personnel                                         */
/*==============================================================*/
create table id_personnel
(
   id_personnel         int not null,
   id_administrateur    int,
   id_fournisseur       int,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   contact              int,
   specialite           varchar(254),
   primary key (id_personnel)
);

/*==============================================================*/
/* Table : role                                                 */
/*==============================================================*/
create table role
(
   id_depense           int,
   id_role              int,
   type                 int
);

/*==============================================================*/
/* Table : table_administrateur                                 */
/*==============================================================*/
create table table_administrateur
(
   id_administrateur    int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   sexe                 varchar(254),
   telephone            int,
   email                int,
   primary key (id_administrateur)
);

/*==============================================================*/
/* Table : table_clients                                        */
/*==============================================================*/
create table table_clients
(
   id__clients          int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   sexe                 varchar(254),
   ardesse              int,
   telephone            int,
   email                varchar(254),
   primary key (id__clients)
);

/*==============================================================*/
/* Table : table_depense                                        */
/*==============================================================*/
create table table_depense
(
   id_depense           int not null,
   type                 varchar(254),
   date_depot           datetime,
   modele               varchar(254),
   montant_paye         int,
   prix_unitaire        int,
   quatite              int,
   acompte              int,
   reste_a_payer        int,
   primary key (id_depense)
);

/*==============================================================*/
/* Table : table_fourmisseur                                    */
/*==============================================================*/
create table table_fourmisseur
(
   id_fournisseur       int not null,
   id_depense           int,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   telephone            int,
   email                varchar(254),
   sexe                 varchar(254),
   primary key (id_fournisseur),
   key AK_Identifiant_1 (id_fournisseur),
   key AK_Identifiant_3 (id_fournisseur)
);

/*==============================================================*/
/* Table : table_mesure                                         */
/*==============================================================*/
create table table_mesure
(
   id__mesure           int not null,
   id__modele           int,
   id__clients          int,
   id_supadmi           int,
   poitrine             int,
   longueur_manche      int,
   longueur_pantaton    int,
   ceinture             int,
   longueur_robe        int,
   bassin               int,
   tour_de_taille       int,
   bas                  int,
   tour_ventral         int,
   hanche               int,
   cuisse               int,
   ecart_dos            int,
   primary key (id__mesure)
);

/*==============================================================*/
/* Table : table_modeles_couture                                */
/*==============================================================*/
create table table_modeles_couture
(
   id__modele           int not null,
   designation          varchar(254),
   primary key (id__modele)
);

/*==============================================================*/
/* Table : table_payement                                       */
/*==============================================================*/
create table table_payement
(
   id_montant_paye      int not null,
   id__clients          int,
   date_de_depot        datetime,
   reste                int,
   montant_verse        int,
   date_livraidson      int,
   primary key (id_montant_paye)
);

/*==============================================================*/
/* Table : table_superadmi                                      */
/*==============================================================*/
create table table_superadmi
(
   id_supadmi           int not null,
   id_fournisseur       int,
   nom                  varchar(254),
   prenom               varchar(254),
   sexe                 varchar(254),
   adresse              varchar(254),
   telephone            int,
   email                varchar(254),
   primary key (id_supadmi),
   key AK_Identifiant_1 (id_supadmi)
);

alter table id_personnel add constraint FK_Association_4 foreign key (id_administrateur)
      references table_administrateur (id_administrateur) on delete restrict on update restrict;

alter table id_personnel add constraint FK_Association_7 foreign key (id_fournisseur)
      references table_fourmisseur (id_fournisseur) on delete restrict on update restrict;

alter table role add constraint FK_Association_10 foreign key (id_depense)
      references table_depense (id_depense) on delete restrict on update restrict;

alter table table_fourmisseur add constraint FK_Association_8 foreign key (id_depense)
      references table_depense (id_depense) on delete restrict on update restrict;

alter table table_mesure add constraint FK_Association_2 foreign key (id__clients)
      references table_clients (id__clients) on delete restrict on update restrict;

alter table table_mesure add constraint FK_Association_3 foreign key (id__modele)
      references table_modeles_couture (id__modele) on delete restrict on update restrict;

alter table table_mesure add constraint FK_Association_5 foreign key (id_supadmi)
      references table_superadmi (id_supadmi) on delete restrict on update restrict;

alter table table_payement add constraint FK_Association_6 foreign key (id__clients)
      references table_clients (id__clients) on delete restrict on update restrict;

alter table table_superadmi add constraint FK_Association_9 foreign key (id_fournisseur)
      references table_fourmisseur (id_fournisseur) on delete restrict on update restrict;

