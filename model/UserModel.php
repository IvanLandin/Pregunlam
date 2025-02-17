<?php


class UserModel
{
    private $db;

    public function __construct($database)
    {
        $this->db = $database;
    }

    /**
     * @throws EmailExistsException
     */
    public function emailExists($email)
    {
        $query = $this->db->prepare("SELECT 1 FROM usuario WHERE email_usuario = ?");
        $query->bind_param('s', $email);
        $query->execute();
        $result = $query->get_result()->fetch_all(MYSQLI_ASSOC);
        if (empty($result))
            return false;
        throw new EmailExistsException();
    }

    /**
     * @throws UsernameExistsException
     */
    public function usernameExists($username)
    {
        $query = $this->db->prepare("SELECT 1 FROM usuario WHERE userName_usuario = ?");
        $query->bind_param('s', $username);
        $query->execute();
        $result = $query->get_result()->fetch_all(MYSQLI_ASSOC);
        if (empty($result))
            return false;
        throw new UsernameExistsException();
    }

    public function getUserById($id)
    {
        $query = $this->db->prepare("SELECT * FROM usuario WHERE id_usuario = ?");
        $query->bind_param('i', $id);
        $query->execute();
        return $query->get_result()->fetch_array(MYSQLI_ASSOC);
    }

    public function getUserProfileById($id)
    {
        $estadoActivo = 'a';
        $query = $this->db->prepare("SELECT id_usuario, userName_usuario, maxPuntaje_usuario, img_usuario, pais_usuario
                                    FROM usuario WHERE id_usuario = ? AND estado_usuario = ? AND id_tipo_usuario = 3");
        $query->bind_param('is', $id, $estadoActivo);
        $query->execute();
        return $query->get_result()->fetch_array(MYSQLI_ASSOC);
    }

    public function getUserByUsernameOrEmail($usernameOrEmail, $state)
    {
        $query = $this->db->prepare("SELECT * FROM usuario WHERE (userName_usuario = ? OR email_usuario = ?) AND estado_usuario = ?");
        $query->bind_param('sss', $usernameOrEmail, $usernameOrEmail, $state);
        $query->execute();
        return $query->get_result()->fetch_array(MYSQLI_ASSOC);
    }

    public function getUserByUsernameAndEmail($username, $email, $state)
    {
        $query = $this->db->prepare("SELECT * FROM usuario WHERE userName_usuario = ? AND email_usuario = ? AND estado_usuario = ?");

        $query->bind_param('sss', $username, $email, $state);

        $query->execute();

        return $query->get_result()->fetch_array(MYSQLI_ASSOC);
    }


    /**
     * @throws InvalidGenderException
     */
    public function validateGender($gender)
    {
        return !empty($this->getIdSexo($gender)) ?? throw new InvalidGenderException();
    }

    public function register($fullname, $username, $email, $password, $birthday, $gender, $country, $profilePic, $token)
    {
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
        $defaultUserType = 3;
        $defaultState = 'p';
        $idSexoResult = $this->getIdSexo($gender);

        $query = $this->db->prepare("INSERT INTO usuario (
                    `userName_usuario`,
                    `password_usuario`,
                    `email_usuario`,
                    `img_usuario`,
                    `nombreCompleto_usuario`,
                    `fechaNacimiento_usuario`,
                    `pais_usuario`,
                    `fechaRegistro_usuario`,
                    `estado_usuario`,
                    `token_usuario`,
                    `id_tipo_usuario`,
                    `id_sexo`
        ) VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?)");

        $query->bind_param('ssssssssiii', $username, $hashedPassword, $email, $profilePic, $fullname, $birthday,
            $country, $defaultState, $token, $defaultUserType, $idSexoResult);

        return $query->execute();
    }

    public function updateUser($fullname, $gender, $country, $profilePic, $id_usuario)
    {
        $idSexoResult = $this->getIdSexo($gender);

        if ($profilePic === '') {
            $profilePic = $this->getUserById($id_usuario)['img_usuario'];
        }

        $query = $this->db->prepare("UPDATE usuario SET
                    `img_usuario` = ?,
                    `nombreCompleto_usuario` = ?,
                    `pais_usuario` = ?,
                    `id_sexo` = ?
                    WHERE id_usuario = ?");

        $query->bind_param('sssii', $profilePic, $fullname, $country, $idSexoResult, $id_usuario);

        return $query->execute();
    }

    private function getIdSexo($gender)
    {
        $genero = "$gender";
        $query = $this->db->prepare("SELECT id_sexo FROM sexo WHERE descripcion_sexo LIKE ?");
        $query->bind_param('s', $genero);
        $query->execute();
        return $query->get_result()->fetch_array(MYSQLI_ASSOC)['id_sexo'];
    }


    public function updatePassword($userId, $newPassword)
    {
        // Generar el hash de la nueva contraseña
        $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

        // Ejecutar la consulta para actualizar la contraseña en la base de datos
        $query = $this->db->prepare("UPDATE usuario SET password_usuario = ? WHERE id_usuario = ?");
        $query->bind_param('si', $hashedPassword, $userId); // 'si' -> string, integer
        if ($query->execute()) {
            return true; // Si se ejecutó correctamente
        } else {
            return false; // Si hubo un error en la actualización
        }
    }


    public function validateLogin($username, $password, $estado)
    {
        $query = $this->db->prepare("SELECT password_usuario FROM usuario WHERE estado_usuario = ? AND (userName_usuario = ? OR email_usuario = ?)");
        $query->bind_param('sss', $estado, $username, $username);
        $query->execute();

        $result = $query->get_result()->fetch_assoc();

        return $result && password_verify($password, $result['password_usuario']);
    }

    public function validateActivation($username, $token)
    {
        $nuevoEstado = 'a';
        $query = $this->db->prepare("UPDATE usuario SET estado_usuario = ? WHERE userName_usuario = ? AND token_usuario = ?");
        $query->bind_param('ssi', $nuevoEstado, $username, $token);
        return $this->db->executeStmt($query) == 1;
    }

    public function incrementarCantPreguntasJugadas($idUsuario)
    {
        $estado = 'a';
        $incrementoPreguntasJugadas = 1;
        $query = $this->db->prepare("UPDATE `usuario` SET `cantPreguntasJugadas_usuario`= `cantPreguntasJugadas_usuario` + ?
                                    WHERE id_usuario = ? AND estado_usuario = ?");
        $query->bind_param('iis', $incrementoPreguntasJugadas, $idUsuario, $estado);
        return $query->execute();
    }

    public function incrementarPreguntasCorrectasUsuario($idUsuario)
    {
        $estado = 'a';
        $incrementoPreguntasCorrectas = 1;
        $query = $this->db->prepare("UPDATE `usuario` SET `cantPreguntasCorrectas_usuario`= `cantPreguntasCorrectas_usuario` + ?
                                    WHERE id_usuario = ? AND estado_usuario = ?");
        $query->bind_param('iis', $incrementoPreguntasCorrectas, $idUsuario, $estado);

        return $query->execute();
    }

    public function determinarPuntajeMaximo($usuario, $partida)
    {
        if ($usuario['maxPuntaje_usuario'] < $partida['puntaje_partida']) {
            $estado = 'a';
            $query = $this->db->prepare("UPDATE `usuario` SET `maxPuntaje_usuario` = ?
                                        WHERE id_usuario = ? AND estado_usuario = ?");
            $query->bind_param('iis', $partida['puntaje_partida'], $usuario['id_usuario'], $estado);
            return $query->execute();
        }
        return false;
    }

    public function getTipoUsuario($username)
    {
        $query = $this->db->prepare("SELECT id_tipo_usuario FROM usuario WHERE username_usuario = ?");
        $query->bind_param('s', $username);
        $query->execute();
        $result = $query->get_result()->fetch_assoc();
        return $result['id_tipo_usuario'];
    }

    public function determinarNivelUsuario($usuario)
    {
        if ($usuario['cantPreguntasJugadas_usuario'] > 10) {
            $nivel = ($usuario['cantPreguntasCorrectas_usuario'] / $usuario['cantPreguntasJugadas_usuario']) * 100;

            if ($nivel >= 70) {
                return 'dificil';
            } else if ($nivel <= 30) {
                return 'facil';
            }
        }

        return 'medio';
    }

    public function getRankingUsuarios()
    {
        $query = $this->db->prepare("SELECT
                                            u.id_usuario,
                                            u.userName_usuario,
                                            p.fechaHora_partida,
                                            p.puntaje_partida
                                    FROM usuario u
                                    JOIN partida p ON u.id_usuario = p.id_usuario
                                    AND p.puntaje_partida = (SELECT MAX(p2.puntaje_partida) FROM partida p2 WHERE p2.id_usuario = u.id_usuario)
                                    GROUP BY u.id_usuario
                                    ORDER BY p.puntaje_partida DESC
                                    LIMIT 50");
        $query->execute();
        return $query->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    public function getRankingPositions($ranking)
    {
        $i = 1;
        $lastScore = 0;
        $lastPos = 0;

        foreach ($ranking as &$posicion) {
            $myPosition = $i;

            if ($lastScore > 0 && $posicion['puntaje_partida'] == $lastScore)
                $myPosition = $lastPos;

            $lastScore = $posicion['puntaje_partida'];
            $lastPos = $myPosition;

            ++$i;
            $posicion['posicion'] = $myPosition;
        }

        return $ranking;
    }

    public function obtenerNumeroDeUsuariosPorSexo()
    {
        $query = $this->db->prepare("
        SELECT S.descripcion_sexo, COUNT(U.id_usuario) AS numero_usuario
        FROM usuario U
        JOIN sexo S ON U.id_sexo = S.id_sexo
        GROUP BY S.descripcion_sexo
    ");
        $query->execute();
        return $query->get_result()->fetch_all(MYSQLI_ASSOC);
    }


    public function obtenerCantidadUsuariosNuevos($fechaInicio, $fechaFin, $filtroTiempo)
    {
        if ($filtroTiempo === 'anio') {
            $query = $this->db->prepare("
            SELECT MONTH(U.fechaRegistro_usuario) AS mes_registro, COUNT(U.id_usuario) AS numero_usuarios_nuevos
            FROM usuario U
            WHERE U.fechaRegistro_usuario BETWEEN ? AND ?
            GROUP BY MONTH(U.fechaRegistro_usuario)
            ORDER BY MONTH(U.fechaRegistro_usuario) ASC
        ");
        } elseif ($filtroTiempo === 'mes') {
            $query = $this->db->prepare("
            SELECT DATE(U.fechaRegistro_usuario) AS mes_registro, COUNT(U.id_usuario) AS numero_usuarios_nuevos
            FROM usuario U
            WHERE U.fechaRegistro_usuario BETWEEN ? AND ?
            GROUP BY DATE(U.fechaRegistro_usuario)
            ORDER BY DATE(U.fechaRegistro_usuario) ASC
        ");
        } elseif ($filtroTiempo === 'semana') {
            $query = $this->db->prepare("
            SELECT DAYOFWEEK(U.fechaRegistro_usuario) AS dia_semana, COUNT(U.id_usuario) AS numero_usuarios_nuevos
            FROM usuario U
            WHERE U.fechaRegistro_usuario BETWEEN ? AND ?
            GROUP BY DAYOFWEEK(U.fechaRegistro_usuario)
            ORDER BY DAYOFWEEK(U.fechaRegistro_usuario) ASC
        ");
        } else {
            throw new InvalidArgumentException("Filtro de tiempo no válido: $filtroTiempo");
        }

        $query->bind_param('ss', $fechaInicio, $fechaFin);
        $query->execute();

        $result = $query->get_result();
        $usuarios = $result->fetch_all(MYSQLI_ASSOC);

        if ($filtroTiempo === 'anio') {

            $mesesIniciales = [
                1 => 'ene',
                2 => 'feb',
                3 => 'mar',
                4 => 'abr',
                5 => 'may',
                6 => 'jun',
                7 => 'jul',
                8 => 'ago',
                9 => 'sep',
                10 => 'oct',
                11 => 'nov',
                12 => 'dic',
            ];

            $mesActual = date('n');
            $siguienteMes = ($mesActual % 12) + 1;

            $todosLosMeses = array_merge(range($siguienteMes, 12), range(1, $siguienteMes - 1));

            $mesesConUsuarios = [];
            foreach ($usuarios as $registro) {
                $mesesConUsuarios[$registro['mes_registro']] = $registro['numero_usuarios_nuevos'];
            }

            $usuariosFinales = [];
            foreach ($todosLosMeses as $mes) {
                $usuariosFinales[] = [
                    'mes_registro' => $mesesIniciales[$mes],
                    'numero_usuarios_nuevos' => $mesesConUsuarios[$mes] ?? 0,
                ];
            }
            return $usuariosFinales;
        }

        if ($filtroTiempo === 'mes') {
            return $usuarios;
        }

        if ($filtroTiempo === 'semana') {
            $diasSemana = [
                1 => 'Lunes',
                2 => 'Martes',
                3 => 'Miércoles',
                4 => 'Jueves',
                5 => 'Viernes',
                6 => 'Sábado',
                7 => 'Domingo',
            ];


            $diaFin = date('N', strtotime($fechaFin));
            $diasOrdenados = [];
            foreach (range(1, 7) as $i) {
                $diaReordenado = ($diaFin + $i - 1) % 7 + 1;
                $diasOrdenados[] = $diaReordenado;
            }


            $diasConUsuarios = [];
            foreach ($usuarios as $registro) {
                $diaReal = $registro['dia_semana'];
                $diaAjustado = $diaReal === 1 ? 7 : $diaReal - 1;
                $diasConUsuarios[$diaAjustado] = $registro['numero_usuarios_nuevos'];
            }

            $usuariosFinales = [];
            foreach ($diasOrdenados as $dia) {
                $usuariosFinales[] = [
                    'mes_registro' => $diasSemana[$dia],
                    'numero_usuarios_nuevos' => $diasConUsuarios[$dia] ?? 0,
                ];
            }

            return $usuariosFinales;
        }


        return [];
    }


}
