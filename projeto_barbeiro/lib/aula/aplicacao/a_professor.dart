class AProfessor {
  Professor professor;
  late IDAOProfessor dao;

  AProfessor({required this.professor, required this.dao}){
    
  }

  salvar(){
    professor.incluir();
  }
}
