with ada.integer_text_io, Def_Palabras; use ada.integer_text_io, Def_Palabras;
procedure Prueba is
   P, Q : Palabra;
   c : character;
   
begin
   def_palabras.Get(P,c);
   Put(P);
   put(longitud_palabra(p));
   end prueba;
