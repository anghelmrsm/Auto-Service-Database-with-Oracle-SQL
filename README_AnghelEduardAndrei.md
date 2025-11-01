



Baza de date a unei reprezentante auto
Anghel Eduard-Andrei





















1. Descrierea modelului real, a utilitatii acestuita si a regulilor de functionare:
Descrierea modelului real si a utilitatii acestuia:
Proiectul are ca scop organizarea si gestionarea tuturor activitatilor din cadrul unei reprezentante auto, printr-un model relational de baza de date. Acest model acopera aspecte precum vanzarea de masini, programarile la service, activitatea mecanicilor, test drive-urile, piesele auto, uneltele utilizate si campaniile de marketing.
Sistemul este adresat in principal angajatilor reprezentantei – fie ca sunt dealeri, mecanici sau personal administrativ – oferindu-le un cadru centralizat pentru accesul la informatii esentiale. Prin intermediul acestui model, procesele devin mai rapide, mai clare si mai usor de monitorizat.
Utilitatea reala a sistemului este data de capacitatea de a:
urmari istoricul fiecarei masini (stare, vanzare, service),
asocia corect clientii cu test drive-urile si vanzarile,
repartiza unelte si sarcini mecanicilor,
gestiona piesele din stoc si consumul acestora,
urmari eficienta campaniilor de promovare. 
Regulile de functionare ale modelului:
• Mecanicul poate avea un set propriu de unelte si o specializare asociata.
• O masina este identificata printr-un cod VIN unic si poate fi: vanduta, testata, programata la service sau promovata prin marketing.
• Fiecare vanzare este legata de un client, un dealer si o masina. Se pastreaza data tranzactiei si pretul final.
• Un test drive este asociat unui client, unei masini si unui dealer. Este inregistrata durata si data testului.
• O garantie se acorda o singura data pentru o masina si are o durata si o data de inceput.
• In cazul unei programari in service, sunt inregistrate detalii precum data, masina si starea lucrarii. Se poate urmari exact ce unelte au fost folosite.
• Fiecare piesa are o denumire, un pret si o cantitate in stoc. Poate fi comandata de mai multi mecanici.
• Campaniile de marketing sunt legate de modele de masini si au un buget definit. Ele permit urmarirea promovarii si impactului comercial.
2.Prezentarea constrangerilor (restrictii, reguli) impuse asupra modelului: 
 Fiecare mecanic poate utiliza una sau mai multe unelte. O unealta poate fi folosita de mai multi mecanici, dar nu simultan in acelasi service.
 Un dealer se ocupa de procesele de vanzare si test drive. Un dealer poate gestiona mai multe vanzari sau sesiuni de test drive, dar fiecare vanzare este realizata de un singur dealer.
 O masina este identificata printr-un cod VIN unic. O masina poate fi implicata intr-un singur proces de vanzare si poate avea o singura garantie asociata. Totusi, poate fi testata de mai multi clienti inainte de vanzare.
 Un client poate testa mai multe masini.
 Orice masina care nu este vanduta poate fi programata in service. O masina poate avea mai multe intrari in service.
 O piesa are un stoc limitat si un pret fix. Nu se pot inregistra utilizari ale piesei in service daca nu exista stoc disponibil.
 Campaniile de marketing sunt asociate unor modele de masini. O campanie poate promova mai multe modele, dar un model poate fi inclus in una sau mai multe campanii.
 Fiecare test drive este legat de un client, un dealer si o masina. Nu se pot efectua test drive-uri fara informatii complete.
 Pentru fiecare masina poate exista cel mult o garantie. O garantie are o data de inceput si o durata limitata.
 Fiecare mecanic, dealer sau angajat in marketing are un istoric unic, care include data angajarii si rolul ocupat.








3. Descrierea entităților, incluzând precizarea cheii primare:
Entitatile folosite in model sunt: ANGAJATI, MECANICI, DEALERI, CLIENT, MASINA, VANZARE, GARANTIE, SERVICE, PIESE, UNELTE, TEST\_DRIVE, MARKETING
 MECANICI = entitate care reprezinta personalul specializat in intretinere si reparatii. Contine informatii despre specializarea fiecarui mecanic. Cheia primara este id\_mecanic
 DEALERI = entitate care retine personalul implicat in procesul de vanzare si gestionare test drive. Cheia primara este id\_dealer
 CLIENT = entitate care memoreaza informatii (nume, prenume, adresa, telefon) despre persoanele care au efectuat achizitii si au efectuat test drive-uri. Cheia primara este id\_client
 MASINA = entitate care pastreaza date detaliate(model, an de fabricatie, culoare, motorizare, pret, stare, tractiune) despre fiecare autovehicul disponibil in sistem. Cheia primara este VIN (numarul de identificare al vehiculului)
 VANZARE = entitate care inregistreaza tranzactiile de vanzare si retine detalii contractuale (data vanzare, pret final). Este legata de client, masina si dealer. Cheia primara este id\_vanzare
 GARANTIE = entitate care gestioneaza garantiile oferite dupa vanzarea unei masini. Include durata si data de inceput. Cheia primara este id\_garantie
 SERVICE = entitate care descrie interventiile tehnice realizate asupra masinilor. Stocheaza data programarii, statusul si referinta la mecanic si masina. Cheia primara este id\_service
 PIESE = entitate care memoreaza toate piesele disponibile in stoc, cu pret, denumire si cantitate. Cheia primara este id\_piesa
 UNELTE = entitate care include toate uneltele (elevatoare, chei, scule) utilizate in service. Fiecare unealta este asociata unui mecanic. Cheia primara este id\_unealta
 TEST\_DRIVE = entitate care retine programarile pentru test drive, legate de masina, client si dealer. Cheia primara este id\_testdrive
 MARKETING = entitate care pastreaza informatii despre campaniile de promovare a unor modele de masini. Include personal, buget, perioada si modelul promovat. Cheia primara este id\_campanie

4.Descrierea relatiilor, incluzand precizarea cadinalitatii acestora.

 Dealeri – Vanzare
Relatia este de tip 1:N. Un dealer poate realiza mai multe vânzări, însă fiecare vânzare este gestionată de un singur dealer.
 Client – Vanzare
Relatia este de tip 1:N. Un client poate avea mai multe achizitii, dar fiecare vanzare apartine unui singur client.
 Masina – Vanzare
Relatia este de tip 1:n. O masina poate fi vanduta o singura data (fiind identificata prin VIN), iar o vanzare este asociata uneia sau mai multor masini.
 Masina – Garantie
Relatia este de tip 1:1. O masina poate avea cel mult o garantie activa.
 Masina – Service
Relatia este de tip 1:N. O masina poate intra in service de mai multe ori, fiecare intrare reprezentand o programare separata.
 Mecanici – Service
Relatia este de tip N:1. Un mecanic poate lucra in singurul service din reprezentanta, dar serviceul are mai multi angajati.
 Mecanici – Unelte
Relatia este de tip N:N. Uneltele se pot folosi de mai multi mecanici daca sunt disponibile, iar un mecanic poate folosi mai multe unelte.
 Service – Piese
Relatia este de tip 1:N. Un service poate utiliza mai multe piese, iar o piesa poate fi folosita in serviceul reprezentantei. 
 Client – Test Drive
Relatia este de tip 1:N. Un client poate efectua mai multe test drive-uri, dar fiecare test drive este legat de un singur client.
 Dealer – Test Drive
Relatia este de tip 1:N. Un dealer poate organiza mai multe test drive-uri, iar fiecare test drive este legat de un singur dealer.
 Masina – Test Drive
Relatia este de tip 1:N. O masina poate fi testata de mai multi clienit, fiecare test drive fiind o entitate distincta.
 Marketing – Masina (VIN)
Relatia este de tip N:N. O campanie de marketing poate promova mai multe modele de masini, iar o masina poate fi promovata în mai multe campanii.
5. Descrierea atributelor, incluzând tipul de date și eventualele constrângeri, valori implicite, valori posibile ale atributelor.
Descrierea atributelor, tipul de date si constrangerile acestora:
PIESE
 id\_piesa: INT (PK) – Identificator unic pentru fiecare piesa.
 denumire: VARCHAR(200) – Numele piesei. Constrangere: Nu poate fi NULL.
 pret: INT – Pretul piesei. Constrangere: Nu poate fi NULL, valoare minima > 0.
 stoc: INT – Cantitatea disponibila in stoc. Constrangere: Nu poate fi NULL, valoare minima 0.
MECANICI
 id\_mecanic: INT (PK) – Identificator unic pentru fiecare mecanic.
 specializare: VARCHAR(100) – Specializarea mecanicului. Constrangere: Nu poate fi NULL.
 nume: VARCHAR(100) – Numele angajatului. Constrangere: Nu poate fi NULL.
 prenume: VARCHAR(100) – Prenumele angajatului. Constrangere: Nu poate fi NULL.
 salariu: INT – Salariul angajatului. Constrangere: Nu poate fi NULL, valoare minima > 0.
 data\_angajare: DATE – Data angajarii. Constrangere: Nu poate fi NULL.
DEALERI
 id\_dealer: INT (PK, Auto Increment) – Identificator unic pentru fiecare dealer.
 total\_vanzari: INT – Suma totala a vanzarilor realizate de dealer. Constrangere: Nu poate fi NULL, valoare minima > 0.
 nume: VARCHAR(100) – Numele angajatului. Constrangere: Nu poate fi NULL.
 prenume: VARCHAR(100) – Prenumele angajatului. Constrangere: Nu poate fi NULL.
 salariu: INT – Salariul angajatului. Constrangere: Nu poate fi NULL, valoare minima > 0.
 data\_angajare: DATE – Data angajarii. Constrangere: Nu poate fi NULL.
UNELTE
 id\_unealta: INT (PK) – Identificator unic pentru fiecare unealta.
 nume: VARCHAR(100) – Numele uneltei. Constrangere: Nu poate fi NULL.
 tip: VARCHAR(100) – Tipul uneltei (ex: elevator, chei). Constrangere: Nu poate fi NULL.
 id\_mecanic: INT (FK) – Identificatorul mecanicului care foloseste unealta. Constrangere: Nu poate fi NULL, referinta la entitatea MECANICI.
SERVICE
 id\_service: INT (PK) – Identificator unic pentru fiecare programare de service.
 id\_masina: VARCHAR(20) (FK) – VIN-ul masinii programate la service. Constrangere: Nu poate fi NULL, referinta la entitatea MASINA.
 data\_programare: DATE – Data programarii la service. Constrangere: Nu poate fi NULL.
 status: VARCHAR(20) – Statusul lucrarii (ex: "in desfasurare", "finalizat"). Constrangere: Nu poate fi NULL.
 id\_mecanic: INT (FK) – Identificatorul mecanicului responsabil de lucrare. Constrangere: Nu poate fi NULL, referinta la entitatea MECANICI.
GARANTIE
 id\_garantie: INT (PK) – Identificator unic pentru fiecare garantie.
 VIN: VARCHAR(20) (FK) – VIN-ul masinii care beneficiaza de garantie. Constrangere: Nu poate fi NULL, referinta la entitatea MASINA.
 durata: INT – Durata garantiei (in luni). Constrangere: Nu poate fi NULL, valoare minima > 0.
 data\_inceput: DATE – Data inceperii garantiei. Constrangere: Nu poate fi NULL.
MASINA
 VIN: INT (PK) – Numarul de identificare unic al vehiculului.
 model: VARCHAR(100) – Modelul masinii. Constrangere: Nu poate fi NULL.
 an\_fabricatie: NUMBER(4) – Anul de fabricatie al masinii. Constrangere: Nu poate fi NULL.
 culoare: VARCHAR(50) – Culoarea masinii. Constrangere: Nu poate fi NULL.
 motorizare: VARCHAR(50) – Tipul motorizarii (ex: diesel, benzina). Constrangere: Nu poate fi NULL.
 pret: INT – Pretul masinii. Constrangere: Nu poate fi NULL, valoare minima > 0.
 stare: VARCHAR(50) – Starea masinii (noua, second-hand). Constrangere: Nu poate fi NULL.
 tractiune: VARCHAR(50) – Tipul de tractiune (ex: fata, spate, integrala). Constrangere: Nu poate fi NULL.
VANZARE
 id\_tranzactie: INT (PK) – Identificator unic pentru fiecare tranzactie de vanzare.
 id\_client: INT (FK) – Identificatorul clientului care achizitioneaza. Constrangere: Nu poate fi NULL, referinta la entitatea CLIENT.
 VIN: VARCHAR(20) (FK) – VIN-ul masinii vandute. Constrangere: Nu poate fi NULL, referinta la entitatea MASINA.
 id\_dealer: INT (FK) – Identificatorul dealerului responsabil de vanzare. Constrangere: Nu poate fi NULL, referinta la entitatea DEALERI.
 data\_vanzare: DATE – Data vanzarii. Constrangere: Nu poate fi NULL.
 pret\_final: INT – Pretul final al tranzactiei. Constrangere: Nu poate fi NULL, valoare minima > 0.
9. CLIENT
 id\_client: INT (PK) – Identificator unic pentru fiecare client.
 nume: VARCHAR(100) – Numele clientului. Constrangere: Nu poate fi NULL.
 prenume: VARCHAR(100) – Prenumele clientului. Constrangere: Nu poate fi NULL.
 telefon: VARCHAR(20) – Numarul de telefon al clientului. Constrangere: Nu poate fi NULL.
 adresa: VARCHAR(200) – Adresa clientului. Constrangere: Nu poate fi NULL.
10. TEST DRIVE
 id\_testdrive: INT (PK) – Identificator unic pentru fiecare test drive.
 id\_client: INT (FK) – Identificatorul clientului care efectueaza testul. Constrangere: Nu poate fi NULL, referinta la entitatea CLIENT.
 id\_dealer: INT (FK) – Identificatorul dealerului care coordoneaza testul. Constrangere: Nu poate fi NULL, referinta la entitatea DEALERI.
 data: DATE – Data test drive-ului. Constrangere: Nu poate fi NULL.
 durata: INT – Durata test drive-ului in minute. Constrangere: Nu poate fi NULL, valoare minima > 0.
 VIN: VARCHAR(20) (FK) – VIN-ul masinii testate. Constrangere: Nu poate fi NULL, referinta la entitatea MASINA.
 11. MARKETING
 id\_campanie: INT (PK) – Identificator unic pentru fiecare campanie de marketing.
 buget: INT – Bugetul alocat campaniei. Constrangere: Nu poate fi NULL, valoare minima > 0.
 VIN: VARCHAR(20) (FK) – VIN-ul masinii promovate. Constrangere: Nu poate fi NULL, referinta la entitatea MASINA.
 nume: VARCHAR(100) – Numele angajatului. Constrangere: Nu poate fi NULL.
 prenume: VARCHAR(100) – Prenumele angajatului. Constrangere: Nu poate fi NULL.
 salariu: INT – Salariul angajatului. Constrangere: Nu poate fi NULL, valoare minima > 0.
 data\_angajare: DATE – Data angajarii. Constrangere: Nu poate fi NULL.













6. Realizarea diagramei entitate-relație corespunzătoare descrierii de la punctele 3-5.




















7. Realizarea diagramei conceptuale corespunzătoare diagramei entitate-relație proiectate la punctul 6.















8. Enumerarea schemelor relaționale corespunzătoare diagramei conceptuale proiectate la punctul 7.

• MECANICI (PK: id\_mecanic, data\_angajare, specializare, nume, prenume, salariu)
• DEALERI (PK: id\_dealer, total\_vanzari, data\_angajare, nume, prenume, salariu)
• MARKETING (PK: id\_campanie, buget, FK: VIN, data\_angajare, nume, prenume, salariu)
• CLIENT (PK: id\_client, nume, prenume, telefon, adresa)
• MASINA (PK: VIN, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
• VANZARE (PK: id\_tranzactie, FK: id\_client, FK: VIN, FK: id\_dealer, data\_vanzare, pret\_final)
• GARANTIE (PK: id\_garantie, FK: VIN, durata, data\_inceput)
• SERVICE (PK: id\_service, FK: VIN, data\_programare, status, FK: id\_mecanic)
• PIESE (PK: id\_piesa, denumire, pret, stoc)
• UNELTE (PK: id\_unealta, nume, tip)
• UTILIZARE\_UNELTE (PK: id\_utilizare, FK: id\_unealta, FK: id\_mecanic, data\_inceput, data\_sfarsit)
• TEST\_DRIVE (PK: id\_testdrive, FK: id\_client, FK: id\_dealer, data, durata, FK: VIN)
 PROMOVARE (PK: id\_promovare, FK: id\_campanie, FK: VIN, perioada)
 PROGRAMARI SERVICE (PK: id\_programare, FK:VIN, FK: id\_service, data\_programare, observatii)












9. Realizarea normalizării până la forma normală 3 (FN1-FN3).

1. Forma Normala 1 (FN1) – Fara grupuri de valori repetate (fiecare coloana din tabel trebuie sa contina valori atomice, adica nu trebuie sa contina liste sau grupuri de valori). Un exemplu pentru non-FN1 este daca in entitatea CLIENTI am avea o tabela cu mai multe numere de telefon, iar contraexemplul cu un singur numar reprezinta FN1.
Exemplu FN1:

Exemplu non-FN1:


 2. Forma Normala 2 (FN2) – presupune urmatoarele conditii: tabelul trebuie sa fie in FN1 (adica, fiecare coloana trebuie sa contina valori atomice, fara grupuri de valori multiple intr-o singura coloana). In plus fata de FN1, fiecare coloana non-cheie trebuie sa depinda complet de cheia primara. Adica, nu trebuie sa existe dependente partiale. Vom lua ca exemplu tabela PROMOVARE in care perioada se leaga direct de cheia primara(id\_promovare). In cel de al doilea apare si marca fiecarei masini dupa VIN. 
Exemplu FN2:

Exemplu non-FN2:

 1. FN3 (Tabel care nu respecta FN3) - Un tabel este considerat non-FN3 atunci cand exista dependente tranzitive. Asta inseamna ca o coloana non-cheie depinde de alta coloana non-cheie, în loc sa depinda direct de cheia primara. Un exemplu pentru FN3 il reprezinta entitatea MASINA care contine doar detalii tehnice ce se leaga de cheia prinipala (VIN). In schimb daca am mai avea id\_client si numarul sau de telefon acesta va devein non-FN3.
Exemplu FN3:

Exemplu non-FN3:











10.Crearea unei secvențe ce va fi utilizată în inserarea înregistrărilor în tabele (punctul 11).

create sequence seq\_mecanic
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_dealer
 start with 1
 increment by 1
 nocache
 nocycle;
 
create sequence seq\_campanie
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_client
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_masina
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_tranzactie
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_garantie
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_service
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_piesa
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_unealta
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_utilizare\_unealta
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_testdrive
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_promovare
 start with 1
 increment by 1
 nocache
 nocycle;

create sequence seq\_programare
 start with 1
 increment by 1
 nocache
 nocycle;


 






11. Crearea tabelelor în SQL și inserarea de date coerente în fiecare dintre acestea (minimum 5 înregistrări în fiecare tabel neasociativ; minimum 10 înregistrări în tabelele asociative; maxim 30 de înregistrări în fiecare tabel).

1) Crearea tabelelor

create table client (
 id\_client int primary key,
 nume varchar(100) not null,
 prenume varchar(100) not null,
 telefon varchar(20) not null,
 adresa varchar(200) not null
);

create table masina (
 vin varchar(20) primary key,
 model varchar(100) not null,
 an\_fabricatie number(4) not null,
 culoare varchar(50) not null,
 motorizare varchar(50) not null,
 pret int not null check (pret > 0),
 stare varchar(50) not null,
 tractiune varchar(50) not null
);

create table vanzare (
 id\_tranzactie int primary key,
 id\_client int not null,
 vin varchar(20) not null,
 id\_dealer int not null,
 data\_vanzare date not null,
 pret\_final int not null check (pret\_final > 0),
 foreign key (id\_client) references client(id\_client),
 foreign key (vin) references masina(vin)
);

create table garantie (
 id\_garantie int primary key,
 vin varchar(20) not null,
 durata int not null check (durata > 0),
 data\_inceput date not null,
 foreign key (vin) references masina(vin)
);

create table mecanici (
 id\_mecanic int primary key,
 specializare varchar(100) not null,
 nume varchar(100) not null,
 prenume varchar(100) not null,
 salariu int not null check (salariu > 0),
 data\_angajare date not null
);

create table dealeri (
 id\_dealer int primary key,
 total\_vanzari int not null check (total\_vanzari > 0),
 nume varchar(100) not null,
 prenume varchar(100) not null,
 salariu int not null check (salariu > 0),
 data\_angajare date not null);
create table unelte (
 id\_unealta int primary key,
 nume varchar(100) not null,
 tip varchar(100) not null,
 id\_mecanic int not null,
 foreign key (id\_mecanic) references mecanici(id\_mecanic)
);

create table service (
 id\_service int primary key,
 vin varchar(20) not null,
 data\_programare date not null,
 status varchar(20) not null,
 id\_mecanic int not null,
 foreign key (vin) references masina(vin),
 foreign key (id\_mecanic) references mecanici(id\_mecanic)
);

create table marketing (
 id\_campanie int primary key,
 buget int not null check (buget > 0),
 vin varchar(20) not null,
 nume varchar(100) not null,
 prenume varchar(100) not null,
 salariu int not null check (salariu > 0),
 data\_angajare date not null);

create table piese (
 id\_piesa int primary key,
 denumire varchar(200) not null,
 pret int not null check (pret > 0),
 stoc int not null check (stoc >= 0)
);

create table test\_drive (
 id\_testdrive int primary key,
 id\_client int not null,
 id\_dealer int not null,
 data date not null,
 durata int not null check (durata > 0),
 vin varchar(20) not null,
 foreign key (id\_client) references client(id\_client),
 foreign key (id\_dealer) references dealeri(id\_dealer),
 foreign key (vin) references masina(vin)
);

create table programari\_service (
 id\_programare int primary key,
 vin varchar(20) not null,
 id\_service int not null,
 data\_programare date not null,
 observatii varchar(255),
 foreign key (vin) references masina(vin),
 foreign key (id\_service) references service(id\_service)
);

create table promovare (
 id\_promovare int primary key,
 vin varchar(20) not null,
 perioada varchar(100) not null,
 id\_campanie int not null,
 foreign key (vin) references masina(vin),
 foreign key (id\_campanie) references marketing(id\_campanie)
);

create table utilizare\_unelte (
 id\_utilizare int primary key,
 id\_unealta int not null,
 id\_mecanic int not null,
 data\_inceput date not null,
 data\_sfarsit date not null,
 foreign key (id\_unealta) references unelte(id\_unealta),
 foreign key (id\_mecanic) references mecanici(id\_mecanic)
);

















2) Inserarea datelor:
Masina:
insert into masina (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('1HGCM82633A123456', 'X1', 2025, 'Negru', 'Benzina', 25000, 'Noua', 'Fata');

insert into masina (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('1HGBH41JXMN109186', 'X3', 2025, 'Alb', 'Diesel', 22000, 'Noua', 'Spate');

insert into masina (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('2T1BURHE5JC005163', 'M5', 2025, 'Albastru', 'Hibrid', 27000, 'Noua', 'Integral');

insert into masina (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('1FADP3F29JL100001', '340i', 2025, 'Argintiu', 'Benzina', 50000, 'Noua', 'Fata');

insert into masina (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('1FTFW1ET3EFB12345', 'I7', 2025, 'Rosu', 'Diesel', 33000, 'Noua', 'Spate');

insert into masina (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('3HGGK5G67GM123456', 'M4', 2025, 'Verde', 'Benzina', 24000, 'Noua', 'Fata');

insert into masina (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('4T1BF1FK5HU123456', 'M6', 2025, 'Negru', 'Hibrid', 28000, 'Noua', 'Spate');

insert into masina (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('5TDBY5G14LS123456', 'X6', 2025, 'Gri', 'Diesel', 38000, 'Noua', 'Integral');

insert into masina (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('6FMPJ2A93LB123456', 'X1', 2025, 'Alb', 'Benzina', 29000, 'Noua', 'Fata');

insert into masina (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values ('7A1KH4G68KA123456', 'XM', 2025, 'Albastru', 'Hibrid', 35000, 'Noua', 'Spate');

Garantie:
insert into garantie (id\_garantie, vin, durata, data\_inceput)
values (seq\_garantie.nextval, '1HGCM82633A123456', 24, TO\_DATE('2025-01-01', 'YYYY-MM-DD'));

insert into garantie (id\_garantie, vin, durata, data\_inceput)
values (seq\_garantie.nextval, '1HGBH41JXMN109186', 36, TO\_DATE('2025-02-01', 'YYYY-MM-DD'));

insert into garantie (id\_garantie, vin, durata, data\_inceput)
values (seq\_garantie.nextval, '2T1BURHE5JC005163', 12, TO\_DATE('2025-03-01', 'YYYY-MM-DD'));

insert into garantie (id\_garantie, vin, durata, data\_inceput)
values (seq\_garantie.nextval, '1FADP3F29JL100001', 24, TO\_DATE('2025-04-01', 'YYYY-MM-DD'));

insert into garantie (id\_garantie, vin, durata, data\_inceput)
values (seq\_garantie.nextval, '1FTFW1ET3EFB12345', 36, TO\_DATE('2025-05-01', 'YYYY-MM-DD'));

insert into garantie (id\_garantie, vin, durata, data\_inceput)
values (seq\_garantie.nextval, '3HGGK5G67GM123456', 24, TO\_DATE('2025-06-01', 'YYYY-MM-DD'));

insert into garantie (id\_garantie, vin, durata, data\_inceput)
values (seq\_garantie.nextval, '4T1BF1FK5HU123456', 12, TO\_DATE('2025-07-01', 'YYYY-MM-DD'));

insert into garantie (id\_garantie, vin, durata, data\_inceput)
values (seq\_garantie.nextval, '5TDBY5G14LS123456', 36, TO\_DATE('2025-08-01', 'YYYY-MM-DD'));

insert into garantie (id\_garantie, vin, durata, data\_inceput)
values (seq\_garantie.nextval, '6FMPJ2A93LB123456', 24, TO\_DATE('2025-09-01', 'YYYY-MM-DD'));

insert into garantie (id\_garantie, vin, durata, data\_inceput)
values (seq\_garantie.nextval, '7A1KH4G68KA123456', 12, TO\_DATE('2025-10-01', 'YYYY-MM-DD'));


Mecanici:
insert into mecanici (id\_mecanic, specializare, nume, prenume, salariu, data\_angajare)
values (seq\_mecanic.nextval, 'Motor', 'Popescu', 'Andrei', 4500, TO\_DATE('2020-03-15', 'YYYY-MM-DD'));

insert into mecanici (id\_mecanic, specializare, nume, prenume, salariu, data\_angajare)
values (seq\_mecanic.nextval, 'Transmisie', 'Ionescu', 'Cristian', 4600, TO\_DATE('2019-06-10', 'YYYY-MM-DD'));

insert into mecanici (id\_mecanic, specializare, nume, prenume, salariu, data\_angajare)
values (seq\_mecanic.nextval, 'Suspensie', 'Georgescu', 'Mihai', 4300, TO\_DATE('2021-01-20', 'YYYY-MM-DD'));

insert into mecanici (id\_mecanic, specializare, nume, prenume, salariu, data\_angajare)
values (seq\_mecanic.nextval, 'Frane', 'Dumitru', 'Sorin', 4200, TO\_DATE('2018-09-05', 'YYYY-MM-DD'));

insert into mecanici (id\_mecanic, specializare, nume, prenume, salariu, data\_angajare)
values (seq\_mecanic.nextval, 'Sisteme electrice', 'Stan', 'Gabriel', 4700, TO\_DATE('2022-04-12', 'YYYY-MM-DD'));

insert into mecanici (id\_mecanic, specializare, nume, prenume, salariu, data\_angajare)
values (seq\_mecanic.nextval, 'Caroserie', 'Barbu', 'Lucian', 4400, TO\_DATE('2017-11-30', 'YYYY-MM-DD'));

insert into mecanici (id\_mecanic, specializare, nume, prenume, salariu, data\_angajare)
values (seq\_mecanic.nextval, 'Motor', 'Marin', 'Florin', 4550, TO\_DATE('2023-02-17', 'YYYY-MM-DD'));

insert into mecanici (id\_mecanic, specializare, nume, prenume, salariu, data\_angajare)
values (seq\_mecanic.nextval, 'Sisteme electrice', 'Radu', 'Ionut', 4600, TO\_DATE('2020-07-22', 'YYYY-MM-DD'));

insert into mecanici (id\_mecanic, specializare, nume, prenume, salariu, data\_angajare)
values (seq\_mecanic.nextval, 'Transmisie', 'Voicu', 'Stefan', 4650, TO\_DATE('2021-10-03', 'YYYY-MM-DD'));

insert into mecanici (id\_mecanic, specializare, nume, prenume, salariu, data\_angajare)
values (seq\_mecanic.nextval, 'Frane', 'Neagu', 'Valentin', 4500, TO\_DATE('2019-12-01', 'YYYY-MM-DD'));


Dealeri:
insert into dealeri (id\_dealer, total\_vanzari, nume, prenume, salariu, data\_angajare)
values (seq\_dealer.nextval, 600000, 'Ionescu', 'Mircea', 6000, TO\_DATE('2018-01-22', 'YYYY-MM-DD'));

insert into dealeri (id\_dealer, total\_vanzari, nume, prenume, salariu, data\_angajare)
values (seq\_dealer.nextval, 600000, 'Enache', 'Andrei', 5200, TO\_DATE('2020-05-12', 'YYYY-MM-DD'));

insert into dealeri (id\_dealer, total\_vanzari, nume, prenume, salariu, data\_angajare)
values (seq\_dealer.nextval, 450000, 'Stoica', 'Cristina', 5000, TO\_DATE('2019-08-19', 'YYYY-MM-DD'));

insert into dealeri (id\_dealer, total\_vanzari, nume, prenume, salariu, data\_angajare)
values (seq\_dealer.nextval, 700000, 'Dragomir', 'Alexandru', 5500, TO\_DATE('2018-03-25', 'YYYY-MM-DD'));

insert into dealeri (id\_dealer, total\_vanzari, nume, prenume, salariu, data\_angajare)
values (seq\_dealer.nextval, 750000, 'Neacsu', 'Elena', 5600, TO\_DATE('2017-10-07', 'YYYY-MM-DD'));

insert into dealeri (id\_dealer, total\_vanzari, nume, prenume, salariu, data\_angajare)
values (seq\_dealer.nextval, 300000, 'Tudor', 'Rares', 4800, TO\_DATE('2021-06-11', 'YYYY-MM-DD'));

insert into dealeri (id\_dealer, total\_vanzari, nume, prenume, salariu, data\_angajare)
values (seq\_dealer.nextval, 650000, 'Vlad', 'Irina', 5300, TO\_DATE('2019-01-04', 'YYYY-MM-DD'));

insert into dealeri (id\_dealer, total\_vanzari, nume, prenume, salariu, data\_angajare)
values (seq\_dealer.nextval, 550000, 'Munteanu', 'Daniel', 5100, TO\_DATE('2022-02-14', 'YYYY-MM-DD'));

insert into dealeri (id\_dealer, total\_vanzari, nume, prenume, salariu, data\_angajare)
values (seq\_dealer.nextval, 800000, 'Sandu', 'Ioana', 5700, TO\_DATE('2016-12-21', 'YYYY-MM-DD'));

insert into dealeri (id\_dealer, total\_vanzari, nume, prenume, salariu, data\_angajare)
values (seq\_dealer.nextval, 450000, 'Petrescu', 'George', 5000, TO\_DATE('2023-04-03', 'YYYY-MM-DD'));


Marketing:
insert into marketing (id\_campanie, buget, vin, nume, prenume, salariu, data\_angajare)
values (seq\_campanie.nextval, 100000, '1HGCM82633A123456', 'Lazar', 'Andreea', 4800, TO\_DATE('2021-01-15', 'YYYY-MM-DD'));

insert into marketing (id\_campanie, buget, vin, nume, prenume, salariu, data\_angajare)
values (seq\_campanie.nextval, 150000, '1HGBH41JXMN109186', 'Iliescu', 'Bogdan', 5000, TO\_DATE('2019-07-30', 'YYYY-MM-DD'));

insert into marketing (id\_campanie, buget, vin, nume, prenume, salariu, data\_angajare)
values (seq\_campanie.nextval, 120000, '2T1BURHE5JC005163', 'Moldovan', 'Diana', 4900, TO\_DATE('2020-10-12', 'YYYY-MM-DD'));

insert into marketing (id\_campanie, buget, vin, nume, prenume, salariu, data\_angajare)
values (seq\_campanie.nextval, 130000, '1FADP3F29JL100001', 'Rusu', 'Ionut', 5050, TO\_DATE('2018-03-25', 'YYYY-MM-DD'));

insert into marketing (id\_campanie, buget, vin, nume, prenume, salariu, data\_angajare)
values (seq\_campanie.nextval, 140000, '1FTFW1ET3EFB12345', 'Matei', 'Corina', 5100, TO\_DATE('2017-09-08', 'YYYY-MM-DD'));

insert into marketing (id\_campanie, buget, vin, nume, prenume, salariu, data\_angajare)
values (seq\_campanie.nextval, 110000, '1HGCM82633A123456', 'Dobre', 'Roxana', 4700, TO\_DATE('2022-04-20', 'YYYY-MM-DD'));

insert into marketing (id\_campanie, buget, vin, nume, prenume, salariu, data\_angajare)
values (seq\_campanie.nextval, 125000, '1HGBH41JXMN109186', 'Avram', 'Stefan', 4950, TO\_DATE('2020-06-03', 'YYYY-MM-DD'));

insert into marketing (id\_campanie, buget, vin, nume, prenume, salariu, data\_angajare)
values (seq\_campanie.nextval, 135000, '2T1BURHE5JC005163', 'Sandru', 'Raluca', 5100, TO\_DATE('2016-11-19', 'YYYY-MM-DD'));

insert into marketing (id\_campanie, buget, vin, nume, prenume, salariu, data\_angajare)
values (seq\_campanie.nextval, 145000, '1FADP3F29JL100001', 'Coman', 'Adrian', 5200, TO\_DATE('2019-02-10', 'YYYY-MM-DD')); 

Piese: 
insert into piese (id\_piesa, denumire, pret, stoc)
values (seq\_piesa.nextval, 'Filtru aer', 150, 50);

insert into piese (id\_piesa, denumire, pret, stoc)
values (seq\_piesa.nextval, 'Filtru ulei', 100, 60);

insert into piese (id\_piesa, denumire, pret, stoc)
values (seq\_piesa.nextval, 'Placute frana', 200, 40);

insert into piese (id\_piesa, denumire, pret, stoc)
values (seq\_piesa.nextval, 'Discuri frana', 300, 30);

insert into piese (id\_piesa, denumire, pret, stoc)
values (seq\_piesa.nextval, 'Amortizoare', 500, 20);

insert into piese (id\_piesa, denumire, pret, stoc)
values (seq\_piesa.nextval, 'Bucse suspensie', 80, 100);

insert into piese (id\_piesa, denumire, pret, stoc)
values (seq\_piesa.nextval, 'Lumina far', 120, 70);

insert into piese (id\_piesa, denumire, pret, stoc)
values (seq\_piesa.nextval, 'Baterie auto', 400, 25);

insert into piese (id\_piesa, denumire, pret, stoc)
values (seq\_piesa.nextval, 'Placute ambreiaj', 250, 35);

insert into piese (id\_piesa, denumire, pret, stoc)
values (seq\_piesa.nextval, 'Trecere filtru polen', 60, 90);


Unelte:
insert into unelte (id\_unealta, nume, tip, id\_mecanic)
values (seq\_unealta.nextval, 'Chei fixe', 'Mecanic', 1);

insert into unelte (id\_unealta, nume, tip, id\_mecanic)
values (seq\_unealta.nextval, 'Elevator auto', 'Mecanic', 2);

insert into unelte (id\_unealta, nume, tip, id\_mecanic)
values (seq\_unealta.nextval, 'Dulgherie', 'Caroserie', 3);

insert into unelte (id\_unealta, nume, tip, id\_mecanic)
values (seq\_unealta.nextval, 'Strung', 'Suspensie', 4);

insert into unelte (id\_unealta, nume, tip, id\_mecanic)
values (seq\_unealta.nextval, 'Chei reglabile', 'Mecanic', 5);

insert into unelte (id\_unealta, nume, tip, id\_mecanic)
values (seq\_unealta.nextval, 'Polizor', 'Caroserie', 6);

insert into unelte (id\_unealta, nume, tip, id\_mecanic)
values (seq\_unealta.nextval, 'Masina de sudura', 'Motor', 7);

insert into unelte (id\_unealta, nume, tip, id\_mecanic)
values (seq\_unealta.nextval, 'Compresor', 'Roti', 8);

insert into unelte (id\_unealta, nume, tip, id\_mecanic)
values (seq\_unealta.nextval, 'Pistol de vopsit', 'Caroserie', 9);

insert into unelte (id\_unealta, nume, tip, id\_mecanic)
values (seq\_unealta.nextval, 'Pompa de aer', 'Suspensie', 10);


Service:
insert into service (id\_service, vin, data\_programare, status, id\_mecanic)
values (seq\_service.nextval, '1HGCM82633A123456', to\_date('2025-01-10', 'yyyy-mm-dd'), 'in desfasurare', 1);

insert into service (id\_service, vin, data\_programare, status, id\_mecanic)
values (seq\_service.nextval, '1HGBH41JXMN109186', to\_date('2025-02-10', 'yyyy-mm-dd'), 'finalizat', 2);

insert into service (id\_service, vin, data\_programare, status, id\_mecanic)
values (seq\_service.nextval, '2T1BURHE5JC005163', to\_date('2025-03-15', 'yyyy-mm-dd'), 'in desfasurare', 3);

insert into service (id\_service, vin, data\_programare, status, id\_mecanic)
values (seq\_service.nextval, '1FADP3F29JL100001', to\_date('2025-04-05', 'yyyy-mm-dd'), 'in desfasurare', 4);

insert into service (id\_service, vin, data\_programare, status, id\_mecanic)
values (seq\_service.nextval, '1FTFW1ET3EFB12345', to\_date('2025-05-18', 'yyyy-mm-dd'), 'finalizat', 5);

insert into service (id\_service, vin, data\_programare, status, id\_mecanic)
values (seq\_service.nextval, '3HGGK5G67GM123456', to\_date('2025-06-20', 'yyyy-mm-dd'), 'in desfasurare', 6);

insert into service (id\_service, vin, data\_programare, status, id\_mecanic)
values (seq\_service.nextval, '4T1BF1FK5HU123456', to\_date('2025-07-10', 'yyyy-mm-dd'), 'finalizat', 7);

insert into service (id\_service, vin, data\_programare, status, id\_mecanic)
values (seq\_service.nextval, '5TDBY5G14LS123456', to\_date('2025-08-12', 'yyyy-mm-dd'), 'in desfasurare', 8);

insert into service (id\_service, vin, data\_programare, status, id\_mecanic)
values (seq\_service.nextval, '6FMPJ2A93LB123456', to\_date('2025-09-15', 'yyyy-mm-dd'), 'finalizat', 9);

insert into service (id\_service, vin, data\_programare, status, id\_mecanic)
values (seq\_service.nextval, '7A1KH4G68KA123456', to\_date('2025-10-18', 'yyyy-mm-dd'), 'in desfasurare', 10);




Client:
insert into client (id\_client, nume, prenume, telefon, adresa)
values (seq\_client.nextval, 'Ion', 'Popescu', '0712345678', 'Strada Principala, nr. 10');

insert into client (id\_client, nume, prenume, telefon, adresa)
values (seq\_client.nextval, 'Maria', 'Ionescu', '0723456789', 'Strada Revolutiei, nr. 15');

insert into client (id\_client, nume, prenume, telefon, adresa)
values (seq\_client.nextval, 'Vasile', 'Georgescu', '0734567890', 'Strada Litoralului, nr. 8');

insert into client (id\_client, nume, prenume, telefon, adresa)
values (seq\_client.nextval, 'Elena', 'Radu', '0745678901', 'Strada Marii, nr. 25');

insert into client (id\_client, nume, prenume, telefon, adresa)
values (seq\_client.nextval, 'Andrei', 'Mihaila', '0756789012', 'Strada Serii, nr. 32');

insert into client (id\_client, nume, prenume, telefon, adresa)
values (seq\_client.nextval, 'Gabriela', 'Popa', '0767890123', 'Strada Unirii, nr. 5');

insert into client (id\_client, nume, prenume, telefon, adresa)
values (seq\_client.nextval, 'Adrian', 'Munteanu', '0778901234', 'Strada Salcâmilor, nr. 14');

insert into client (id\_client, nume, prenume, telefon, adresa)
values (seq\_client.nextval, 'Daniela', 'Ionescu', '0789012345', 'Strada Florilor, nr. 18');

insert into client (id\_client, nume, prenume, telefon, adresa)
values (seq\_client.nextval, 'Mihai', 'Luca', '0790123456', 'Strada Pietrei, nr. 22');

insert into client (id\_client, nume, prenume, telefon, adresa)
values (seq\_client.nextval, 'Larisa', 'Tudor', '0801234567', 'Strada Motilor, nr. 10');



Vanzare:
insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '1HGBH41JXMN109186', '2025-02-01 to 2025-04-30', 2);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '2T1BURHE5JC005163', '2025-03-01 to 2025-05-31', 3);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '1FADP3F29JL100001', '2025-04-01 to 2025-06-30', 4);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '1FTFW1ET3EFB12345', '2025-05-01 to 2025-07-31', 5);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '3HGGK5G67GM123456', '2025-06-01 to 2025-08-31', 6);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '4T1BF1FK5HU123456', '2025-07-01 to 2025-09-30', 7);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '5TDBY5G14LS123456', '2025-08-01 to 2025-10-31', 8);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '6FMPJ2A93LB123456', '2025-09-01 to 2025-11-30', 9);



Test drive:
insert into test\_drive (id\_testdrive, id\_client, id\_dealer, data, durata, vin)
values (seq\_testdrive.nextval, 1, 1, to\_date('2025-01-15', 'yyyy-mm-dd'), 30, '1HGCM82633A123456');

insert into test\_drive (id\_testdrive, id\_client, id\_dealer, data, durata, vin)
values (seq\_testdrive.nextval, 2, 2, to\_date('2025-02-20', 'yyyy-mm-dd'), 45, '1HGBH41JXMN109186');

insert into test\_drive (id\_testdrive, id\_client, id\_dealer, data, durata, vin)
values (seq\_testdrive.nextval, 3, 3, to\_date('2025-03-10', 'yyyy-mm-dd'), 20, '2T1BURHE5JC005163');

insert into test\_drive (id\_testdrive, id\_client, id\_dealer, data, durata, vin)
values (seq\_testdrive.nextval, 4, 4, to\_date('2025-04-05', 'yyyy-mm-dd'), 40, '1FADP3F29JL100001');

insert into test\_drive (id\_testdrive, id\_client, id\_dealer, data, durata, vin)
values (seq\_testdrive.nextval, 5, 5, to\_date('2025-05-18', 'yyyy-mm-dd'), 35, '1FTFW1ET3EFB12345');

insert into test\_drive (id\_testdrive, id\_client, id\_dealer, data, durata, vin)
values (seq\_testdrive.nextval, 6, 6, to\_date('2025-06-20', 'yyyy-mm-dd'), 50, '3HGGK5G67GM123456');

insert into test\_drive (id\_testdrive, id\_client, id\_dealer, data, durata, vin)
values (seq\_testdrive.nextval, 7, 7, to\_date('2025-07-10', 'yyyy-mm-dd'), 25, '4T1BF1FK5HU123456');

insert into test\_drive (id\_testdrive, id\_client, id\_dealer, data, durata, vin)
values (seq\_testdrive.nextval, 8, 8, to\_date('2025-08-12', 'yyyy-mm-dd'), 60, '5TDBY5G14LS123456');

insert into test\_drive (id\_testdrive, id\_client, id\_dealer, data, durata, vin)
values (seq\_testdrive.nextval, 9, 9, to\_date('2025-09-15', 'yyyy-mm-dd'), 30, '6FMPJ2A93LB123456');

insert into test\_drive (id\_testdrive, id\_client, id\_dealer, data, durata, vin)
values (seq\_testdrive.nextval, 10, 10, to\_date('2025-10-18', 'yyyy-mm-dd'), 40, '7A1KH4G68KA123456');



Utilizare unelte:
insert into utilizare\_unelte (id\_utilizare, id\_unealta, id\_mecanic, data\_inceput, data\_sfarsit)
values (seq\_utilizare\_unealta.nextval, 1, 1, to\_date('2025-01-10', 'yyyy-mm-dd'), to\_date('2025-01-15', 'yyyy-mm-dd'));

insert into utilizare\_unelte (id\_utilizare, id\_unealta, id\_mecanic, data\_inceput, data\_sfarsit)
values (seq\_utilizare\_unealta.nextval, 2, 2, to\_date('2025-02-20', 'yyyy-mm-dd'), to\_date('2025-02-25', 'yyyy-mm-dd'));

insert into utilizare\_unelte (id\_utilizare, id\_unealta, id\_mecanic, data\_inceput, data\_sfarsit)
values (seq\_utilizare\_unealta.nextval, 3, 3, to\_date('2025-03-05', 'yyyy-mm-dd'), to\_date('2025-03-07', 'yyyy-mm-dd'));

insert into utilizare\_unelte (id\_utilizare, id\_unealta, id\_mecanic, data\_inceput, data\_sfarsit)
values (seq\_utilizare\_unealta.nextval, 4, 4, to\_date('2025-04-10', 'yyyy-mm-dd'), to\_date('2025-04-12', 'yyyy-mm-dd'));

insert into utilizare\_unelte (id\_utilizare, id\_unealta, id\_mecanic, data\_inceput, data\_sfarsit)
values (seq\_utilizare\_unealta.nextval, 5, 5, to\_date('2025-05-15', 'yyyy-mm-dd'), to\_date('2025-05-18', 'yyyy-mm-dd'));

insert into utilizare\_unelte (id\_utilizare, id\_unealta, id\_mecanic, data\_inceput, data\_sfarsit)
values (seq\_utilizare\_unealta.nextval, 6, 6, to\_date('2025-06-20', 'yyyy-mm-dd'), to\_date('2025-06-22', 'yyyy-mm-dd'));

insert into utilizare\_unelte (id\_utilizare, id\_unealta, id\_mecanic, data\_inceput, data\_sfarsit)
values (seq\_utilizare\_unealta.nextval, 7, 7, to\_date('2025-07-10', 'yyyy-mm-dd'), to\_date('2025-07-15', 'yyyy-mm-dd'));

insert into utilizare\_unelte (id\_utilizare, id\_unealta, id\_mecanic, data\_inceput, data\_sfarsit)
values (seq\_utilizare\_unealta.nextval, 8, 8, to\_date('2025-08-12', 'yyyy-mm-dd'), to\_date('2025-08-16', 'yyyy-mm-dd'));

insert into utilizare\_unelte (id\_utilizare, id\_unealta, id\_mecanic, data\_inceput, data\_sfarsit)
values (seq\_utilizare\_unealta.nextval, 9, 9, to\_date('2025-09-05', 'yyyy-mm-dd'), to\_date('2025-09-07', 'yyyy-mm-dd'));

insert into utilizare\_unelte (id\_utilizare, id\_unealta, id\_mecanic, data\_inceput, data\_sfarsit)
values (seq\_utilizare\_unealta.nextval, 10, 10, to\_date('2025-10-10', 'yyyy-mm-dd'), to\_date('2025-10-12', 'yyyy-mm-dd'));


Promovare:
insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '1HGCM82633A123456', '2025-01-01 to 2025-03-31', 1);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '1HGBH41JXMN109186', '2025-02-01 to 2025-04-30', 2);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '2T1BURHE5JC005163', '2025-03-01 to 2025-05-31', 3);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '1FADP3F29JL100001', '2025-04-01 to 2025-06-30', 4);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '1FTFW1ET3EFB12345', '2025-05-01 to 2025-07-31', 5);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '3HGGK5G67GM123456', '2025-06-01 to 2025-08-31', 6);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '4T1BF1FK5HU123456', '2025-07-01 to 2025-09-30', 7);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '5TDBY5G14LS123456', '2025-08-01 to 2025-10-31', 8);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '6FMPJ2A93LB123456', '2025-09-01 to 2025-11-30', 9);

insert into promovare (id\_promovare, vin, perioada, id\_campanie)
values (seq\_promovare.nextval, '7A1KH4G68KA123456', '2025-10-01 to 2025-12-31', 10);



Programari service:
insert into programari\_service (id\_programare, vin, id\_service, data\_programare, observatii)
values (seq\_programare.nextval, '1HGCM82633A123456', 1, to\_date('2025-01-10', 'yyyy-mm-dd'), 'Schimb ulei');

insert into programari\_service (id\_programare, vin, id\_service, data\_programare, observatii)
values (seq\_programare.nextval, '1HGBH41JXMN109186', 2, to\_date('2025-02-20', 'yyyy-mm-dd'), 'Revizie tehnica');

insert into programari\_service (id\_programare, vin, id\_service, data\_programare, observatii)
values (seq\_programare.nextval, '2T1BURHE5JC005163', 3, to\_date('2025-03-05', 'yyyy-mm-dd'), 'Schimb discuri si placute de frana');

insert into programari\_service (id\_programare, vin, id\_service, data\_programare, observatii)
values (seq\_programare.nextval, '1FADP3F29JL100001', 4, to\_date('2025-04-10', 'yyyy-mm-dd'), 'Intretinere sistem de climatizare');

insert into programari\_service (id\_programare, vin, id\_service, data\_programare, observatii)
values (seq\_programare.nextval, '1FTFW1ET3EFB12345', 5, to\_date('2025-05-15', 'yyyy-mm-dd'), 'Verificare motor');

insert into programari\_service (id\_programare, vin, id\_service, data\_programare, observatii)
values (seq\_programare.nextval, '3HGGK5G67GM123456', 6, to\_date('2025-06-01', 'yyyy-mm-dd'), 'Reparare sistem de directie');

insert into programari\_service (id\_programare, vin, id\_service, data\_programare, observatii)
values (seq\_programare.nextval, '4T1BF1FK5HU123456', 7, to\_date('2025-06-25', 'yyyy-mm-dd'), 'Inlocuire baterie');

insert into programari\_service (id\_programare, vin, id\_service, data\_programare, observatii)
values (seq\_programare.nextval, '5TDBY5G14LS123456', 8, to\_date('2025-07-10', 'yyyy-mm-dd'), 'Verificare frane si suspensie');

insert into programari\_service (id\_programare, vin, id\_service, data\_programare, observatii)
values (seq\_programare.nextval, '6FMPJ2A93LB123456', 9, to\_date('2025-08-12', 'yyyy-mm-dd'), 'Schimb ulei si filtre');

insert into programari\_service (id\_programare, vin, id\_service, data\_programare, observatii)
values (seq\_programare.nextval, '7A1KH4G68KA123456', 10, to\_date('2025-09-18', 'yyyy-mm-dd'), 'Intretinere generala');



















12. Formulați în limbaj natural și implementați 5 cereri SQL complexe ce vor utiliza, în ansamblul lor, următoarele elemente:

a) subcereri sincronizate în care intervin cel puțin 3 tabele
Pentru fiecare client care are o garantie activa (neexpirata) la o masina cumparata, returnam numele si prenumele clientului și cate masini a cumparat cu un pret final mai mare decat pretul mediu al tuturor vanzarilor.
select 
 c.nume,
 c.prenume,
 (
 select count(*)
 from vanzare v
 where v.id\_client = c.id\_client
 and v.pret\_final > (
 select avg(pret\_final) from vanzare
 )
 ) as masini\_scumpe\_cumparate
from client c
where exists (
 select 1
 from vanzare v2
 join garantie g on v2.vin = g.vin
 where v2.id\_client = c.id\_client
 and add\_months(g.data\_inceput, g.durata) > sysdate
);


b) subcereri nesincronizate în clauza FROM
Afisam pentru fiecare client care a cumparat o masina, numele, prenumele si numarul total de masini hibride cumparate.
select c.nume, c.prenume, m\_total.nr\_hibrid
from client c
join (
 select v.id\_client, count(*) as nr\_hibrid
 from vanzare v
 join masina m on v.vin = m.vin
 where lower(m.motorizare) = 'hibrid'
 group by v.id\_client
) m\_total on c.id\_client = m\_total.id\_client;


c) grupări de date, funcții grup, filtrare la nivel de grupuri cu subcereri nesincronizate
(în clauza de HAVING) în care intervin cel puțin 3 tabele (in cadrul aceleiași cereri)
 Afisam specializarile mecanicilor care au lucrat la cel putin o masina si care au un salariu mediu mai mare decat salariul mediu al tuturor mecanicilor.

select m.specializare,
 count(distinct s.vin) as nr\_masini,
 avg(m.salariu) as salariu\_mediu
from mecanici m
join service s on m.id\_mecanic = s.id\_mecanic
join masina ma on s.vin = ma.vin
group by m.specializare
having avg(m.salariu) > (
 select avg(salariu) from mecanici
); 
d) ordonări și utilizarea funcțiilor NVL și DECODE (în cadrul aceleiași cereri)

Afisam serviciile realizate, mecanicul care le-a efectuat, statusul (recent sau vechi), si un discount aplicat in functie de specializare. Daca specializarea este 'Frane', se aplica un discount de 10% din salariul mecanicului. Rezultatul va fi ordonat descrescator dupa discount.

select s.id\_service,
 me.nume || ' ' || me.prenume as mecanic,
 case 
 when s.data\_programare >= sysdate - 30 then 'Recent'
 else 'Vechi'
 end as status,
 nvl(decode(me.specializare, 'Frane', me.salariu * 0.1, null), 0) as discount\_frane
from service s
join mecanici me on s.id\_mecanic = me.id\_mecanic
order by discount\_frane desc;


e) utilizarea a cel puțin 2 funcții pe șiruri de caractere, 2 funcții pe date calendaristice,
a cel puțin unei expresii CASE
f) utilizarea a cel puțin 1 bloc de cerere (clauza WITH)

Afisati pentru primii 3 mecanici care au lucrat la cele mai multe masini numele complet formatat, lungimea numelui, numarul de masini, data si anul ultimei interventii si statusul recenta/vechi, folosind functii pe siruri, functii pe date, expresie CASE si clauza WITH.

with top\_mecanici as (
 select s.id\_mecanic,
 count(distinct s.vin) as nr\_masini,
 max(s.data\_programare) as ultima\_interventie
 from service s
 group by s.id\_mecanic
 order by nr\_masini desc
 fetch first 3 rows only
)
select 
 me.id\_mecanic,
 upper(me.nume) || ' ' || initcap(me.prenume) as mecanic\_formatat,
 length(me.nume) + length(me.prenume) as lungime\_nume,
 top\_mecanici.nr\_masini,
 top\_mecanici.ultima\_interventie,
 extract(year from top\_mecanici.ultima\_interventie) as an\_interventie,
 case
 when months\_between(sysdate, top\_mecanici.ultima\_interventie) < 1 then 'Recent'
 else 'Mai vechi'
 end as status\_interventie
from top\_mecanici
join mecanici me on me.id\_mecanic = top\_mecanici.id\_mecanic;





13. Implementarea a 3 operații de actualizare și de suprimare a datelor utilizând subcereri.
Operatia 1:
update masina m
set m.pret = m.pret * 1.10
where m.vin in (
 select v.vin
 from vanzare v
 join dealeri d on v.id\_dealer = d.id\_dealer
 where mod(d.id\_dealer, 2) = 1
);


Operatia 2:
update masina m
set m.stare = 'Second-hand'
where m.vin in (
 select v.vin
 from vanzare v
 join dealeri d on v.id\_dealer = d.id\_dealer
 where months\_between(sysdate, v.data\_vanzare) > 1
);


Operatia 3:
update masina m
set m.stare = 'Second-hand'
where m.vin in (
 select v.vin
 from vanzare v
 join dealeri d on v.id\_dealer = d.id\_dealer
 where months\_between(sysdate, v.data\_vanzare) > 1
);





















14. Crearea unei vizualizări complexe. Dați un exemplu de operație LMD permisă pe
vizualizarea respectivă și un exemplu de operație LMD nepermisă.

Vizualizare – detalii\_vanzari (contine informatii despre client, vanzare si masina)
create view detalii\_vanzari as
select 
 c.id\_client,
 c.nume || ' ' || c.prenume as nume\_client,
 v.id\_tranzactie,
 m.model,
 v.pret\_final
from 
 client c
join 
 vanzare v on c.id\_client = v.id\_client
join 
 masina m on v.vin = m.vin;


Daca incercam operatiile INSERT, DELETE, UPDATE vom primi eroarea aceasta:

O operatie LMD permisa este SELECT. Deoarece tabelul contine join-uri si nu pot fi folosite expresiile INSERT, DELETE, UPDATE. Pentru a remedia problema trebuie ca in viewing-ul nostru sa nu apara:
Join-uri intre mai multe tabele
Subquery-uri in clauza SELECT
DISTINCT
Functii agregate (SUM, COUNT, AVG)
GROUP BY sau HAVING
Operatii de set (UNION, INTERSECT, EXCEPT)
Coloane derivate din expresii sau functii (FLOOR, CONCAT)
Nu au o mapare directa la coloanele subiacente (de sub ele) (adica coloanele calculate sau concatenate)

Vizualizare –masina\_view (contine informatii doar despre masina) – mai jos sunt illustrate operatiile care nu au mers la detalii\_vanzari:
create view masina\_view as
select 
 vin, 
 model, 
 an\_fabricatie, 
 culoare, 
 motorizare, 
 pret, 
 stare, 
 tractiune
from masina;
.



INSERARE
insert into masina\_view (vin, model, an\_fabricatie, culoare, motorizare, pret, stare, tractiune)
values (123456, 'X4', 2022, 'Albastru', 'Benzina', 15000, 'Noua', 'Fata');



UPDATARE
update masina\_view
set model = 'X4', 
 an\_fabricatie = 2023, 
 culoare = 'Albastru', 
 motorizare = 'Benzina', 
 pret = 25000, 
 stare = 'Noua', 
 tractiune = 'Integrala'
where vin = '123456';




STERGERE
delete from masina\_view
where vin = '123456';

select * from masina\_view where vin = '123456';


