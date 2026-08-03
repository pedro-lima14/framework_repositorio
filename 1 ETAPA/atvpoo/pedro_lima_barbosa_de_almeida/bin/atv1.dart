import 'dart:io';

  class Filme{
  final String titulo;
  final String genero;

  Filme({required this.titulo, required this.genero});

  @override
  String toString(){
    return "Título: $titulo, gênero: $genero";
  }
}


void main(){

  Filme filme1 = Filme(titulo:"Frozen", genero: "Infantil");
  Filme filme2 = Filme(titulo:"Vingadores", genero: "Ação");

  print(filme1);
  print(filme2);





}
