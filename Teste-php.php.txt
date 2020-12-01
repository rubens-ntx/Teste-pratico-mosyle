<?php

//Classe
class Thesaurus {
		// variável da classe
    private $thesaurus;
   
		//variável para retorno do objeto json
    private $data = array();
    
		//construtor da classe, recebe os dados ao instanciar (new Thesaurus())
    function __construct($thesaurus) {
        $this->thesaurus = $thesaurus;
    }
    
		//função de retornar os sinonimos no formato JSON de acordo
    public function getSynonyms($word) {
        
				//array_key_exists: função para verificar se o existe o item da lista
        if (!array_key_exists($word, $this->thesaurus)) {
						//incluindo elemento JSON "word" com valor default: agelast
            $data['word'] = "agelast";

						//incluindo elemento JSON "synonyms" com array vazio
            $data['synonyms'] = array();
        }
        else{
						//incluindo elemento JSON "word" com o valor de argumento recebido
            $data['word'] = $word;

						//elemento JSON "synonyms" com a lista de elementos recebidos pelo construtor filtrado pelo valor recebido do método
            $data['synonyms'] = $this->thesaurus[$word];
        }
        
				//transformando $data em JSON
        $json = json_encode($data, JSON_PRETTY_PRINT);
            
				//retorno da função
        return $json;
    }
}

//criando objeto Thesaurus
$thesaurus = new Thesaurus(array (
    "buy" => array("purchase"),
    "big" => array("great", "large")
));

//Testando a função getSynonyms
echo $thesaurus->getSynonyms("big");

?>