<?php

	class Conexion{
		private $host ="localhost";
		private $user ="root";
		private $password ="";
		private $db = "banco_jcg";
		private $conect;	

		public function __construct(){
			$conectionString = "mysql:hos=".$this->host."dbname".$this->db."charset=uft8";
			try {
				$this->connect = new PDO($conectionString,$this->user,$this->password);
				$this->connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				echo "Conexión Exitosa";
			} catch (Exception $e) {
				$this->connect = 'Error de Conexión';
				echo "ERROR: ". $e->getMessage();
			}
		}
	}
	$conect = new Conexion();
?>