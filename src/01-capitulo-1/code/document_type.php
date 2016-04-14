<?php

// Clase de referencia para los tipos de documento
class DocumentType {
  // Las constantes representan los valores de los datos de referencia
  const DNI = 1,
        LC = 2,
        LE = 3,
        PASAPORTE = 4;

  // Método utilizado para mostrar los datos con sus descripciones
  static public function getAll() {
    return array(
      DNI => 'DNI',
      LC => 'LC',
      LE => 'LE',
      PASAPORTE => 'Pasaporte'
    );
  }
}

// Ejemplo: asumiendo un objeto $person que admite un tipo de documento
//          se obtiene el identificador del tipo de documento "DNI" y
//          se lo asigna.
$dni = DocumentType::DNI;
$person->setDocumentType($dni);