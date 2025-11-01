create sequence seq_mecanic
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_dealer
    start with 1
    increment by 1
    nocache
    nocycle;
    
create sequence seq_campanie
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_client
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_masina
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_tranzactie
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_garantie
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_service
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_piesa
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_unealta
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_utilizare_unealta
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_testdrive
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_promovare
    start with 1
    increment by 1
    nocache
    nocycle;

create sequence seq_programare
    start with 1
    increment by 1
    nocache
    nocycle;


create table client (
    id_client int primary key,
    nume varchar(100) not null,
    prenume varchar(100) not null,
    telefon varchar(20) not null,
    adresa varchar(200) not null
);

create table masina (
    vin varchar(20) primary key,
    model varchar(100) not null,
    an_fabricatie number(4) not null,
    culoare varchar(50) not null,
    motorizare varchar(50) not null,
    pret int not null check (pret > 0),
    stare varchar(50) not null,
    tractiune varchar(50) not null
);

create table vanzare (
    id_tranzactie int primary key,
    id_client int not null,
    vin varchar(20) not null,
    id_dealer int not null,
    data_vanzare date not null,
    pret_final int not null check (pret_final > 0),
    foreign key (id_client) references client(id_client),
    foreign key (vin) references masina(vin)
);

create table garantie (
    id_garantie int primary key,
    vin varchar(20) not null,
    durata int not null check (durata > 0),
    data_inceput date not null,
    foreign key (vin) references masina(vin)
);

create table mecanici (
    id_mecanic int primary key,
    specializare varchar(100) not null,
    nume varchar(100) not null,
    prenume varchar(100) not null,
    salariu int not null check (salariu > 0),
    data_angajare date not null
);

create table dealeri (
    id_dealer int primary key,
    total_vanzari int not null check (total_vanzari > 0),
    nume varchar(100) not null,
    prenume varchar(100) not null,
    salariu int not null check (salariu > 0),
    data_angajare date not null);

create table unelte (
    id_unealta int primary key,
    nume varchar(100) not null,
    tip varchar(100) not null,
    id_mecanic int not null,
    foreign key (id_mecanic) references mecanici(id_mecanic)
);

create table service (
    id_service int primary key,
    vin varchar(20) not null,
    data_programare date not null,
    status varchar(20) not null,
    id_mecanic int not null,
    foreign key (vin) references masina(vin),
    foreign key (id_mecanic) references mecanici(id_mecanic)
);

create table marketing (
    id_campanie int primary key,
    buget int not null check (buget > 0),
    vin varchar(20) not null,
    nume varchar(100) not null,
    prenume varchar(100) not null,
    salariu int not null check (salariu > 0),
    data_angajare date not null);

create table piese (
    id_piesa int primary key,
    denumire varchar(200) not null,
    pret int not null check (pret > 0),
    stoc int not null check (stoc >= 0)
);

create table test_drive (
    id_testdrive int primary key,
    id_client int not null,
    id_dealer int not null,
    data date not null,
    durata int not null check (durata > 0),
    vin varchar(20) not null,
    foreign key (id_client) references client(id_client),
    foreign key (id_dealer) references dealeri(id_dealer),
    foreign key (vin) references masina(vin)
);

create table programari_service (
    id_programare int primary key,
    vin varchar(20) not null,
    id_service int not null,
    data_programare date not null,
    observatii varchar(255),
    foreign key (vin) references masina(vin),
    foreign key (id_service) references service(id_service)
);

create table promovare (
    id_promovare int primary key,
    vin varchar(20) not null,
    perioada varchar(100) not null,
    id_campanie int not null,
    foreign key (vin) references masina(vin),
    foreign key (id_campanie) references marketing(id_campanie)
);

create table utilizare_unelte (
    id_utilizare int primary key,
    id_unealta int not null,
    id_mecanic int not null,
    data_inceput date not null,
    data_sfarsit date not null,
    foreign key (id_unealta) references unelte(id_unealta),
    foreign key (id_mecanic) references mecanici(id_mecanic)
);

insert into masina (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('1HGCM82633A123456', 'X1', 2025, 'Negru', 'Benzina', 25000, 'Noua', 'Fata');

insert into masina (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('1HGBH41JXMN109186', 'X3', 2025, 'Alb', 'Diesel', 22000, 'Noua', 'Spate');

insert into masina (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('2T1BURHE5JC005163', 'M5', 2025, 'Albastru', 'Hibrid', 27000, 'Noua', 'Integral');

insert into masina (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('1FADP3F29JL100001', '340i', 2025, 'Argintiu', 'Benzina', 50000, 'Noua', 'Fata');

insert into masina (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('1FTFW1ET3EFB12345', 'I7', 2025, 'Rosu', 'Diesel', 33000, 'Noua', 'Spate');

insert into masina (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('3HGGK5G67GM123456', 'M4', 2025, 'Verde', 'Benzina', 24000, 'Noua', 'Fata');

insert into masina (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('4T1BF1FK5HU123456', 'M6', 2025, 'Negru', 'Hibrid', 28000, 'Noua', 'Spate');

insert into masina (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('5TDBY5G14LS123456', 'X6', 2025, 'Gri', 'Diesel', 38000, 'Noua', 'Integral');

insert into masina (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('6FMPJ2A93LB123456', 'X1', 2025, 'Alb', 'Benzina', 29000, 'Noua', 'Fata');

insert into masina (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('7A1KH4G68KA123456', 'XM', 2025, 'Albastru', 'Hibrid', 35000, 'Noua', 'Spate');

select * from masina;


insert into garantie (id_garantie, vin, durata, data_inceput)
values (seq_garantie.nextval, '1HGCM82633A123456', 24, TO_DATE('2025-01-01', 'YYYY-MM-DD'));

insert into garantie (id_garantie, vin, durata, data_inceput)
values (seq_garantie.nextval, '1HGBH41JXMN109186', 36, TO_DATE('2025-02-01', 'YYYY-MM-DD'));

insert into garantie (id_garantie, vin, durata, data_inceput)
values (seq_garantie.nextval, '2T1BURHE5JC005163', 12, TO_DATE('2025-03-01', 'YYYY-MM-DD'));

insert into garantie (id_garantie, vin, durata, data_inceput)
values (seq_garantie.nextval, '1FADP3F29JL100001', 24, TO_DATE('2025-04-01', 'YYYY-MM-DD'));

insert into garantie (id_garantie, vin, durata, data_inceput)
values (seq_garantie.nextval, '1FTFW1ET3EFB12345', 36, TO_DATE('2025-05-01', 'YYYY-MM-DD'));

insert into garantie (id_garantie, vin, durata, data_inceput)
values (seq_garantie.nextval, '3HGGK5G67GM123456', 24, TO_DATE('2025-06-01', 'YYYY-MM-DD'));

insert into garantie (id_garantie, vin, durata, data_inceput)
values (seq_garantie.nextval, '4T1BF1FK5HU123456', 12, TO_DATE('2025-07-01', 'YYYY-MM-DD'));

insert into garantie (id_garantie, vin, durata, data_inceput)
values (seq_garantie.nextval, '5TDBY5G14LS123456', 36, TO_DATE('2025-08-01', 'YYYY-MM-DD'));

insert into garantie (id_garantie, vin, durata, data_inceput)
values (seq_garantie.nextval, '6FMPJ2A93LB123456', 24, TO_DATE('2025-09-01', 'YYYY-MM-DD'));

insert into garantie (id_garantie, vin, durata, data_inceput)
values (seq_garantie.nextval, '7A1KH4G68KA123456', 12, TO_DATE('2025-10-01', 'YYYY-MM-DD'));

select * from garantie;

insert into mecanici (id_mecanic, specializare, nume, prenume, salariu, data_angajare)
values (seq_mecanic.nextval, 'Motor', 'Popescu', 'Andrei', 4500, TO_DATE('2020-03-15', 'YYYY-MM-DD'));

insert into mecanici (id_mecanic, specializare, nume, prenume, salariu, data_angajare)
values (seq_mecanic.nextval, 'Transmisie', 'Ionescu', 'Cristian', 4600, TO_DATE('2019-06-10', 'YYYY-MM-DD'));

insert into mecanici (id_mecanic, specializare, nume, prenume, salariu, data_angajare)
values (seq_mecanic.nextval, 'Suspensie', 'Georgescu', 'Mihai', 4300, TO_DATE('2021-01-20', 'YYYY-MM-DD'));

insert into mecanici (id_mecanic, specializare, nume, prenume, salariu, data_angajare)
values (seq_mecanic.nextval, 'Frane', 'Dumitru', 'Sorin', 4200, TO_DATE('2018-09-05', 'YYYY-MM-DD'));

insert into mecanici (id_mecanic, specializare, nume, prenume, salariu, data_angajare)
values (seq_mecanic.nextval, 'Sisteme electrice', 'Stan', 'Gabriel', 4700, TO_DATE('2022-04-12', 'YYYY-MM-DD'));

insert into mecanici (id_mecanic, specializare, nume, prenume, salariu, data_angajare)
values (seq_mecanic.nextval, 'Caroserie', 'Barbu', 'Lucian', 4400, TO_DATE('2017-11-30', 'YYYY-MM-DD'));

insert into mecanici (id_mecanic, specializare, nume, prenume, salariu, data_angajare)
values (seq_mecanic.nextval, 'Motor', 'Marin', 'Florin', 4550, TO_DATE('2023-02-17', 'YYYY-MM-DD'));

insert into mecanici (id_mecanic, specializare, nume, prenume, salariu, data_angajare)
values (seq_mecanic.nextval, 'Sisteme electrice', 'Radu', 'Ionut', 4600, TO_DATE('2020-07-22', 'YYYY-MM-DD'));

insert into mecanici (id_mecanic, specializare, nume, prenume, salariu, data_angajare)
values (seq_mecanic.nextval, 'Transmisie', 'Voicu', 'Stefan', 4650, TO_DATE('2021-10-03', 'YYYY-MM-DD'));

insert into mecanici (id_mecanic, specializare, nume, prenume, salariu, data_angajare)
values (seq_mecanic.nextval, 'Frane', 'Neagu', 'Valentin', 4500, TO_DATE('2019-12-01', 'YYYY-MM-DD'));

select * from mecanici;

insert into dealeri (id_dealer, total_vanzari, nume, prenume, salariu, data_angajare)
values (seq_dealer.nextval, 600000, 'Ionescu', 'Mircea', 6000, TO_DATE('2018-01-22', 'YYYY-MM-DD'));

insert into dealeri (id_dealer, total_vanzari, nume, prenume, salariu, data_angajare)
values (seq_dealer.nextval, 600000, 'Enache', 'Andrei', 5200, TO_DATE('2020-05-12', 'YYYY-MM-DD'));

insert into dealeri (id_dealer, total_vanzari, nume, prenume, salariu, data_angajare)
values (seq_dealer.nextval, 450000, 'Stoica', 'Cristina', 5000, TO_DATE('2019-08-19', 'YYYY-MM-DD'));

insert into dealeri (id_dealer, total_vanzari, nume, prenume, salariu, data_angajare)
values (seq_dealer.nextval, 700000, 'Dragomir', 'Alexandru', 5500, TO_DATE('2018-03-25', 'YYYY-MM-DD'));

insert into dealeri (id_dealer, total_vanzari, nume, prenume, salariu, data_angajare)
values (seq_dealer.nextval, 750000, 'Neacsu', 'Elena', 5600, TO_DATE('2017-10-07', 'YYYY-MM-DD'));

insert into dealeri (id_dealer, total_vanzari, nume, prenume, salariu, data_angajare)
values (seq_dealer.nextval, 300000, 'Tudor', 'Rares', 4800, TO_DATE('2021-06-11', 'YYYY-MM-DD'));

insert into dealeri (id_dealer, total_vanzari, nume, prenume, salariu, data_angajare)
values (seq_dealer.nextval, 650000, 'Vlad', 'Irina', 5300, TO_DATE('2019-01-04', 'YYYY-MM-DD'));

insert into dealeri (id_dealer, total_vanzari, nume, prenume, salariu, data_angajare)
values (seq_dealer.nextval, 550000, 'Munteanu', 'Daniel', 5100, TO_DATE('2022-02-14', 'YYYY-MM-DD'));

insert into dealeri (id_dealer, total_vanzari, nume, prenume, salariu, data_angajare)
values (seq_dealer.nextval, 800000, 'Sandu', 'Ioana', 5700, TO_DATE('2016-12-21', 'YYYY-MM-DD'));

insert into dealeri (id_dealer, total_vanzari, nume, prenume, salariu, data_angajare)
values (seq_dealer.nextval, 450000, 'Petrescu', 'George', 5000, TO_DATE('2023-04-03', 'YYYY-MM-DD'));

select * from dealeri;

insert into marketing (id_campanie, buget, vin, nume, prenume, salariu, data_angajare)
values (seq_campanie.nextval, 100000, '1HGCM82633A123456', 'Lazar', 'Andreea', 4800, TO_DATE('2021-01-15', 'YYYY-MM-DD'));

insert into marketing (id_campanie, buget, vin, nume, prenume, salariu, data_angajare)
values (seq_campanie.nextval, 150000, '1HGBH41JXMN109186', 'Iliescu', 'Bogdan', 5000, TO_DATE('2019-07-30', 'YYYY-MM-DD'));

insert into marketing (id_campanie, buget, vin, nume, prenume, salariu, data_angajare)
values (seq_campanie.nextval, 120000, '2T1BURHE5JC005163', 'Moldovan', 'Diana', 4900, TO_DATE('2020-10-12', 'YYYY-MM-DD'));

insert into marketing (id_campanie, buget, vin, nume, prenume, salariu, data_angajare)
values (seq_campanie.nextval, 130000, '1FADP3F29JL100001', 'Rusu', 'Ionut', 5050, TO_DATE('2018-03-25', 'YYYY-MM-DD'));

insert into marketing (id_campanie, buget, vin, nume, prenume, salariu, data_angajare)
values (seq_campanie.nextval, 140000, '1FTFW1ET3EFB12345', 'Matei', 'Corina', 5100, TO_DATE('2017-09-08', 'YYYY-MM-DD'));

insert into marketing (id_campanie, buget, vin, nume, prenume, salariu, data_angajare)
values (seq_campanie.nextval, 110000, '1HGCM82633A123456', 'Dobre', 'Roxana', 4700, TO_DATE('2022-04-20', 'YYYY-MM-DD'));

insert into marketing (id_campanie, buget, vin, nume, prenume, salariu, data_angajare)
values (seq_campanie.nextval, 125000, '1HGBH41JXMN109186', 'Avram', 'Stefan', 4950, TO_DATE('2020-06-03', 'YYYY-MM-DD'));

insert into marketing (id_campanie, buget, vin, nume, prenume, salariu, data_angajare)
values (seq_campanie.nextval, 135000, '2T1BURHE5JC005163', 'Sandru', 'Raluca', 5100, TO_DATE('2016-11-19', 'YYYY-MM-DD'));

insert into marketing (id_campanie, buget, vin, nume, prenume, salariu, data_angajare)
values (seq_campanie.nextval, 145000, '1FADP3F29JL100001', 'Coman', 'Adrian', 5200, TO_DATE('2019-02-10', 'YYYY-MM-DD'));

select * from marketing;

insert into piese (id_piesa, denumire, pret, stoc)
values (seq_piesa.nextval, 'Filtru aer', 150, 50);

insert into piese (id_piesa, denumire, pret, stoc)
values (seq_piesa.nextval, 'Filtru ulei', 100, 60);

insert into piese (id_piesa, denumire, pret, stoc)
values (seq_piesa.nextval, 'Placute frana', 200, 40);

insert into piese (id_piesa, denumire, pret, stoc)
values (seq_piesa.nextval, 'Discuri frana', 300, 30);

insert into piese (id_piesa, denumire, pret, stoc)
values (seq_piesa.nextval, 'Amortizoare', 500, 20);

insert into piese (id_piesa, denumire, pret, stoc)
values (seq_piesa.nextval, 'Bucse suspensie', 80, 100);

insert into piese (id_piesa, denumire, pret, stoc)
values (seq_piesa.nextval, 'Lumina far', 120, 70);

insert into piese (id_piesa, denumire, pret, stoc)
values (seq_piesa.nextval, 'Baterie auto', 400, 25);

insert into piese (id_piesa, denumire, pret, stoc)
values (seq_piesa.nextval, 'Placute ambreiaj', 250, 35);

insert into piese (id_piesa, denumire, pret, stoc)
values (seq_piesa.nextval, 'Trecere filtru polen', 60, 90);

select * from piese;

insert into unelte (id_unealta, nume, tip, id_mecanic)
values (seq_unealta.nextval, 'Chei fixe', 'Mecanic', 1);

insert into unelte (id_unealta, nume, tip, id_mecanic)
values (seq_unealta.nextval, 'Elevator auto', 'Mecanic', 2);

insert into unelte (id_unealta, nume, tip, id_mecanic)
values (seq_unealta.nextval, 'Dulgherie', 'Caroserie', 3);

insert into unelte (id_unealta, nume, tip, id_mecanic)
values (seq_unealta.nextval, 'Strung', 'Suspensie', 4);

insert into unelte (id_unealta, nume, tip, id_mecanic)
values (seq_unealta.nextval, 'Chei reglabile', 'Mecanic', 5);

insert into unelte (id_unealta, nume, tip, id_mecanic)
values (seq_unealta.nextval, 'Polizor', 'Caroserie', 6);

insert into unelte (id_unealta, nume, tip, id_mecanic)
values (seq_unealta.nextval, 'Masina de sudura', 'Motor', 7);

insert into unelte (id_unealta, nume, tip, id_mecanic)
values (seq_unealta.nextval, 'Compresor', 'Roti', 8);

insert into unelte (id_unealta, nume, tip, id_mecanic)
values (seq_unealta.nextval, 'Pistol de vopsit', 'Caroserie', 9);

insert into unelte (id_unealta, nume, tip, id_mecanic)
values (seq_unealta.nextval, 'Pompa de aer', 'Suspensie', 10);

select * from unelte;

insert into service (id_service, vin, data_programare, status, id_mecanic)
values (seq_service.nextval, '1HGCM82633A123456', to_date('2025-01-10', 'yyyy-mm-dd'), 'in desfasurare', 1);

insert into service (id_service, vin, data_programare, status, id_mecanic)
values (seq_service.nextval, '1HGBH41JXMN109186', to_date('2025-02-10', 'yyyy-mm-dd'), 'finalizat', 2);

insert into service (id_service, vin, data_programare, status, id_mecanic)
values (seq_service.nextval, '2T1BURHE5JC005163', to_date('2025-03-15', 'yyyy-mm-dd'), 'in desfasurare', 3);

insert into service (id_service, vin, data_programare, status, id_mecanic)
values (seq_service.nextval, '1FADP3F29JL100001', to_date('2025-04-05', 'yyyy-mm-dd'), 'in desfasurare', 4);

insert into service (id_service, vin, data_programare, status, id_mecanic)
values (seq_service.nextval, '1FTFW1ET3EFB12345', to_date('2025-05-18', 'yyyy-mm-dd'), 'finalizat', 5);

insert into service (id_service, vin, data_programare, status, id_mecanic)
values (seq_service.nextval, '3HGGK5G67GM123456', to_date('2025-06-20', 'yyyy-mm-dd'), 'in desfasurare', 6);

insert into service (id_service, vin, data_programare, status, id_mecanic)
values (seq_service.nextval, '4T1BF1FK5HU123456', to_date('2025-07-10', 'yyyy-mm-dd'), 'finalizat', 7);

insert into service (id_service, vin, data_programare, status, id_mecanic)
values (seq_service.nextval, '5TDBY5G14LS123456', to_date('2025-08-12', 'yyyy-mm-dd'), 'in desfasurare', 8);

insert into service (id_service, vin, data_programare, status, id_mecanic)
values (seq_service.nextval, '6FMPJ2A93LB123456', to_date('2025-09-15', 'yyyy-mm-dd'), 'finalizat', 9);

insert into service (id_service, vin, data_programare, status, id_mecanic)
values (seq_service.nextval, '7A1KH4G68KA123456', to_date('2025-10-18', 'yyyy-mm-dd'), 'in desfasurare', 10);

select * from service;

insert into client (id_client, nume, prenume, telefon, adresa)
values (seq_client.nextval, 'Ion', 'Popescu', '0712345678', 'Strada Principala, nr. 10');

insert into client (id_client, nume, prenume, telefon, adresa)
values (seq_client.nextval, 'Maria', 'Ionescu', '0723456789', 'Strada Revolutiei, nr. 15');

insert into client (id_client, nume, prenume, telefon, adresa)
values (seq_client.nextval, 'Vasile', 'Georgescu', '0734567890', 'Strada Litoralului, nr. 8');

insert into client (id_client, nume, prenume, telefon, adresa)
values (seq_client.nextval, 'Elena', 'Radu', '0745678901', 'Strada Marii, nr. 25');

insert into client (id_client, nume, prenume, telefon, adresa)
values (seq_client.nextval, 'Andrei', 'Mihaila', '0756789012', 'Strada Serii, nr. 32');

insert into client (id_client, nume, prenume, telefon, adresa)
values (seq_client.nextval, 'Gabriela', 'Popa', '0767890123', 'Strada Unirii, nr. 5');

insert into client (id_client, nume, prenume, telefon, adresa)
values (seq_client.nextval, 'Adrian', 'Munteanu', '0778901234', 'Strada Salcâmilor, nr. 14');

insert into client (id_client, nume, prenume, telefon, adresa)
values (seq_client.nextval, 'Daniela', 'Ionescu', '0789012345', 'Strada Florilor, nr. 18');

insert into client (id_client, nume, prenume, telefon, adresa)
values (seq_client.nextval, 'Mihai', 'Luca', '0790123456', 'Strada Pietrei, nr. 22');

insert into client (id_client, nume, prenume, telefon, adresa)
values (seq_client.nextval, 'Larisa', 'Tudor', '0801234567', 'Strada Motilor, nr. 10');

select * from client;

insert into vanzare (id_tranzactie, id_client, vin, id_dealer, data_vanzare, pret_final)
values (seq_tranzactie.nextval, 1, '1HGCM82633A123456', 1, to_date('2025-01-15', 'yyyy-mm-dd'), 20000);

insert into vanzare (id_tranzactie, id_client, vin, id_dealer, data_vanzare, pret_final)
values (seq_tranzactie.nextval, 2, '1HGBH41JXMN109186', 2, to_date('2025-02-20', 'yyyy-mm-dd'), 22000);

insert into vanzare (id_tranzactie, id_client, vin, id_dealer, data_vanzare, pret_final)
values (seq_tranzactie.nextval, 3, '2T1BURHE5JC005163', 3, to_date('2025-03-10', 'yyyy-mm-dd'), 18000);

insert into vanzare (id_tranzactie, id_client, vin, id_dealer, data_vanzare, pret_final)
values (seq_tranzactie.nextval, 4, '1FADP3F29JL100001', 4, to_date('2025-04-05', 'yyyy-mm-dd'), 25000);

insert into vanzare (id_tranzactie, id_client, vin, id_dealer, data_vanzare, pret_final)
values (seq_tranzactie.nextval, 5, '1FTFW1ET3EFB12345', 5, to_date('2025-05-18', 'yyyy-mm-dd'), 27000);

insert into vanzare (id_tranzactie, id_client, vin, id_dealer, data_vanzare, pret_final)
values (seq_tranzactie.nextval, 6, '3HGGK5G67GM123456', 6, to_date('2025-06-20', 'yyyy-mm-dd'), 24000);

insert into vanzare (id_tranzactie, id_client, vin, id_dealer, data_vanzare, pret_final)
values (seq_tranzactie.nextval, 7, '4T1BF1FK5HU123456', 7, to_date('2025-07-10', 'yyyy-mm-dd'), 26000);

insert into vanzare (id_tranzactie, id_client, vin, id_dealer, data_vanzare, pret_final)
values (seq_tranzactie.nextval, 8, '5TDBY5G14LS123456', 8, to_date('2025-08-12', 'yyyy-mm-dd'), 23000);

insert into vanzare (id_tranzactie, id_client, vin, id_dealer, data_vanzare, pret_final)
values (seq_tranzactie.nextval, 9, '6FMPJ2A93LB123456', 9, to_date('2025-09-15', 'yyyy-mm-dd'), 29000);

insert into vanzare (id_tranzactie, id_client, vin, id_dealer, data_vanzare, pret_final)
values (seq_tranzactie.nextval, 10, '7A1KH4G68KA123456', 10, to_date('2025-10-18', 'yyyy-mm-dd'), 31000);

select * from vanzare;

insert into test_drive (id_testdrive, id_client, id_dealer, data, durata, vin)
values (seq_testdrive.nextval, 1, 1, to_date('2025-01-15', 'yyyy-mm-dd'), 30, '1HGCM82633A123456');

insert into test_drive (id_testdrive, id_client, id_dealer, data, durata, vin)
values (seq_testdrive.nextval, 2, 2, to_date('2025-02-20', 'yyyy-mm-dd'), 45, '1HGBH41JXMN109186');

insert into test_drive (id_testdrive, id_client, id_dealer, data, durata, vin)
values (seq_testdrive.nextval, 3, 3, to_date('2025-03-10', 'yyyy-mm-dd'), 20, '2T1BURHE5JC005163');

insert into test_drive (id_testdrive, id_client, id_dealer, data, durata, vin)
values (seq_testdrive.nextval, 4, 4, to_date('2025-04-05', 'yyyy-mm-dd'), 40, '1FADP3F29JL100001');

insert into test_drive (id_testdrive, id_client, id_dealer, data, durata, vin)
values (seq_testdrive.nextval, 5, 5, to_date('2025-05-18', 'yyyy-mm-dd'), 35, '1FTFW1ET3EFB12345');

insert into test_drive (id_testdrive, id_client, id_dealer, data, durata, vin)
values (seq_testdrive.nextval, 6, 6, to_date('2025-06-20', 'yyyy-mm-dd'), 50, '3HGGK5G67GM123456');

insert into test_drive (id_testdrive, id_client, id_dealer, data, durata, vin)
values (seq_testdrive.nextval, 7, 7, to_date('2025-07-10', 'yyyy-mm-dd'), 25, '4T1BF1FK5HU123456');

insert into test_drive (id_testdrive, id_client, id_dealer, data, durata, vin)
values (seq_testdrive.nextval, 8, 8, to_date('2025-08-12', 'yyyy-mm-dd'), 60, '5TDBY5G14LS123456');

insert into test_drive (id_testdrive, id_client, id_dealer, data, durata, vin)
values (seq_testdrive.nextval, 9, 9, to_date('2025-09-15', 'yyyy-mm-dd'), 30, '6FMPJ2A93LB123456');

insert into test_drive (id_testdrive, id_client, id_dealer, data, durata, vin)
values (seq_testdrive.nextval, 10, 10, to_date('2025-10-18', 'yyyy-mm-dd'), 40, '7A1KH4G68KA123456');

select * from test_drive;


insert into utilizare_unelte (id_utilizare, id_unealta, id_mecanic, data_inceput, data_sfarsit)
values (seq_utilizare_unealta.nextval, 1, 1, to_date('2025-01-10', 'yyyy-mm-dd'), to_date('2025-01-15', 'yyyy-mm-dd'));

insert into utilizare_unelte (id_utilizare, id_unealta, id_mecanic, data_inceput, data_sfarsit)
values (seq_utilizare_unealta.nextval, 2, 2, to_date('2025-02-20', 'yyyy-mm-dd'), to_date('2025-02-25', 'yyyy-mm-dd'));

insert into utilizare_unelte (id_utilizare, id_unealta, id_mecanic, data_inceput, data_sfarsit)
values (seq_utilizare_unealta.nextval, 3, 3, to_date('2025-03-05', 'yyyy-mm-dd'), to_date('2025-03-07', 'yyyy-mm-dd'));

insert into utilizare_unelte (id_utilizare, id_unealta, id_mecanic, data_inceput, data_sfarsit)
values (seq_utilizare_unealta.nextval, 4, 4, to_date('2025-04-10', 'yyyy-mm-dd'), to_date('2025-04-12', 'yyyy-mm-dd'));

insert into utilizare_unelte (id_utilizare, id_unealta, id_mecanic, data_inceput, data_sfarsit)
values (seq_utilizare_unealta.nextval, 5, 5, to_date('2025-05-15', 'yyyy-mm-dd'), to_date('2025-05-18', 'yyyy-mm-dd'));

insert into utilizare_unelte (id_utilizare, id_unealta, id_mecanic, data_inceput, data_sfarsit)
values (seq_utilizare_unealta.nextval, 6, 6, to_date('2025-06-20', 'yyyy-mm-dd'), to_date('2025-06-22', 'yyyy-mm-dd'));

insert into utilizare_unelte (id_utilizare, id_unealta, id_mecanic, data_inceput, data_sfarsit)
values (seq_utilizare_unealta.nextval, 7, 7, to_date('2025-07-10', 'yyyy-mm-dd'), to_date('2025-07-15', 'yyyy-mm-dd'));

insert into utilizare_unelte (id_utilizare, id_unealta, id_mecanic, data_inceput, data_sfarsit)
values (seq_utilizare_unealta.nextval, 8, 8, to_date('2025-08-12', 'yyyy-mm-dd'), to_date('2025-08-16', 'yyyy-mm-dd'));

insert into utilizare_unelte (id_utilizare, id_unealta, id_mecanic, data_inceput, data_sfarsit)
values (seq_utilizare_unealta.nextval, 9, 9, to_date('2025-09-05', 'yyyy-mm-dd'), to_date('2025-09-07', 'yyyy-mm-dd'));

insert into utilizare_unelte (id_utilizare, id_unealta, id_mecanic, data_inceput, data_sfarsit)
values (seq_utilizare_unealta.nextval, 10, 10, to_date('2025-10-10', 'yyyy-mm-dd'), to_date('2025-10-12', 'yyyy-mm-dd'));

select * from utilizare_unelte;

insert into promovare (id_promovare, vin, perioada, id_campanie)
values (seq_promovare.nextval, '1HGBH41JXMN109186', '2025-02-01 to 2025-04-30', 2);

insert into promovare (id_promovare, vin, perioada, id_campanie)
values (seq_promovare.nextval, '2T1BURHE5JC005163', '2025-03-01 to 2025-05-31', 3);

insert into promovare (id_promovare, vin, perioada, id_campanie)
values (seq_promovare.nextval, '1FADP3F29JL100001', '2025-04-01 to 2025-06-30', 4);

insert into promovare (id_promovare, vin, perioada, id_campanie)
values (seq_promovare.nextval, '1FTFW1ET3EFB12345', '2025-05-01 to 2025-07-31', 5);

insert into promovare (id_promovare, vin, perioada, id_campanie)
values (seq_promovare.nextval, '3HGGK5G67GM123456', '2025-06-01 to 2025-08-31', 6);

insert into promovare (id_promovare, vin, perioada, id_campanie)
values (seq_promovare.nextval, '4T1BF1FK5HU123456', '2025-07-01 to 2025-09-30', 7);

insert into promovare (id_promovare, vin, perioada, id_campanie)
values (seq_promovare.nextval, '5TDBY5G14LS123456', '2025-08-01 to 2025-10-31', 8);

insert into promovare (id_promovare, vin, perioada, id_campanie)
values (seq_promovare.nextval, '6FMPJ2A93LB123456', '2025-09-01 to 2025-11-30', 9);

select * from promovare;

insert into programari_service (id_programare, vin, id_service, data_programare, observatii)
values (seq_programare.nextval, '1HGCM82633A123456', 1, to_date('2025-01-10', 'yyyy-mm-dd'), 'Schimb ulei');

insert into programari_service (id_programare, vin, id_service, data_programare, observatii)
values (seq_programare.nextval, '1HGBH41JXMN109186', 2, to_date('2025-02-20', 'yyyy-mm-dd'), 'Revizie tehnica');

insert into programari_service (id_programare, vin, id_service, data_programare, observatii)
values (seq_programare.nextval, '2T1BURHE5JC005163', 3, to_date('2025-03-05', 'yyyy-mm-dd'), 'Schimb discuri si placute de frana');

insert into programari_service (id_programare, vin, id_service, data_programare, observatii)
values (seq_programare.nextval, '1FADP3F29JL100001', 4, to_date('2025-04-10', 'yyyy-mm-dd'), 'Intretinere sistem de climatizare');

insert into programari_service (id_programare, vin, id_service, data_programare, observatii)
values (seq_programare.nextval, '1FTFW1ET3EFB12345', 5, to_date('2025-05-15', 'yyyy-mm-dd'), 'Verificare motor');

insert into programari_service (id_programare, vin, id_service, data_programare, observatii)
values (seq_programare.nextval, '3HGGK5G67GM123456', 6, to_date('2025-06-01', 'yyyy-mm-dd'), 'Reparare sistem de directie');

insert into programari_service (id_programare, vin, id_service, data_programare, observatii)
values (seq_programare.nextval, '4T1BF1FK5HU123456', 7, to_date('2025-06-25', 'yyyy-mm-dd'), 'Inlocuire baterie');

insert into programari_service (id_programare, vin, id_service, data_programare, observatii)
values (seq_programare.nextval, '5TDBY5G14LS123456', 8, to_date('2025-07-10', 'yyyy-mm-dd'), 'Verificare frane si suspensie');

insert into programari_service (id_programare, vin, id_service, data_programare, observatii)
values (seq_programare.nextval, '6FMPJ2A93LB123456', 9, to_date('2025-08-12', 'yyyy-mm-dd'), 'Schimb ulei si filtre');

insert into programari_service (id_programare, vin, id_service, data_programare, observatii)
values (seq_programare.nextval, '7A1KH4G68KA123456', 10, to_date('2025-09-18', 'yyyy-mm-dd'), 'Intretinere generala');

select * from programari_service;

/*Pentru fiecare client care are o garantie activa (neexpirata) la o masina cumparata, returnam numele si prenumele
clientului si cate masini a cumparat cu un pret final mai mare decat pretul mediu al tuturor vanzarilor.*/

select 
    c.nume,
    c.prenume,
    (
        select count(*)
        from vanzare v
        where v.id_client = c.id_client
        and v.pret_final > (
            select avg(pret_final) from vanzare
        )
    ) as masini_scumpe_cumparate
from client c
where exists (
    select 1
    from vanzare v2
    join garantie g on v2.vin = g.vin
    where v2.id_client = c.id_client
    and add_months(g.data_inceput, g.durata) > sysdate
);

/*
Afisam pentru fiecare client care a cumparat o masina, numele, prenumele si numarul total de masini hibride cumparate.
*/

select c.nume, c.prenume, m_total.nr_hibrid
from client c
join (
    select v.id_client, count(*) as nr_hibrid
    from vanzare v
    join masina m on v.vin = m.vin
    where lower(m.motorizare) = 'hibrid'
    group by v.id_client
) m_total on c.id_client = m_total.id_client;

/*Afisam specializarile mecanicilor care au lucrat la cel putin o masina si care au un salariu mediu 
mai mare decat salariul mediu al tuturor mecanicilor.*/

select m.specializare,
       count(distinct s.vin) as nr_masini,
       avg(m.salariu) as salariu_mediu
from mecanici m
join service s on m.id_mecanic = s.id_mecanic
join masina ma on s.vin = ma.vin
group by m.specializare
having avg(m.salariu) > (
    select avg(salariu) from mecanici
);

/*Afisam serviciile realizate, mecanicul care le-a efectuat, statusul (recent sau vechi), si un discount
aplicat in functie de specializare. Daca specializarea este 'Frane', se aplica un discount de 10% din
salariul mecanicului. Rezultatul va fi ordonat descrescator dupa discount.
*/

select s.id_service,
       me.nume || ' ' || me.prenume as mecanic,
       case 
           when s.data_programare >= sysdate - 30 then 'Recent'
           else 'Vechi'
       end as status,
       nvl(decode(me.specializare, 'Frane', me.salariu * 0.1, null), 0) as discount_frane
from service s
join mecanici me on s.id_mecanic = me.id_mecanic
order by discount_frane desc;

/*Afisati pentru primii 3 mecanici care au lucrat la cele mai multe masini numele complet formatat,
lungimea numelui, numarul de masini, data si anul ultimei interventii si statusul recenta/vechi,
folosind functii pe siruri, functii pe date, expresie CASE si clauza WITH.*/

with top_mecanici as (
    select s.id_mecanic,
           count(distinct s.vin) as nr_masini,
           max(s.data_programare) as ultima_interventie
    from service s
    group by s.id_mecanic
    order by nr_masini desc
    fetch first 3 rows only
)
select 
    me.id_mecanic,
    upper(me.nume) || ' ' || initcap(me.prenume) as mecanic_formatat,
    length(me.nume) + length(me.prenume) as lungime_nume,
    top_mecanici.nr_masini,
    top_mecanici.ultima_interventie,
    extract(year from top_mecanici.ultima_interventie) as an_interventie,
    case
        when months_between(sysdate, top_mecanici.ultima_interventie) < 1 then 'Recent'
        else 'Mai vechi'
    end as status_interventie
from top_mecanici
join mecanici me on me.id_mecanic = top_mecanici.id_mecanic;



-- Actualizeaza pretul pentru masinile vandute de un dealer cu id impar
update masina m
set m.pret = m.pret * 1.10
where m.vin in (
    select v.vin
    from vanzare v
    join dealeri d on v.id_dealer = d.id_dealer
    where mod(d.id_dealer, 2) = 1
);

-- Actualizeaza starea masinilor vandute in mai mult de o luna
update masina m
set m.stare = 'Second-hand'
where m.vin in (
    select v.vin
    from vanzare v
    join dealeri d on v.id_dealer = d.id_dealer
    where months_between(sysdate, v.data_vanzare) > 1
);

-- Sterge tranzactiile pentru clienti care au cumparat de la dealerii cu id impar si nu au cumparat in ultimele 2 luni
delete from vanzare v
where v.id_client in (
    select c.id_client
    from client c
    join vanzare v2 on c.id_client = v2.id_client
    join dealeri d on v2.id_dealer = d.id_dealer
    where mod(d.id_dealer, 2) = 1 -- Dealerii cu id impar
    and not exists (
        select 1
        from vanzare v3
        where v3.id_client = c.id_client
        and months_between(sysdate, v3.data_vanzare) < 1 -- Verificam tranzactiile din ultimele 2 luni
    )
);

create view detalii_vanzari as
select 
    c.id_client,
    c.nume || ' ' || c.prenume as nume_client,
    v.id_tranzactie,
    m.model,
    v.pret_final
from 
    client c
join 
    vanzare v on c.id_client = v.id_client
join 
    masina m on v.vin = m.vin;

create view masina_view as
select 
    vin, 
    model, 
    an_fabricatie, 
    culoare, 
    motorizare, 
    pret, 
    stare, 
    tractiune
from masina;

insert into masina_view (vin, model, an_fabricatie, culoare, motorizare, pret, stare, tractiune)
values (123456, 'X4', 2022, 'Albastru', 'Benzina', 15000, 'Noua', 'Fata');

delete from masina_view
where vin = '123456';

select * from masina_view where vin = '123456';


update masina_view
set model = 'X4', 
    an_fabricatie = 2023, 
    culoare = 'Albastru', 
    motorizare = 'Benzina', 
    pret = 25000, 
    stare = 'Noua', 
    tractiune = 'Integrala'
where vin = '123456';

select * from masina_view where vin = '123456';

select 
    p.id_promovare, 
    p.id_campanie, 
    p.vin, 
    p.perioada, 
    m.model
from
    promovare p
join 
    masina m on p.vin = m.vin;


select m.*, c.id_client, c.telefon
from masina m
join client c on 1=1;

select table_copie_permite_acces as select(
    select id_acces, id_bilet, id_sectiune
    from permite_acces
);

update autovehicule
set pret = pret - 1000
where id_autovehicul in (
    select id_autovehicul
    from (
        select a.id_autovehicul, count(i.id_interventie) as nr_programari
        from autovehicule a
        left join interventie i on a.id_autovehicul = i.id_autovehicul
        where i.id_interventie is not null
        group by a.id_autovehicul
        having count(i.id_interventie) = (
            select max(nr_prog)
            from (
                select count(i2.id_interventie) as nr_prog
                from autovehicule a2
                left join interventie i2 on a2.id_autovehicul = i2.id_autovehicul
                where i2.id_interventie is not null
                group by a2.id_autovehicul
            )
        )
    )
);

select a.*
from autovehicule a
left join interventie i on a.id_autovehicul = i.id_autovehicul
where a.id_client is null
group by a.id_autovehicul, a.nr_inmatriculare, a.marca, a.tip, a.id_client
having count(i.id_interventie) = (
    select max(cnt)
    from (
        select count(i2.id_interventie) as cnt
        from autovehicule a2
        left join interventie i2 on a2.id_autovehicul = i2.id_autovehicul
        where a2.id_client is null
        group by a2.id_autovehicul
    )
);

alter table copie_permite_acces
add constraint id_bilet_fk foreign key(id_bilet) references
bilete(id_bilet);

alter table copie_permite_acces
add constrait id_sectiunr_fk foreign key(id_sectiune)
references sectiuni(id_sectiune);



create table masina_copie as select * from masina;

-- Sa se afiseze masinile nevandute, care au avut cel mai mare numar de programari in service.
-- selectez id, model si pret

update masina
set pret = pret-1000
where vin in (
select a.vin
    from masina a
    join programari_service i on a.vin = i.vin
    left join vanzare v on a.vin = v.vin
    where v.id_tranzactie is null
    group by a.vin, a.model, a.pret
    having count(i.id_programare) = (
        select max(cnt)
        from (
            select count(i2.id_programare) as cnt
            from masina a2
            join programari_service i2 on a2.vin = i2.vin
            left join vanzare v2 on a2.vin = v2.vin
            where v2.id_tranzactie is null
            group by a2.vin
        )
    )
);


select a.vin, a.model, a.pret
from masina a
join programari_service i on a.vin = i.vin
left join vanzare v on a.vin = v.vin
where v.id_tranzactie is null
group by a.vin, a.model, a.pret
having count(i.id_programare) = (
    select max(cnt)
    from (
        select count(i2.id_programare) as cnt
        from masina a2
        join programari_service i2 on a2.vin = i2.vin
        left join vanzare v2 on a2.vin = v2.vin
        where v2.id_tranzactie is null
        group by a2.vin
    )
);
