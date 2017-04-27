program TiketKereta;
    const 
    nMax = 100;
    
    type Tiket = record
    idTiket : integer;
    nama : string;
    umur : string;
    kereta : string;
    tarif : longint;
    kelas : string;
    tujuan: string;
    jadwal : string;
    kursi : integer;
end;
type
tabelTiket = array[1..nMax] of Tiket;
    daftarKursi = array[1..nMax] of integer;
    var

tabTiket : tabelTiket; 
tabK : daftarKursi;
N,pil,cekKursi : integer;
back: char;

procedure lihatKelas();
begin
    writeln('1. Ekonomi');
    writeln('2. Bisnis');
    writeln('3. Eksekutif');
end;

procedure lihatTujuan();

begin
    writeln('1. Surabaya');
    writeln('2. Jakarta');
    writeln('3. Bandung');
end;

procedure jadwalBerangkat();

begin
    writeln('1. 07.00');
    writeln('2. 12.00');
    writeln('3. 16.00');
    writeln('4. 19.00');
end;

procedure isiTujuan(var tabP: tabelTiket;var N : integer;pil : integer);

begin
    if (pil=1) then
    begin
        tabP[N].tujuan:='Surabaya';
        tabP[N].kereta:='Argo Parahyangan';
    end    
else if (pil=2) then
    begin
        tabP[N].tujuan:='Jakarta';
        tabP[N].kereta:='Krakatau';
    end
else if (pil=3) then
    begin
        tabP[N].tujuan:='Bandung';
        tabP[N].kereta:='Bandung Express';
    end
end;

procedure isiJadwal(var tabP: tabelTiket;var N : integer;pil : integer);

begin
    if (pil=1) then
        tabP[N].jadwal:='07.00'
else if (pil=2) then
        tabP[N].jadwal:='12.00'
else if (pil=3) then
        tabP[N].jadwal:='16.00'
else if (pil=4) then
        tabP[N].jadwal:='19.00'
end;

procedure lihatTarif(pil : integer);

begin
    if (pil=1) then
        writeln('Rp. 30000')
else if (pil=2) then
        writeln('Rp. 40000')
else if (pil=3) then
        writeln('RP. 50000')
else
        writeln('Pilihan tidak ada');
end;

procedure inputPenumpang(var tabP : tabelTiket;var N : integer);
var
nama : string;

begin
    write('Masukkan Nama Anda: ');readln(nama);
    if (nama<>'-') then
    begin
        N := N+1;
        tabP[N].idTiket:= 1000+N;
        tabP[N].nama:= nama;
        write('Masukkan Umur Anda: ');readln(tabP[N].umur);
    end;
end;

procedure pilihKelas(var TabP : tabelTiket;var i : integer;pil:integer);
begin
    if pil=1 then
    begin
        tabP[i].kelas:='Ekonomi';
        tabP[i].tarif:=30000;
        writeln('kelas berhasil dipilih');
    end
else if pil=2 then
    begin
        tabP[i].kelas:='Bisnis';
        tabP[i].tarif:=40000;
        writeln('kelas berhasil dipilih');
    end
else if pil=3 then
    begin
        tabP[i].kelas:='Eksekutif';
        tabP[i].tarif:=50000;
        writeln('kelas berhasil dipilih');
    end;
end;

procedure cariKursi(var ketemu:boolean;cekKursi:integer;tabK:daftarKursi);
var
i,j,k : integer;
begin
    i      := 1;
    j      := nMax;
    ketemu := false;
    while (not ketemu) and (i<=j) do
    begin
        k := (i+j) div 2;
        if cekKursi=tabK[k] then
            ketemu := true
    else
            if tabK[k]>cekKursi then
            i := k+1
    else 
            j := k-1;
    end;
    
end;

procedure pilihKursi(var tabP : tabelTiket;var N : integer;cekKursi : integer);
var
ketemu : boolean;
i  : integer;
begin
    for i:=1 to nMax do
        tabK[i] := i;
    cariKursi(ketemu,cekKursi,tabK);
    if ketemu then
        writeln('Kursi sudah diisi')
else
        tabP[N].kursi := cekKursi;
    writeln('Kursi Berhasil dipilih');
    
end;


procedure tampilData(tabP : tabelTiket;N: integer);
var
i:integer;
begin
    for i:=1 to N do
    begin
        writeln(tabP[i].nama);
        writeln(tabP[i].umur);
        writeln(tabP[i].kelas);
        writeln(tabP[i].idTiket);
        writeln(tabP[i].jadwal);
        writeln(tabP[i].kursi);
        writeln(tabP[i].tarif);
        writeln(tabP[i].tujuan);
        writeln(tabP[i].kereta);
    end;
end;

procedure menu();

begin
    writeln('---------------SELAMAT DATANG DI STASIUN DAP 39 GAB 1--------------');
    writeln('|                         PILIH MENU                              |');
    writeln('| 1. Lihat Kelas ');
    writeln('| 2. Lihat Tujuan ');
    writeln('| 3. Lihat Jadwal ');
    writeln('| 4. Lihat Tarif ');
    writeln('| 5. Isi Data Penumpang ');
    writeln('| 6. Isi Jadwal');
    writeln('| 7. Pilih Tujuan ');
    writeln('| 8. Pilih Kelas ');
    writeln('| 9. Pilih Kursi ');
    writeln('| 10. Tampilkan Data Tiket');
    readln(pil);
end;    

begin
    N := 0;
    menu();
    while pil<>0 do
    begin
        case pil of
            1: 
        begin
            lihatKelas();
            writeln('kembali ke menu utama: Y/N');readln(back);
            if (back='Y') then
                menu()
        else
                exit();
        end;
        2:
        begin
            lihatTujuan();
            writeln('kembali ke menu utama: Y/N');readln(back);
            if (back='Y') then
                menu()
        else
                exit();
        end;
        3: 
        begin
            jadwalBerangkat();
            writeln('kembali ke menu utama: Y/N');readln(back);
            if (back='Y') then
                menu()
        else
                exit();
        end;
        4:
        begin
            lihatKelas();
            writeln('pilih');readln(pil);
            lihatTarif(pil);
            writeln('kembali ke menu utama: Y/N');readln(back);
            if (back='Y') then
                menu()
        else
                exit();
        end;
        5:
        begin
            inputPenumpang(tabTiket,N);
            writeln('kembali ke menu utama: Y/N');readln(back);
            if (back='Y') then
                menu()
        else
                exit();
        end;
        6:
        begin
            jadwalBerangkat();
            writeln('Pilih Jadwal');readln(pil);
            isiJadwal(tabTiket,N,pil);
            writeln('kembali ke menu utama: Y/N');readln(back);
            if (back='Y') then
                menu()
        else
                exit();
        end;
        7:
        begin
            lihatTujuan();
            writeln('Pilih Tujuan');readln(pil);
            isiTujuan(tabTiket,N,pil);
            writeln('kembali ke menu utama: Y/N');readln(back);
            if (back='Y') then
                menu()
        else
                exit();
        end;
        8: 
        begin
            lihatKelas();
            writeln('Pilih Kelas');readln(pil);
            pilihKelas(tabTiket,N,pil);
            writeln('kembali ke menu utama: Y/N');readln(back);
            if (back='Y') then
                menu()
        else
                exit();
        end;
        9: 
        begin
            writeln('Pilih Kursi yang Tersedia[1-100]');readln(cekKursi);
            pilihKursi(tabTiket,N,cekKursi);
            writeln('kembali ke menu utama: Y/N');readln(back);
            if (back='Y') then
                menu()
        else
                exit();
        end;
        10: 
        begin
            tampilData(tabTiket,N);
            writeln('kembali ke menu utama: Y/N');readln(back);
            if (back='Y') then
                menu()
        else
                exit();
        end;
    end;
end;


readln;
end.