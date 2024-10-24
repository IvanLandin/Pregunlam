<?php
use PHPUnit\Framework\TestCase;
require_once ("../../model/PartidaModel.php");
require_once ("../../model/PreguntaModel.php");
require_once ("../../model/UserModel.php");
require_once ("../../helper/FileEmailSender.php");
require_once ("Usuario.php");
require_once ("Partida.php");
require_once ("Pregunta.php");
require_once ("Categoria.php");
require_once ("Estado.php");


final class ExampleTest extends TestCase
{
    
    private $userModel; // Instancia del modelo
    private $db; // La conexión a la base de datos
    
    private $partidaModel;
    
    private $preguntaModel;
    
    public function setUp(): void
    {
        // Aquí inicializas la conexión a la base de datos
        $this->db = new mysqli("localhost", "root", "", "pregunlam_db");
        
        // Asegúrate de que la conexión fue exitosa
        if ($this->db->connect_error) {
            die("Error de conexión: " . $this->db->connect_error);
        }
        
        // Inicializas el modelo con la conexión
        $this->userModel = new UserModel($this->db);
        $this->partidaModel = new PartidaModel($this->db);
        $this->preguntaModel = new PreguntaModel($this->db);
    }
    

    
    public function testShouldCheckAssertTrue(){
        $this->assertTrue(true);
    }

    public function testShouldCheckAssertEquals(){
        $this->assertEquals("a", "a");
    }
    
    
    public function testGivenExisteUnaPartida(){
        //id_partida	fechaHora_partida	puntaje_partida	estado_partida	id_usuario
        
        $estado = "A";
        $usuario = $this->userModel->getUserById(11);
        
        
        $partida = new Partida();
        $partida->setEstado($estado);
        $partida->setIdUsuario(11);
        
        $this->partidaModel->savePartida($partida);
        
        $usuarioDb = $this->userModel->getUserById(11);
        
        
        $partidaDb = $this->partidaModel->getPartidaById(28);
        
      
        $this->assertEquals($partidaDb["estado_partida"], "A");
        $this-> assertEquals($partidaDb["id_usuario"], $usuarioDb["id_usuario"]);
        $this->assertEquals($partidaDb["puntaje_partida"],$partida->getPuntaje());
        $this->assertEquals($partidaDb["id_partida"],28);
        
    }
    
    public function testQueSePuedaCrearUnaPregunta(){
     
  
        $interrogante = "¿En que año murio Ricardo Fort?";
        $pregunta = new Pregunta();
        $pregunta->setInterrogantePregunta($interrogante);
        
        
        
        $categoria = new Categoria();
        $estado = new Estado();
        
        
        $idPruebaEstado = 25;
        $idPruebaCategoria = 25;
        
        $estado->setIdEstado($idPruebaEstado);
        $estado->setDescripcion("pendiente");
        
        
        $categoria->setIdCategoria($idPruebaCategoria);
        $categoria->setDescripcion("ENTRETENIMIENTO");
        $categoria->setImg("rutaInexistente");
        $categoria->setColor("Rojo");
        
        
        
        $pregunta->setIdCategoria($idPruebaCategoria);
        $pregunta->setIdEstado($idPruebaEstado);
        $pregunta->setIdUsuarioCreador(17);
        
        
        
        
        $usuarioDb = $this->userModel->getUserById(11);
        
        $this->preguntaModel->saveEstado($estado);
        $this->preguntaModel->saveCategoria($categoria);
        $this->preguntaModel->savePregunta($pregunta);
        
        
        
        $preguntaDb = $this->preguntaModel->obtenerPreguntaPorId(4);
        $categoriaDb = $this->preguntaModel->obtenerCategoriaPorId($idPruebaCategoria);
        $estadoDb = $this->preguntaModel->obtenerEstadoPorId($idPruebaEstado);
        
        $this->assertEquals($preguntaDb["interrogante_pregunta"], $interrogante);
      
        $this->assertEquals($preguntaDb["id_estado"], $estadoDb["id_estado"]);
        $this->assertEquals($preguntaDb["id_categoria"], $categoriaDb["id_categoria"]);
     
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
}

