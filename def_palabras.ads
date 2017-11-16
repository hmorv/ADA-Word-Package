package Def_Palabras is
   type Palabra is private;

   --Procedimiento para almacenar una palabra.
   procedure Get (
         P     :    out Palabra;
         Letra : in out Character);

   --Procedimiento para escribir una palabra en pantalla.
   procedure Put (
         P : Palabra);

   --Procedimiento para copiar dos palabras.
   procedure Copiar (
         Origen  :        Palabra;
         Destino :    out Palabra);

   --Este tipo define el modo en que es escrita una palabra.
   type Tmodo is
         (Minusculas,
          Mayusculas);

   --Procedimiento para convertir una palabra a mayúsculas o a minúsculas.
   procedure Convertir (
         P    : in out Palabra;
         Modo :        Tmodo   := Mayusculas);

   --Esta función compara dos palabras.
   function "=" (
         P,
         Q : Palabra)
     return Boolean;

   --Esta función indica si la palabra está vacía.
   function Palabra_Vacia (
         P : Palabra)
     return Boolean;

   --Esta función indica la longitud de la palabra.
   function Longitud_Palabra (
         P : Palabra)
     return Integer;


private
   Min : constant Integer := 0;
   Max : constant Integer := 30;

   subtype Rango_Letras is Integer range Min..Max;

   type Tpalabra is array (Rango_Letras'First + 1 .. Rango_Letras'Last) of Character;

   type Palabra is
      record
         P : Tpalabra     := (others => ' ');
         N : Rango_Letras := Rango_Letras'First;
      end record;
end Def_Palabras;