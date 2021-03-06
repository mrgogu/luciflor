<?php
/**
 * 
 * Projects Class
 * 
 * 
 * */
require_once(LIB_DIR . "/admin/module.php" );
include(LIB_DIR.'upload/fupload.class.php');

class projects extends adminModule
{
	public $moduleTitle  = "Projects";
    public $moduleName   = "projects";
    public $tableName  	 = "projects";
    public $idName     	 = "id";
    public $priorityName = "status";
    public $uplphoto     = "da";
    public $tplName      = "projects";
    //public $langName     = "lang";

    var $methodsMap = array("delete_file", "inpage_list");

    function initFields(){

        //$this->columnsList[]  = new adminField("lang", "Language", "lang", 0, 1);
        $this->columnsList[]  = new adminField("category_id", "Category", "list", null, 1, array("query"=>"SELECT id as value, name FROM project_category WHERE lang = 1 GROUP BY id"));
        $this->columnsList[]  = new adminField("title", "Title", "text", 2, 2);
    	$this->columnsList[]  = new adminField("text", "Text", "editor", null, 3);
        $this->columnsList[]  = new adminField("date", "Date", "datepicker", 4, 4);
        $this->columnsList[]  = new adminField("client", "Client", "text", null, 5);
        $this->columnsList[]  = new adminField("location", "Locatie", "text", null, 6);
        $this->columnsList[]  = new adminField("status_proiect", "Status", "text", null, 7);
        $this->columnsList[]  = new adminField("status", "Activ", "switch", 8, 8);
    	$this->columnsList[]  = new adminField("photos", "Picture", "upload", null, 9, array("dir"=>UPLOAD_DIR."photos/", "url"=>UPLOAD_URL."photos/", "extensions"=>array("jpg","jpeg","gif","png")));

    }

    /*function getQuery() {
        $q="SELECT *, GROUP_CONCAT(lang) as langkeys FROM article GROUP BY id";
        return $q;
    }*/

    function delete_file()
    {
        if(isset($_GET[$this->idName]) && $_GET[$this->idName]!=''){
            echo $id = filter_var($_GET[$this->idName], FILTER_SANITIZE_NUMBER_INT);
            $filename = filter_var(getFromRequest($_GET, "file_name"), FILTER_SANITIZE_STRING);
            if($filename){

                $table = clone $this->table;
                $table->load( $id );

                $file = @$table->$filename;

                if( trim($file)!=""){
                    $table->$filename = "";
                    $table->store();
                    unlink(UPLOAD_DIR."photos/{$file}");
                }
            }
            systemMessage::addMessage("File removed!");
            redirect("index.php?obj={$_GET['obj']}&action=page_act&act=upd&{$this->idName}=".$id);
        }
    }

    function inpage_list() {
        global $smarty;
        $doc = SDocument::getInstance();
        $db=SDatabase::getInstance();
        objInitVar($this, "admin/projects/inpage_list.tpl", "inpage_list", "inpage_list", "", "", "");

        $id = $db->getEscaped($_GET['id']);

        $smarty->display($this->tplName);
    }

}
?>