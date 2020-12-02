<?php

class Thesaurus {
    private $thesaurus;
   
    private $data = array();
	
    function __construct($thesaurus) {
        $this->thesaurus = $thesaurus;
    }
	
    public function getSynonyms($word) {
	    
        if (!array_key_exists($word, $this->thesaurus)) {
						
            $data['word'] = "agelast";

						
            $data['synonyms'] = array();
        }
        else{
						
            $data['word'] = $word;

						
            $data['synonyms'] = $this->thesaurus[$word];
        }
	    
        $json = json_encode($data, JSON_PRETTY_PRINT);
            
        return $json;
    }
}
$thesaurus = new Thesaurus(array (
    "buy" => array("purchase"),
    "big" => array("great", "large")
));

echo $thesaurus->getSynonyms("big");

?>
