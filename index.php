<?php
//routeur
$page=htmlentities($_GET['page']);
$pages=scandir('pages');
if (empty($page)){
  header("Location:index.php?page=accueil");
} else if (!empty($page)&& in_array($_GET['page'].".php",$pages)) {
  $chemin = $_GET['page'].'.php';
  require 'pages/'.$chemin;
}else if ($page!="accueil") {
  header("Location:index.php?page=404");
}
?>
