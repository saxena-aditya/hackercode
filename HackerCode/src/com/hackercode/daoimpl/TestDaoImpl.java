package com.hackercode.daoimpl;

public class TestDaoImpl {
	if(!isset(session.getId())) {
	    echo "Session Timeout";
	}
	if( !isset($_GET['testid']) || !isset($_GET['dur']) || !isset($_GET['tot']) )
	{
		echo "<h1>Access Denied!</h1>";
			
			exit;
	}
	include_once 'oesdb.php';

		$r2=executeQuery("select status from test where testid=$_GET[testid]");
		$row22=mysql_fetch_array($r2);
		if($row22[0] == 0)
		{
			echo "<h1>Access Denied!</h1>";
			closedb();
			exit;
		}


	$r=executeQuery("select starttime,status from studenttest where stdid=$_SESSION[stdid] and testid=$_GET[testid]");
	if(mysql_num_rows($r) > 0)
	{
			$row=mysql_fetch_array($r);
			if($row[1] == 'over' && $_GET['take']==1)
			{
				echo "<h1>You have already attempted the test on: $row[0]</h1>";
				closedb();
				exit;
			}
	}

	if(isset($_SESSION['test']) &&  $_SESSION['test'] == "on" && $_GET['take']==1)
	{
		echo "<h1>You have already started a Test. You cannot appear in more than one Test at a time.</h1>";
		exit;
	}
	else
	{
		$_SESSION['test']="on";
	}
		
	$rr3=executeQuery("select duration,totalquestions from test where testid=$_GET[testid]");
		$row3=mysql_fetch_array($rr3);
		$dur=$row3[0];
		$tot=$row3[1];
		
	closedb();

	?>

}
