with Ada.Text_Io;
use Ada.Text_Io;
package body Def_Palabras is

   ---------
   -- "=" --
   ---------

   function "=" (
         P,
         Q : Palabra)
     return Boolean is

      I : Integer := 1;

   begin

      if P.N /= Q.N then
         return False;
      else
         while I < P.N and P.P(I) = Q.P(I) loop
            I := I + 1;
         end loop;
         return P.P(P.N) = Q.P(Q.N);
      end if;

   end "=";

   ---------------
   -- Convertir --
   ---------------

   procedure Convertir (
         P    : in out Palabra;
         Modo :        Tmodo   := Mayusculas) is

      Min_Alfabeto : constant Integer := 1;
      Max_Alfabeto : constant Integer := 32;
      subtype Rango_Alfabeto is Integer range Min_Alfabeto..Max_Alfabeto;
      type T_Alfabeto is array (Rango_Alfabeto) of Character;
      T_Mayusculas : constant T_Alfabeto := "ABCDEFGHIJKLMN¥OPQRSTUVWXYZµÖàé";
      T_Minusculas : constant T_Alfabeto := "abcdefghijklmn¤opqrstuvwxyz ‚¡¢£";

      I : Integer := Rango_Alfabeto'First;

      procedure Tratar (
            P        : in out Palabra;
            Final,
            Original :        T_Alfabeto) is
      begin

         for J in Rango_Letras'First+1..P.N loop
            while I <= Max_Alfabeto and then P.P(J) /= Original(I) loop
               I := I + 1;
            end loop;
            if I <= Max_Alfabeto then
               P.P(J):= Final(I);
            end if;
            I := Rango_Alfabeto'First;
         end loop;
      end Tratar;



   begin
      if Modo = Mayusculas then
         Tratar(P, T_Mayusculas, T_Minusculas);
      else
         Tratar(P, T_Minusculas, T_Mayusculas);
      end if;

   end Convertir;

   ------------
   -- Copiar --
   ------------

   procedure Copiar (
         Origen  :        Palabra;
         Destino :    out Palabra) is

   begin

      Destino.N := Origen.N;
      for I in Rango_Letras'First+1..Destino.N loop
         Destino.P(I) := Origen.P(I);
      end loop;
   end Copiar;

   ---------
   -- Get --
   ---------

   procedure Get (
         P     :    out Palabra;
         Letra : in out Character) is
      I : Integer := 1;
   begin
      Put("Introduce una palabra: ");
      get(letra);
      while Letra = ' ' loop
         Get(Letra);
      end loop;
      while I < Rango_Letras'Last and (Letra /= ' ' and Letra /= '.') loop
         P.P(I) := Letra;
         Get(Letra);
         I := I + 1;
      end loop;
      if Letra /= ' ' and Letra /= '.' then
         P.P(I) := Letra;
         P.N := I;
      else
         P.N := I - 1;
      end if;
      

   end Get;

   ----------------------
   -- Longitud_Palabra --
   ----------------------

   function Longitud_Palabra (
         P : Palabra)
     return Integer is
   begin
      return p.n;
   end Longitud_Palabra;

   -------------------
   -- Palabra_Vacia --
   -------------------

   function Palabra_Vacia (
         P : Palabra)
     return Boolean is
   begin
      return P.N = rango_letras'first;
   end Palabra_Vacia;

   ---------
   -- Put --
   ---------

   procedure Put (
         P : Palabra) is
   begin

      for I in Rango_Letras'First+1..P.N loop
         Put(P.P(I));
      end loop;
   end Put;

end Def_Palabras;